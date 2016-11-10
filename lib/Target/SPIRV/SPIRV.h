//===-- SPIRV.h - Top-level interface for SPIR-V  ---------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the entry points for global functions defined in
/// the LLVM SPIR-V back-end.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRV_H
#define LLVM_LIB_TARGET_SPIRV_SPIRV_H

#include "llvm/PassRegistry.h"
#include "llvm/Support/CodeGen.h"

namespace llvm {

class SPIRVTargetMachine;
class ModulePass;
class FunctionPass;
class MachineFunctionPass;

// ISel and immediate followup passes.
FunctionPass *createSPIRVISelDag(SPIRVTargetMachine &TM,
                                       CodeGenOpt::Level OptLevel);

// Late passes.
MachineFunctionPass *createSPIRVPrologEpilogPass();
ModulePass *createSPIRVTrackCapabilityPass();

} // end namespace llvm

#endif
