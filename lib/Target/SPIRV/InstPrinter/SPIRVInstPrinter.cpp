//=- SPIRVInstPrinter.cpp - SPIR-V assembly instruction printing ------------=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief Print MCInst instructions to SPIR-V format.
///
//===----------------------------------------------------------------------===//

#include "InstPrinter/SPIRVInstPrinter.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRV.h"
//#include "SPIRVMachineFunctionInfo.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetRegisterInfo.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

#include "SPIRVGenAsmWriter.inc"

SPIRVInstPrinter::SPIRVInstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                                   const MCRegisterInfo &MRI)
    : MCInstPrinter(MAI, MII, MRI) {}

void SPIRVInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {}

void SPIRVInstPrinter::printInst(const MCInst *MI, raw_ostream &OS,
                                 StringRef Annot,
                                 const MCSubtargetInfo & /*STI*/) {
  // Print the instruction (this uses the AsmStrings from the .td files).
  printInstruction(MI, OS);

  // Print any additional variadic operands.
//  const MCInstrDesc &Desc = MII.get(MI->getOpcode());
//  if (Desc.isVariadic())
//    for (auto i = Desc.getNumOperands(), e = MI->getNumOperands(); i < e; ++i) {
//      if (i != 0)
//        OS << ", ";
//      printOperand(MI, i, OS);
//    }

  // Print any added annotation.
  printAnnotation(OS, Annot);
}

void SPIRVInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                    raw_ostream &O) {}

void SPIRVInstPrinter::printAddressingModelOperand(const MCInst *MI,
                                                   unsigned OpNo,
                                                   raw_ostream &OS) {
  const MCOperand& Op = MI->getOperand(OpNo);
  assert(Op.isImm() && "AddressingModel operand must be an immediate.");

  switch (Op.getImm()) {
  case SPIRV::Logical:    OS << "Logical";    break;
  case SPIRV::Physical32: OS << "Physical32"; break;
  case SPIRV::Physical64: OS << "Physical64"; break;
  default:
    llvm_unreachable("Unsupported AddressingModel.");
  }
}

void SPIRVInstPrinter::printMemoryModelOperand(const MCInst *MI, unsigned OpNo,
                                               raw_ostream &OS) {
  const MCOperand& Op = MI->getOperand(OpNo);
  assert(Op.isImm() && "MemoryModel operand must be an immediate.");

  switch (Op.getImm()) {
  case SPIRV::Simple:  OS << "Simple";  break;
  case SPIRV::GLSL450: OS << "GLSL450"; break;
  case SPIRV::OpenCL:  OS << "OpenCL";  break;
  default:
    llvm_unreachable("Unsupported MemoryModel.");
  }
}
