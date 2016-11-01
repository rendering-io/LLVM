//===-- SPIRVMCStreamer.h - SPIR-V Object Output ----------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This entire class is a lie. SPIR-V modules are not ELF files. What we should
// do is define a custom output format, but that requires modifications to core
// LLVM, outside of the SPIR-V backend.
//
// Instead, this is a custom MCELFStreamer which allows us to insert some hooks
// to surpress the default MCELFStreamer behaviour.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCSTREAMER_H
#define LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVMCSTREAMER_H

#include "llvm/MC/MCELFStreamer.h"

namespace llvm {
class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCSubtargetInfo;

class SPIRVMCStreamer : public MCELFStreamer {
public:
  SPIRVMCStreamer(MCContext &Context, MCAsmBackend &MAB, raw_pwrite_stream &OS,
                  MCCodeEmitter *Emitter)
      : MCELFStreamer(Context, MAB, OS, Emitter) { }

  void EmitLabel(MCSymbol *Symbol) override;
};

MCELFStreamer *createSPIRVMCStreamer(MCContext &Context, MCAsmBackend &MAB,
                                     raw_pwrite_stream &OS,
                                     MCCodeEmitter *Emitter, bool RelaxAll);
} // namespace llvm.

#endif
