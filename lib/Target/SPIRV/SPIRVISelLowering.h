//===- SPIRVISelLowering.h - SPIR-V DAG Lowering Interface ---------*- C++ -*-//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines the interfaces that SPIR-V uses to lower LLVM
/// code into a selection DAG.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVISELLOWERING_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVISELLOWERING_H

#include "llvm/Target/TargetLowering.h"

namespace llvm {

//namespace SPIRVISD {
//
//enum NodeType : unsigned {
//  FIRST_NUMBER = ISD::BUILTIN_OP_END,
//#define HANDLE_NODETYPE(NODE) NODE,
//#include "SPIRVISD.def"
//#undef HANDLE_NODETYPE
//};
//
//}  // end namespace SPIRVISD

class SPIRVSubtarget;
class SPIRVTargetMachine;

class SPIRVTargetLowering final : public TargetLowering {
 public:
  SPIRVTargetLowering(const TargetMachine &TM,
                            const SPIRVSubtarget &STI);

  SDValue
    LowerCall(CallLoweringInfo &/*CLI*/,
              SmallVectorImpl<SDValue> &/*InVals*/) const override {
    llvm_unreachable("Not Implemented");
  }  
};

}  // end namespace llvm

#endif
