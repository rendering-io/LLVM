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

#include "SPIRV.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVTargetMachine.h"
#include "SPIRVTargetObjectFile.h"
#include "SPIRVTargetTransformInfo.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv"

extern "C" void LLVMInitializeSPIRVTarget() {
  // Register the target.
  RegisterTargetMachine<SPIRVTargetMachine> X(getTheSPIRVTarget());
}

//===----------------------------------------------------------------------===//
// SPIRV Lowering public interface.
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
          TT, CPU, FS, Options, getEffectiveRelocModel(RM), CM, OL),
      ST(make_unique<SPIRVSubtarget>(TT, CPU, FS, *this)),
      TLOF(make_unique<SPIRVTargetObjectFile>()) {
  initAsmInfo();
}

SPIRVTargetMachine::~SPIRVTargetMachine() {}

const SPIRVSubtarget *
SPIRVTargetMachine::getSubtargetImpl(const Function &F) const {
  return ST.get();
}

TargetIRAnalysis SPIRVTargetMachine::getTargetIRAnalysis() {
  return TargetIRAnalysis([this](const Function &F) {
    return TargetTransformInfo(SPIRVTTIImpl(this, F));
  });
}

namespace {
/// SPIRV Code Generator Pass Configuration Options.
class SPIRVPassConfig final : public TargetPassConfig {
public:
  SPIRVPassConfig(SPIRVTargetMachine *TM, PassManagerBase &PM)
      : TargetPassConfig(TM, PM) {}

  SPIRVTargetMachine &getSPIRVTargetMachine() const {
    return getTM<SPIRVTargetMachine>();
  }

  FunctionPass *createTargetRegisterAllocator(bool) override;

  void addIRPasses() override;
  bool addInstSelector() override;
  void addPostRegAlloc() override;
  bool addGCPasses() override { return false; }
  void addPreEmitPass() override;
};
} // end anonymous namespace

TargetPassConfig *SPIRVTargetMachine::createPassConfig(PassManagerBase &PM) {
  return new SPIRVPassConfig(this, PM);
}

FunctionPass *SPIRVPassConfig::createTargetRegisterAllocator(bool) {
  return nullptr; // No reg alloc
}

//===----------------------------------------------------------------------===//
// The following functions are called from lib/CodeGen/Passes.cpp to modify
// the CodeGen pass sequence.
//===----------------------------------------------------------------------===//

void SPIRVPassConfig::addIRPasses() {
  // The Prolog/Epilog Inserter pass requires that the register allocator has 
  // removed all virtual registers, but we never run a register allocator for 
  // SPIR-V, so this causes a headache.
  disablePass(&PrologEpilogCodeInserterID);
  disablePass(&MachineCopyPropagationID);
  disablePass(&PostRASchedulerID);
  disablePass(&FuncletLayoutID);
  disablePass(&StackMapLivenessID);
  disablePass(&LiveDebugValuesID);
  disablePass(&PatchableFunctionID);
  
  TargetPassConfig::addIRPasses();
}

bool SPIRVPassConfig::addInstSelector() {
  (void)TargetPassConfig::addInstSelector();
  
  addPass(createSPIRVISelDag(getSPIRVTargetMachine(), getOptLevel()));

  return false;
}

void SPIRVPassConfig::addPostRegAlloc() { 
  addPass(createSPIRVPrologEpilogPass(), false);
  TargetPassConfig::addPostRegAlloc();
}

void SPIRVPassConfig::addPreEmitPass() { TargetPassConfig::addPreEmitPass(); }
