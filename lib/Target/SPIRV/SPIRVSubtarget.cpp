//===-- SPIRVSubtarget.cpp - SPIR=V Subtarget Information -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements the SPIRV-specific subclass of
/// TargetSubtarget.
///
//===----------------------------------------------------------------------===//

#include "SPIRVSubtarget.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVInstrInfo.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-subtarget"

#define GET_SUBTARGETINFO_CTOR
#define GET_SUBTARGETINFO_TARGET_DESC
#include "SPIRVGenSubtargetInfo.inc"

SPIRVSubtarget &
SPIRVSubtarget::initializeSubtargetDependencies(StringRef FS) {
  // Determine default and user-specified characteristics
  if (CPUString.empty())
    CPUString = "generic";

  ParseSubtargetFeatures(CPUString, FS);
  return *this;
}

SPIRVSubtarget::SPIRVSubtarget(const Triple &TT, const std::string &CPU,
                               const std::string &FS, const TargetMachine &TM)
    : SPIRVGenSubtargetInfo(TT, CPU, FS),
      CPUString(CPU), TargetTriple(TT), FrameLowering(),
      InstrInfo(initializeSubtargetDependencies(FS)) {}

bool SPIRVSubtarget::enableMachineScheduler() const {
  // Disable the MachineScheduler for now. Even with ShouldTrackPressure set and
  // enableMachineSchedDefaultSched overridden, it appears to have an overall
  // negative effect for the kinds of register optimizations we're doing.
  return false;
}

bool SPIRVSubtarget::useAA() const { return true; }
