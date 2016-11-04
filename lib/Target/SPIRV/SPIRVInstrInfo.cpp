//===-- SPIRVInstrInfo.cpp - SPIR-V Instruction Information ---------------===//
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
/// TargetInstrInfo class.
///
//===----------------------------------------------------------------------===//

#include "SPIRVInstrInfo.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVMachineFunctionInfo.h"
#include "SPIRVSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
using namespace llvm;

#define DEBUG_TYPE "spirv-instr-info"

#define GET_INSTRINFO_CTOR_DTOR
#include "SPIRVGenInstrInfo.inc"

SPIRVInstrInfo::SPIRVInstrInfo(const SPIRVSubtarget &STI)
    : SPIRVGenInstrInfo(/*SPIRV::ADJCALLSTACKDOWN,
                              SPIRV::ADJCALLSTACKUP*/),
      RI(STI.getTargetTriple()) {}

bool SPIRVInstrInfo::isReallyTriviallyReMaterializable(
    const MachineInstr &MI, AliasAnalysis *AA) const {
  switch (MI.getOpcode()) {
  default:
    return false;
  }
}

SmallVector<SPIRV::Capability, 2> SPIRVInstrInfo::getRequiredCapabilities(const MachineInstr &MI) const {
  SmallVector<SPIRV::Capability, 2> Caps;
  switch (MI.getOpcode()) {
  default:
    break;
  } 

  return Caps;
}