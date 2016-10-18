//===- SPIRVTargetMachine.h - Define TargetMachine for SPIR-V ------*- C++ -*-//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares the SPIR-V specific subclass of TargetMachine.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVTARGETMACHINE_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVTARGETMACHINE_H

#include "llvm/Target/TargetMachine.h"
#include "SPIRVSubtarget.h"

namespace llvm {

class SPIRVTargetMachine final : public LLVMTargetMachine {
  std::unique_ptr<SPIRVSubtarget> ST;
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
public:
  SPIRVTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                     StringRef FS, const TargetOptions &Options,
                     Optional<Reloc::Model> RM, CodeModel::Model CM,
                     CodeGenOpt::Level OL);

  ~SPIRVTargetMachine() override;

  const SPIRVSubtarget *
  getSubtargetImpl(const Function &F) const override;

  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }

  /// \brief Get the TargetIRAnalysis for this target.
  TargetIRAnalysis getTargetIRAnalysis() override;  
};

} // end namespace llvm

#endif
