//===-- SPIRVTrackCapabilities.cpp - SPIR-V capability tracking -----------===//
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

#include "SPIRV.h"
#include "SPIRVSubtarget.h"
#include "SPIRVMachineModuleInfo.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
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

#define DEBUG_TYPE "spirv-track-capability"

namespace {
class SPIRVTrackCapabilityPass : public MachineFunctionPass {
public:
  static char ID;
  SPIRVTrackCapabilityPass() : MachineFunctionPass(ID) {}

  bool runOnMachineFunction(MachineFunction &MF) override;
};
}

MachineFunctionPass *llvm::createSPIRVTrackCapabilityPass() {
  return new SPIRVTrackCapabilityPass();
}

char SPIRVTrackCapabilityPass::ID = 0;

bool SPIRVTrackCapabilityPass::runOnMachineFunction(MachineFunction &MF) {
  DEBUG(dbgs() << "********** Track Capabilities **********\n"
                  "********** Function: "
               << MF.getName() << '\n');  
  const SPIRVSubtarget &ST = MF.getSubtarget<SPIRVSubtarget>();
  const SPIRVInstrInfo *TII = ST.getInstrInfo();  
  SPIRVMachineModuleInfo &TMI = MF.getMMI().getObjFileInfo<SPIRVMachineModuleInfo>();
  
  bool Modified = false;
 
  TMI.addRequiredCapability(SPIRV::Shader);

  // Iterate over each basic block in the function.
  for (auto& MBB: MF) {
    // Iterate over each instruction in the basic block.
    for (auto& MI: MBB) {
      // Check the capability list for each instruction.
      for (auto C: TII->getRequiredCapabilities(MI)) {
        TMI.addRequiredCapability(C);
      }
    }
  }

  return Modified;
}
