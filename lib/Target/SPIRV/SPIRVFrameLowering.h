//===- SPIRVFrameLowering.h - TargetFrameLowering for SPIR-V --------*- C++ -*-/
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This class implements SPIR-V specific bits of
/// TargetFrameLowering class.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVFRAMELOWERING_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVFRAMELOWERING_H

#include "llvm/Target/TargetFrameLowering.h"

namespace llvm {
class MachineFrameInfo;

class SPIRVFrameLowering final : public TargetFrameLowering {
public:
  SPIRVFrameLowering()
      : TargetFrameLowering(StackGrowsDown, /*StackAlignment=*/16,
                            /*LocalAreaOffset=*/0,
                            /*TransientStackAlignment=*/16,
                            /*StackRealignable=*/true) {}

  MachineBasicBlock::iterator eliminateCallFramePseudoInstr(
      MachineFunction &MF, MachineBasicBlock &MBB,
      MachineBasicBlock::iterator I) const override;

  /// These methods insert prolog and epilog code into the function.
  void emitPrologue(MachineFunction &MF, MachineBasicBlock &MBB) const override;
  void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const override;

  bool hasFP(const MachineFunction &MF) const override;
  bool hasReservedCallFrame(const MachineFunction &MF) const override;

private:
};

}  // end namespace llvm

#endif
