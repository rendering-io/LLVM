//===-- SPIRVPrologEpilogPass.cpp - SPIRV prolog/epilog inserter ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file is a copy of the generic LLVM PrologEpilogInserter pass, modified
// to remove unneeded functionality and to handle virtual registers. Most code
// here is a copy of PrologEpilogInserter.cpp.
//
//===----------------------------------------------------------------------===//

#include "SPIRV.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/Pass.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetRegisterInfo.h"
#include "llvm/Target/TargetSubtargetInfo.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-prolog-epilog"

namespace {
class SPIRVPrologEpilogPass : public MachineFunctionPass {
public:
  static char ID;
  SPIRVPrologEpilogPass() : MachineFunctionPass(ID) {}

  bool runOnMachineFunction(MachineFunction &MF) override;
  StringRef getPassName() const override;
};
}

MachineFunctionPass *llvm::createSPIRVPrologEpilogPass() {
  return new SPIRVPrologEpilogPass();
}

char SPIRVPrologEpilogPass::ID = 0;

StringRef SPIRVPrologEpilogPass::getPassName() const {
  return "SPIR-V Prolog-Epilog Inserter"; 
}

bool SPIRVPrologEpilogPass::runOnMachineFunction(MachineFunction &MF) {
  const TargetSubtargetInfo &STI = MF.getSubtarget();
  const TargetFrameLowering &TFI = *STI.getFrameLowering();
  const TargetRegisterInfo &TRI = *STI.getRegisterInfo();
  bool Modified = true;

  // Add function prolog/epilog
  TFI.emitPrologue(MF, MF.front());

  TFI.emitEpilogue(MF, *MF.rbegin());

  return Modified;
}
