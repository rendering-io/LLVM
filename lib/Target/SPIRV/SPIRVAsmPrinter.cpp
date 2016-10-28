//===-- SPIRVAsmPrinter.cpp - SPIR-V LLVM assembly writer -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains a printer that converts from our internal
/// representation of machine-dependent LLVM code to the SPIR-V assembly
/// language.
///
//===----------------------------------------------------------------------===//

#include "InstPrinter/SPIRVInstPrinter.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "MCTargetDesc/SPIRVTargetStreamer.h"
#include "SPIRV.h"
#include "SPIRVMCInstLower.h"
#include "SPIRVMachineFunctionInfo.h"
#include "SPIRVRegisterInfo.h"
#include "SPIRVSubtarget.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/CodeGen/Analysis.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

namespace {

class SPIRVAsmPrinter final : public AsmPrinter {
  const MachineRegisterInfo *MRI;
  const SPIRVFunctionInfo *MFI;

public:
  SPIRVAsmPrinter(TargetMachine &TM, std::unique_ptr<MCStreamer> Streamer)
      : AsmPrinter(TM, std::move(Streamer)), MRI(nullptr), MFI(nullptr) {}

private:
  StringRef getPassName() const override {
    return "SPIR-V Assembly Printer";
  }

  //===------------------------------------------------------------------===//
  // MachineFunctionPass Implementation.
  //===------------------------------------------------------------------===//

  bool runOnMachineFunction(MachineFunction &MF) override {
    MRI = &MF.getRegInfo();
    MFI = MF.getInfo<SPIRVFunctionInfo>();
    return AsmPrinter::runOnMachineFunction(MF);
  }

  //===------------------------------------------------------------------===//
  // AsmPrinter Implementation.
  //===------------------------------------------------------------------===//

  void EmitStartOfAsmFile(Module &M) override;
  void EmitEndOfAsmFile(Module &M) override;
  void EmitJumpTableInfo() override;
  void EmitConstantPool() override;
  void EmitFunctionBodyStart() override;
  void EmitFunctionBodyEnd() override;
  void EmitInstruction(const MachineInstr *MI) override;
  const MCExpr *lowerConstant(const Constant *CV) override;
  bool PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                       unsigned AsmVariant, const char *ExtraCode,
                       raw_ostream &OS) override;
  bool PrintAsmMemoryOperand(const MachineInstr *MI, unsigned OpNo,
                             unsigned AsmVariant, const char *ExtraCode,
                             raw_ostream &OS) override;

  MVT getRegType(unsigned RegNo) const;
  SPIRVTargetStreamer *getTargetStreamer();

  void emitCapabilities();
  void emitExtensions();
  void emitExtInstImports();
  void emitMemoryModel();
  void emitEntryPoints();
  void emitExecutionModes();
};

} // end anonymous namespace

//===----------------------------------------------------------------------===//
// Helpers.
//===----------------------------------------------------------------------===//

MVT SPIRVAsmPrinter::getRegType(unsigned RegNo) const {
  const TargetRegisterClass *TRC = MRI->getRegClass(RegNo);
  for (MVT T : {MVT::i32, MVT::i64, MVT::f32, MVT::f64, MVT::v16i8, MVT::v8i16,
                MVT::v4i32, MVT::v4f32})
    if (TRC->hasType(T))
      return T;
  DEBUG(errs() << "Unknown type for register number: " << RegNo);
  llvm_unreachable("Unknown register type");
  return MVT::Other;
}
/*
std::string SPIRVAsmPrinter::regToString(const MachineOperand &MO) {
  unsigned RegNo = MO.getReg();
  assert(TargetRegisterInfo::isVirtualRegister(RegNo) &&
         "Unlowered physical register encountered during assembly printing");
  assert(!MFI->isVRegStackified(RegNo));
  unsigned WAReg = MFI->getWAReg(RegNo);
  assert(WAReg != SPIRVFunctionInfo::UnusedReg);
  return '$' + utostr(WAReg);
}
*/
SPIRVTargetStreamer *SPIRVAsmPrinter::getTargetStreamer() {
  MCTargetStreamer *TS = OutStreamer->getTargetStreamer();
  return static_cast<SPIRVTargetStreamer *>(TS);
}

//===----------------------------------------------------------------------===//
// SPIRVAsmPrinter Implementation.
//===----------------------------------------------------------------------===//

