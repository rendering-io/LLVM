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

//===----------------------------------------------------------------------===//
//  Custom lowering hooks.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//                          SPIRV Optimization Hooks
//===----------------------------------------------------------------------===//
