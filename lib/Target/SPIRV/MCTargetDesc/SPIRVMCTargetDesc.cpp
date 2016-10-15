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

using namespace llvm;

#define DEBUG_TYPE "spirv-mc-target-desc"

// Force static initialization.
extern "C" void LLVMInitializeSPIRVTargetMC() {
}
