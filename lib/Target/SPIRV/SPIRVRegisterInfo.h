//===-- SPIRVRegisterInfo.h - SPIR-V Register Information -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the SPIR-V implementation of the
/// SPIRVRegisterInfo class.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVREGISTERINFO_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVREGISTERINFO_H

#define GET_REGINFO_HEADER
#include "SPIRVGenRegisterInfo.inc"

namespace llvm {

class MachineFunction;
class RegScavenger;
class TargetRegisterClass;
class Triple;

class SPIRVRegisterInfo final : public SPIRVGenRegisterInfo {
  const Triple &TT;

public:
  explicit SPIRVRegisterInfo(const Triple &TT);

  // Code Generation virtual methods.
  const MCPhysReg *getCalleeSavedRegs(const MachineFunction *MF) const override;
  BitVector getReservedRegs(const MachineFunction &MF) const override;
  void eliminateFrameIndex(MachineBasicBlock::iterator MI, int SPAdj,
                           unsigned FIOperandNum,
                           RegScavenger *RS = nullptr) const override;

  // Debug information queries.
  unsigned getFrameRegister(const MachineFunction &MF) const override;

  const TargetRegisterClass *
  getPointerRegClass(const MachineFunction &MF,
                     unsigned Kind = 0) const override;
};

} // end namespace llvm

#endif
