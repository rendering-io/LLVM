//=== SPIRVMachineModuleInfo.h - SPIR-V machine module info -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares SPIR-V specific per-machine-module information.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVMACHINEMODULEINFO_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVMACHINEMODULEINFO_H

#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/Type.h"

namespace llvm {

/// This class is derived from MachineModuleInfoImpl and contains private
/// SPIRV-specific information for each MachineModule.
class SPIRVMachineModuleInfo final : public MachineModuleInfoImpl {
  // Maps from an LLVM type to a SPIR-V result id.
  DenseMap<Type*, unsigned> TypeMap;

  // The required capabilities for the module.
  typedef SmallSetVector<SPIRV::Capability, 26> CapabilitySet;
  CapabilitySet Capabilities;

  const MachineModuleInfo &MMI;

  virtual void anchor(); // Out of line virtual method.
public:
  explicit SPIRVMachineModuleInfo(const MachineModuleInfo &MMI) : MMI(MMI) {}

  void addRequiredCapability(SPIRV::Capability C) {
    Capabilities.insert(C);
  };

  const CapabilitySet &capabilities() const { return Capabilities; }
};

} // end namespace llvm

#endif
