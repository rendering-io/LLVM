//===-- SPIRVTargetObjectFile.cpp - SPIR-V Object Info --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines the functions of the SPIR-V specific subclass
/// of TargetLoweringObjectFile.
///
//===----------------------------------------------------------------------===//

#include "SPIRVTargetObjectFile.h"
#include "SPIRVTargetMachine.h"
using namespace llvm;

void SPIRVTargetObjectFile::Initialize(MCContext &Ctx, 
                                       const TargetMachine &TM) {
  TargetLoweringObjectFile::Initialize(Ctx, TM);
}
