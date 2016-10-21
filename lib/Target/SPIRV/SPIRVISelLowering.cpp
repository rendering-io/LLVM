//===- SPIRVISelLowering.cpp - SPIR-V DAG Lowering Implementation ----------==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file implements the SPIRVTargetLowering class.
///
//===----------------------------------------------------------------------===//

#include "SPIRVISelLowering.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRVMachineFunctionInfo.h"
#include "SPIRVSubtarget.h"
#include "SPIRVTargetMachine.h"
#include "llvm/CodeGen/Analysis.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineJumpTableInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetOptions.h"
using namespace llvm;

#define DEBUG_TYPE "spirv-lower"

SPIRVTargetLowering::SPIRVTargetLowering(
    const TargetMachine &TM, const SPIRVSubtarget &STI)
    : TargetLowering(TM) {
}

//===----------------------------------------------------------------------===//
// SPIRV Lowering private implementation.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Lowering Code
//===----------------------------------------------------------------------===//
bool SPIRVTargetLowering::CanLowerReturn(
    CallingConv::ID /*CallConv*/, MachineFunction & /*MF*/, bool /*IsVarArg*/,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    LLVMContext & /*Context*/) const {
  // SPIR-V backend can't currently handle returning tuples.
  return Outs.size() <= 1;
}

SDValue SPIRVTargetLowering::LowerReturn(
    SDValue Chain, CallingConv::ID CallConv, bool /*IsVarArg*/,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    const SmallVectorImpl<SDValue> &OutVals, const SDLoc &DL,
    SelectionDAG &DAG) const {
  assert(Outs.size() <= 1 && "SPIRV can only return up to one value");
  //if (!CallingConvSupported(CallConv))
  //  fail(DL, DAG, "SPIRV doesn't support non-C calling conventions");

  SmallVector<SDValue, 4> RetOps(1, Chain);
  RetOps.append(OutVals.begin(), OutVals.end());
  Chain = DAG.getNode(SPIRVISD::RETURN, DL, MVT::Other, RetOps);

  // Record the number and types of the return values.
  for (const ISD::OutputArg &Out : Outs) {
    assert(!Out.Flags.isByVal() && "byval is not valid for return values");
    assert(!Out.Flags.isNest() && "nest is not valid for return values");
    assert(Out.IsFixed && "non-fixed return value is not valid");
    //if (Out.Flags.isInAlloca())
    //  fail(DL, DAG, "SPIRV hasn't implemented inalloca results");
    //if (Out.Flags.isInConsecutiveRegs())
    //  fail(DL, DAG, "SPIRV hasn't implemented cons regs results");
    //if (Out.Flags.isInConsecutiveRegsLast())
    //  fail(DL, DAG, "SPIRV hasn't implemented cons regs last results");
  }

  return Chain;
}

//===----------------------------------------------------------------------===//
//  Custom lowering hooks.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//                          SPIRV Optimization Hooks
//===----------------------------------------------------------------------===//
