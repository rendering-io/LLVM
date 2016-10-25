//===-- SPIRVTargetObjectFile.h - SPIR-V Object Info ------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares the SPIR-V specific subclass of
/// TargetLoweringObjectFile.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVTARGETOBJECTFILE_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVTARGETOBJECTFILE_H

#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {

class SPIRVTargetObjectFile final : public TargetLoweringObjectFile {
public:
  SPIRVTargetObjectFile();
  virtual ~SPIRVTargetObjectFile();

  void Initialize(MCContext &Ctx, const TargetMachine &TM) override;

  MCSection *getSectionForConstant(const DataLayout &DL, SectionKind Kind,
                                   const Constant *C,
                                   unsigned &Align) const override;

  MCSection *getExplicitSectionGlobal(const GlobalValue *GV, SectionKind Kind,
                                      const TargetMachine &TM) const override;

  MCSection *SelectSectionForGlobal(const GlobalValue *GV, SectionKind Kind,
                                    const TargetMachine &TM) const override;
};

} // end namespace llvm

#endif
