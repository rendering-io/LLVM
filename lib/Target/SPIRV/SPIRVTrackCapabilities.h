//===--- SPIRVTrackCapabilities.h - SPIR-V capability tracking ------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This pass traverses all machine instructions and compiles a list of the 
// required capabilities for the module.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVTRACKCAPABILITIES_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVTRACKCAPABILITIES_H

//#include "SPIRV.h"
//#include "SPIRVSubtarget.h"
//#include "SPIRVMachineModuleInfo.h"
//#include "MCTargetDesc/SPIRVMCTargetDesc.h"
//#include "llvm/CodeGen/MachineFrameInfo.h"
//#include "llvm/CodeGen/MachineFunction.h"
//#include "llvm/CodeGen/MachineFunctionPass.h"
//#include "llvm/Pass.h"
//#include "llvm/Support/Debug.h"
//#include "llvm/Support/raw_ostream.h"
//#include "llvm/Target/TargetFrameLowering.h"
//#include "llvm/Target/TargetRegisterInfo.h"
//#include "llvm/Target/TargetSubtargetInfo.h"

namespace llvm {
class SPIRVTrackCapabilityPass : public ModulePass {
public:
  static char ID;
  SPIRVTrackCapabilityPass() : ModulePass(ID) {}

  bool runOnMachineFunction(MachineFunction &MF);
  bool runOnModule(Module &M) override;

  StringRef getPassName() const override;
  void getAnalysisUsage(AnalysisUsage &AU) const override;
};
}

#endif // LLVM_LIB_TARGET_SPIRV_SPIRVTRACKCAPABILITIES_H
