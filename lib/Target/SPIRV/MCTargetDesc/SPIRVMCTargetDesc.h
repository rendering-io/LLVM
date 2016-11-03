//==- SPIRVMCTargetDesc.h - SPIR-V Target Descriptions ------------*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file provides SPIR-V specific target descriptions.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCTARGETDESC_H
#define LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCTARGETDESC_H

#include "llvm/MC/MCInstrDesc.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/Support/DataTypes.h"

namespace llvm {
namespace SPIRV {
enum OperandType {
  /// Basic block label in a branch construct.
  OPERAND_BASIC_BLOCK = MCOI::OPERAND_FIRST_TARGET,
  /// Addressing model immediate for OpMemoryModel.
  OPERAND_ADDRESSINGMODEL,
  /// Memory model immediate for OpMemoryModel.
  OPERAND_MEMORYMODEL
};

/// SPIR-V addressing model identifiers.
enum AddressingModel {
  Logical = 0,
  Physical32 = 1,
  Physical64 = 2,
};

/// SPIR-V memory model identifiers.
enum MemoryModel {
  Simple = 0,
  GLSL450 = 1,
  OpenCL = 2,
};

}}

// Defines symbolic names for SPIRV registers. This defines a mapping from
// register name to register number.
//
#define GET_REGINFO_ENUM
#include "SPIRVGenRegisterInfo.inc"

// Defines symbolic names for the SPIRV instructions.
//
#define GET_INSTRINFO_ENUM
#include "SPIRVGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "SPIRVGenSubtargetInfo.inc"

namespace llvm {

class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCInstrInfo;
class MCObjectWriter;
class MCSubtargetInfo;
class Target;
class Triple;
class raw_pwrite_stream;

Target &getTheSPIRVTarget();

MCCodeEmitter *createSPIRVMCCodeEmitter(const MCInstrInfo &MCII);

MCAsmBackend *createSPIRVAsmBackend(const Triple &TT);

MCELFStreamer *createSPIRVMCStreamer(MCContext &Context, MCAsmBackend &MAB,
                                     raw_pwrite_stream &OS,
                                     MCCodeEmitter *Emitter, bool RelaxAll);
}

#endif // LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCTARGETDESC_H
