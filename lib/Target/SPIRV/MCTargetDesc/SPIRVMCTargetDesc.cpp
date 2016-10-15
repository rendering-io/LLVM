//===-- SPIRVMCTargetDesc.cpp - SPIR-V Target Descriptions ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file provides SPIR-V specific target descriptions.
///
//===----------------------------------------------------------------------===//

#include "SPIRVMCTargetDesc.h"
#include "SPIRVMCAsmInfo.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-mc-target-desc"

static MCAsmInfo *createMCAsmInfo(const MCRegisterInfo & /*MRI*/,
                                  const Triple &TT) {
  return new SPIRVMCAsmInfo(TT);
}

// Force static initialization.
extern "C" void LLVMInitializeSPIRVTargetMC() {
  for (Target *T : {&getTheSPIRVTarget()}) {
    // Register the MC asm info.
    RegisterMCAsmInfoFn X(*T, createMCAsmInfo);
  }
}