void SPIRVAsmPrinter::EmitStartOfAsmFile(Module &M) {
  // The instructions of a SPIR-V module must be in the following order. For 
  // sections earlier than function definitions, it is invalid to use 
  // instructions other than those indicated.

  // All OpCapability instructions.
  emitCapabilities();

  // Optional OpExtension instructions (extensions to SPIR-V).
  emitExtensions();

  // Optional OpExtInstImport instructions.
  emitExtInstImports();

  // The single required OpMemoryModel instruction.
  emitMemoryModel();

  // All entry point declarations, using OpEntryPoint.
  emitEntryPoints();

  // All execution mode declarations, using OpExecutionMode.
  emitExecutionModes();

  // These debug instructions, which must be in the following order:
  // all OpString, OpSourceExtension, OpSource, and OpSourceContinued, without forward references.
  // all OpName and all OpMemberName
  // All annotation instructions:
  // all decoration instructions (OpDecorate, OpMemberDecorate, OpGroupDecorate, OpGroupMemberDecorate, and OpDecorationGroup).

  // All type declarations (OpTypeXXX instructions), all constant instructions, and all global variable declarations (all OpVariable instructions whose Storage Class is not Function). This is the preferred location for OpUndef instructions, though they can also appear in function bodies. All operands in all these instructions must be declared before being used. Otherwise, they can be in any order. This section is the first section to allow use of OpLine debug information.

  // All function declarations ("declarations" are functions without a body; there is no forward declaration to a function with a body). A function declaration is as follows.
  // 
  // Function declaration, using OpFunction.
  // 
  // Function parameter declarations, using OpFunctionParameter.
  // 
  // Function end, using OpFunctionEnd.
  // 
  // All function definitions (functions with a body). A function definition is as follows.
  // 
  // Function definition, using OpFunction.
  // 
  // Function parameter declarations, using OpFunctionParameter.
  // 
  // Block
  // 
  // Block
  // 
  // …
  // 
  // Function end, using OpFunctionEnd.
}

void SPIRVAsmPrinter::EmitEndOfAsmFile(Module &M) {

}

void SPIRVAsmPrinter::EmitConstantPool() {
  assert(MF->getConstantPool()->getConstants().empty() &&
         "SPIRV disables constant pools");
}

void SPIRVAsmPrinter::EmitJumpTableInfo() {
  // Nothing to do; jump tables are incorporated into the instruction stream.
}

void SPIRVAsmPrinter::EmitFunctionBodyStart() {
  AsmPrinter::EmitFunctionBodyStart();
}

void SPIRVAsmPrinter::EmitFunctionBodyEnd() {
  getTargetStreamer()->emitEndFunc();
}

void SPIRVAsmPrinter::EmitInstruction(const MachineInstr *MI) {
  DEBUG(dbgs() << "EmitInstruction: " << *MI << '\n');

  switch (MI->getOpcode()) {
    default: {
      SPIRVMCInstLower MCInstLowering(OutContext, *this);
      MCInst TmpInst;
      MCInstLowering.Lower(MI, TmpInst);
      EmitToStreamer(*OutStreamer, TmpInst);
      break;
    }
  }
}

const MCExpr *SPIRVAsmPrinter::lowerConstant(const Constant *CV) {
//  if (const GlobalValue *GV = dyn_cast<GlobalValue>(CV))
//    if (GV->getValueType()->isFunctionTy())
//      return MCSymbolRefExpr::create(
//          getSymbol(GV), MCSymbolRefExpr::VK_SPIRV_FUNCTION, OutContext);
  return AsmPrinter::lowerConstant(CV);
}

bool SPIRVAsmPrinter::PrintAsmOperand(const MachineInstr *MI,
                                            unsigned OpNo, unsigned AsmVariant,
                                            const char *ExtraCode,
                                            raw_ostream &OS) {
  if (AsmVariant != 0)
    report_fatal_error("There are no defined alternate asm variants");

  // First try the generic code, which knows about modifiers like 'c' and 'n'.
  if (!AsmPrinter::PrintAsmOperand(MI, OpNo, AsmVariant, ExtraCode, OS))
    return false;

  return true;
}

bool SPIRVAsmPrinter::PrintAsmMemoryOperand(const MachineInstr *MI,
                                                  unsigned OpNo,
                                                  unsigned AsmVariant,
                                                  const char *ExtraCode,
                                                  raw_ostream &OS) {
  if (AsmVariant != 0)
    report_fatal_error("There are no defined alternate asm variants");

  return AsmPrinter::PrintAsmMemoryOperand(MI, OpNo, AsmVariant, ExtraCode, OS);
}

void SPIRVAsmPrinter::emitCapabilities() {

}

void SPIRVAsmPrinter::emitExtensions() {

}

void SPIRVAsmPrinter::emitExtInstImports() {

}

void SPIRVAsmPrinter::emitMemoryModel() {

}

void SPIRVAsmPrinter::emitEntryPoints() {

}

void SPIRVAsmPrinter::emitExecutionModes() {

}

// Force static initialization.
extern "C" void LLVMInitializeSPIRVAsmPrinter() {
  RegisterAsmPrinter<SPIRVAsmPrinter> X(getTheSPIRVTarget());
}
