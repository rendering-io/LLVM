//===-- SPIRVRegisterInfo.cpp - SPIRV Register Information ----===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the SPIRV implementation of the
/// TargetRegisterInfo class.
///
//===----------------------------------------------------------------------===//

#include "SPIRVRegisterInfo.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVFrameLowering.h"
#include "SPIRVInstrInfo.h"
#include "SPIRVMachineFunctionInfo.h"
#include "SPIRVSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetOptions.h"
using namespace llvm;

#define DEBUG_TYPE "wasm-reg-info"

#define GET_REGINFO_TARGET_DESC
#include "SPIRVGenRegisterInfo.inc"

SPIRVRegisterInfo::SPIRVRegisterInfo(const Triple &TT)
    : SPIRVGenRegisterInfo(0), TT(TT) {}

const MCPhysReg *
SPIRVRegisterInfo::getCalleeSavedRegs(const MachineFunction *) const {
  static const MCPhysReg CalleeSavedRegs[] = {0};
  return CalleeSavedRegs;
}

BitVector
SPIRVRegisterInfo::getReservedRegs(const MachineFunction & /*MF*/) const {
  BitVector Reserved(getNumRegs());
  for (auto Reg : {SPIRV::SP32, SPIRV::SP64, SPIRV::FP32,
                   SPIRV::FP64})
    Reserved.set(Reg);
  return Reserved;
}

void SPIRVRegisterInfo::eliminateFrameIndex(
    MachineBasicBlock::iterator II, int SPAdj, unsigned FIOperandNum,
    RegScavenger * /*RS*/) const {
}

unsigned
SPIRVRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  static const unsigned Regs[2][2] = {
      /*            !isArch64Bit       isArch64Bit      */
      /* !hasFP */ {SPIRV::SP32, SPIRV::SP64},
      /*  hasFP */ {SPIRV::FP32, SPIRV::FP64}};
  const SPIRVFrameLowering *TFI = getFrameLowering(MF);
  return SPIRV::FP64;//Regs[TFI->hasFP(MF)][TT.isArch64Bit()];
}

const TargetRegisterClass *
SPIRVRegisterInfo::getPointerRegClass(const MachineFunction &MF,
                                            unsigned Kind) const {
  assert(Kind == 0 && "Only one kind of pointer on SPIRV");
  return &SPIRV::I64RegClass;
}
