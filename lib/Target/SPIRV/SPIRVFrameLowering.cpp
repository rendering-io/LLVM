//===-- SPIRVFrameLowering.cpp - SPIR-V Frame Lowering ---------------------==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the SPIR-V implementation of
/// TargetFrameLowering class.
///
//===----------------------------------------------------------------------===//

#include "SPIRVFrameLowering.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVInstrInfo.h"
#include "SPIRVMachineFunctionInfo.h"
#include "SPIRVSubtarget.h"
#include "SPIRVTargetMachine.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/Debug.h"
using namespace llvm;

#define DEBUG_TYPE "spirv-frame-info"

SPIRVFrameLowering::~SPIRVFrameLowering() {}

void SPIRVFrameLowering::emitPrologue(MachineFunction &MF,
                                      MachineBasicBlock &MBB) const {
  const SPIRVSubtarget &ST = MF.getSubtarget<SPIRVSubtarget>();
  const SPIRVRegisterInfo &TRI = *ST.getRegisterInfo();
  const SPIRVInstrInfo *TII = ST.getInstrInfo();
  MachineRegisterInfo &MRI = MF.getRegInfo();

  DebugLoc DL = DebugLoc();

  
  // Create a label instruction.
  const MachineInstrBuilder &MIB = BuildMI(MBB, MBB.begin(), DL,
                                           TII->get(SPIRV::OpLabel));

  // Create an OpFunction instruction.
  BuildMI(MBB, MBB.begin(), DL, TII->get(SPIRV::OpFunction))
    .addImm(static_cast<int64_t>(SPIRV::FunctionControl::None));

  // Get the expected register class for the destination register.
  MachineInstr *MI = MIB;
  const TargetRegisterClass *TRC = TII->getRegClass(MI->getDesc(), 0, &TRI, MF);
}

void SPIRVFrameLowering::emitEpilogue(MachineFunction &MF,
                                            MachineBasicBlock &MBB) const {
  const SPIRVSubtarget &ST = MF.getSubtarget<SPIRVSubtarget>();
  const SPIRVInstrInfo *TII = ST.getInstrInfo();

  DebugLoc DL = DebugLoc();

  // Create a function end instruction.
  const MachineInstrBuilder &MIB = BuildMI(MBB, MBB.end(), DL,
                                           TII->get(SPIRV::OpFunctionEnd));

}

bool SPIRVFrameLowering::hasFP(const MachineFunction &MF) const { 
  return false;
}

bool SPIRVFrameLowering::hasReservedCallFrame(const MachineFunction &MF) const { 
  return false;
}

MachineBasicBlock::iterator
SPIRVFrameLowering::eliminateCallFramePseudoInstr(
    MachineFunction &MF, MachineBasicBlock &MBB,
    MachineBasicBlock::iterator I) const {
  assert(!I->getOperand(0).getImm() && hasFP(MF) &&
         "Call frame pseudos should only be used for dynamic stack adjustment");
  const auto *TII = MF.getSubtarget<SPIRVSubtarget>().getInstrInfo();
  return MBB.erase(I);
}