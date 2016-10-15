//===- SPIRVTargetMachine.cpp - Define TargetMachine for SPIR-V ------------==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines the SPIR-V specific subclass of TargetMachine.
///
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVTargetMachine.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv"

extern "C" void LLVMInitializeSPIRVTarget() {
  // Register the target.
  RegisterTargetMachine<SPIRVTargetMachine> X(getTheSPIRVTarget());
}

//===----------------------------------------------------------------------===//
// WebAssembly Lowering public interface.
//===----------------------------------------------------------------------===//

static Reloc::Model getEffectiveRelocModel(Optional<Reloc::Model> RM) {
  return Reloc::Static;
}

/// Create an SPIR-V architecture model.
///
SPIRVTargetMachine::SPIRVTargetMachine(const Target &T, const Triple &TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Optional<Reloc::Model> RM,
                                       CodeModel::Model CM,
                                       CodeGenOpt::Level OL)
    : LLVMTargetMachine(
          T, TT.isArch64Bit() ? "e-m:e-p:64:64-i64:64-n32:64-S128"
                              : "e-m:e-p:32:32-i64:64-n32:64-S128",
          TT, CPU, FS, Options, getEffectiveRelocModel(RM), CM, OL) {}

SPIRVTargetMachine::~SPIRVTargetMachine() {}
