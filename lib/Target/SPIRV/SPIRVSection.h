//===- SPIRVSection.h - SPIR-V-specific section representation --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the SPIRVSection class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVSECTION_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVSECTION_H

#include "llvm/IR/GlobalVariable.h"
#include "llvm/MC/MCSection.h"

namespace llvm {
/// Represents a section in SPIR-V. SPIR-V does not have sections. We create 
/// this class in order to use the ASMPrint interface.
///
class SPIRVSection final : public MCSection {
  virtual void anchor();
public:
  SPIRVSection(SectionVariant V, SectionKind K) : MCSection(V, K, nullptr) {}
  ~SPIRVSection() {}

  /// Override this as SPIRV has its own way of printing switching
  /// to a section.
  void PrintSwitchToSection(const MCAsmInfo &MAI,
                            raw_ostream &OS,
                            const MCExpr *Subsection) const override {}

  /// Base address of PTX sections is zero.
  bool UseCodeAlign() const override { return false; }
  bool isVirtualSection() const override { return false; }
};

} // end namespace llvm

#endif
