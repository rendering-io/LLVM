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

namespace SPIRVISD {

enum NodeType : unsigned {
  FIRST_NUMBER = ISD::BUILTIN_OP_END,
#define HANDLE_NODETYPE(NODE) NODE,
#include "SPIRVISD.def"
#undef HANDLE_NODETYPE
};

}  // end namespace SPIRVISD

class SPIRVSubtarget;
class SPIRVTargetMachine;

class SPIRVTargetLowering final : public TargetLowering {
 public:
  SPIRVTargetLowering(const TargetMachine &TM,
                            const SPIRVSubtarget &STI);

  // Returns the name of a target specific SDNode, or null.
  const char *getTargetNodeName(unsigned Opcode) const override;

  SDValue
    LowerCall(CallLoweringInfo &/*CLI*/,
              SmallVectorImpl<SDValue> &/*InVals*/) const override {
    llvm_unreachable("Not Implemented");
  }

  bool CanLowerReturn(CallingConv::ID /*CallConv*/, MachineFunction & /*MF*/,
    bool /*IsVarArg*/, const SmallVectorImpl<ISD::OutputArg> &Outs,
    LLVMContext & /*Context*/) const override;

  SDValue LowerReturn(SDValue Chain, CallingConv::ID CallConv, bool /*IsVarArg*/,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    const SmallVectorImpl<SDValue> &OutVals, const SDLoc &DL,
    SelectionDAG &DAG) const override;
  SDValue LowerFormalArguments(SDValue Chain, CallingConv::ID CallConv,
                               bool IsVarArg,
                               const SmallVectorImpl<ISD::InputArg> &Ins,
                               const SDLoc &DL, SelectionDAG &DAG,
                               SmallVectorImpl<SDValue> &InVals) const override;  
};

}  // end namespace llvm

#endif
