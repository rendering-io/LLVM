//===-- SPIRVMCAsmInfo.h - SPIR-V asm properties ----------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declaration of the SPIRVMCAsmInfo class.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCASMINFO_H
#define LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {

class Triple;

class SPIRVMCAsmInfo final : public MCAsmInfoELF {
public:
  explicit SPIRVMCAsmInfo(const Triple &T);
  ~SPIRVMCAsmInfo() override;
};

} // end namespace llvm

#endif
