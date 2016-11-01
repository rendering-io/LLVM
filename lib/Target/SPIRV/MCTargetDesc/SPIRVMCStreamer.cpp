//===-- SPIRVMCStreamer.cpp - SPIR-V Object Output ------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "SPIRVMCStreamer.h"

using namespace llvm;

void SPIRVMCStreamer::EmitLabel(MCSymbol *Symbol) {}

MCELFStreamer *llvm::createSPIRVMCStreamer(MCContext &Context,
                                           MCAsmBackend &MAB,
                                           raw_pwrite_stream &OS,
                                           MCCodeEmitter *Emitter,
                                           bool RelaxAll) {
  return new SPIRVMCStreamer(Context, MAB, OS, Emitter);
}
