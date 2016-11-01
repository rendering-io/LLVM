//===-- SPIRVMCAsmInfo.cpp - SPIR-V asm properties ------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations of the SPIRVMCAsmInfo
/// properties.
///
//===----------------------------------------------------------------------===//

#include "SPIRVMCAsmInfo.h"
#include "llvm/ADT/Triple.h"
using namespace llvm;

#define DEBUG_TYPE "spirv-mc-asm-info"

SPIRVMCAsmInfo::SPIRVMCAsmInfo(const Triple &T) { 
  PointerSize = 8;

  // Don't emit .file directives into asm files.
  HasSingleParameterDotFile = false;

  HasIdentDirective = false;

  HasDotTypeDotSizeDirective = false;

  UsesNonexecutableStackSection = false;
}

SPIRVMCAsmInfo::~SPIRVMCAsmInfo() {
}
