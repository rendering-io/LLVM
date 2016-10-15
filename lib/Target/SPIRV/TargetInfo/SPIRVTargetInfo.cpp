//===-- SPIRVTargetInfo.cpp - SPIR-V Target Implementation ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file registers the SPIR-V target.
///
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "llvm/ADT/Triple.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-target-info"

Target &llvm::getTheSPIRVTarget() {
  static Target TheSPIRVTarget;
  return TheSPIRVTarget;
}

extern "C" void LLVMInitializeSPIRVTargetInfo() {
  RegisterTarget<Triple::spirv> X(getTheSPIRVTarget(), "spirv",
                                   "SPIR-V");
}
