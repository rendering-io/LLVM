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
#include "llvm/Support/DataTypes.h"


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

}

#endif // LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCTARGETDESC_H
