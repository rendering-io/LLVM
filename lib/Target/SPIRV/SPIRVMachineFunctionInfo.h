//=== SPIRVMachineFunctionInfo.h - SPIR-V machine function info -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares SPIR-V specific per-machine-function
/// information.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVMACHINEFUNCTIONINFO_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVMACHINEFUNCTIONINFO_H

#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

namespace llvm {

/// This class is derived from MachineFunctionInfo and contains private
/// SPIRV-specific information for each MachineFunction.
class SPIRVFunctionInfo final : public MachineFunctionInfo {
  MachineFunction &MF;
public:
  explicit SPIRVFunctionInfo(MachineFunction &MF) : MF(MF) {}
  ~SPIRVFunctionInfo() override;
};

//void ComputeLegalValueVTs(const Function &F, const TargetMachine &TM,
  //                        Type *Ty, SmallVectorImpl<MVT> &ValueVTs);

//void ComputeSignatureVTs(const Function &F, const TargetMachine &TM,
  //                       SmallVectorImpl<MVT> &Params,
    //                     SmallVectorImpl<MVT> &Results);

} // end namespace llvm

#endif
