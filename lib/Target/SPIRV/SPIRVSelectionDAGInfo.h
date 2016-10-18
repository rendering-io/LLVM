//===- SPIRVSelectionDAGInfo.h - SPIR-V SelectionDAG Info ----------*- C++ -*-//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines the SPIR-V subclass for SelectionDAGTargetInfo.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVSELECTIONDAGINFO_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVSELECTIONDAGINFO_H

#include "llvm/CodeGen/SelectionDAGTargetInfo.h"

namespace llvm {

class SPIRVSelectionDAGInfo final : public SelectionDAGTargetInfo {
public:
  ~SPIRVSelectionDAGInfo() override;
};

} // end namespace llvm

#endif
