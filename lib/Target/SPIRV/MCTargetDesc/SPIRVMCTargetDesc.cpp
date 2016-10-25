//===-- SPIRVMCTargetDesc.cpp - SPIR-V Target Descriptions ----------------===//
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

#include "SPIRVMCTargetDesc.h"
#include "SPIRVMCAsmInfo.h"
#include "SPIRVTargetStreamer.h"
#include "InstPrinter/SPIRVInstPrinter.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-mc-target-desc"

#define GET_REGINFO_MC_DESC
#include "SPIRVGenRegisterInfo.inc"

#define GET_INSTRINFO_MC_DESC
#include "SPIRVGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "SPIRVGenSubtargetInfo.inc"


static MCAsmInfo *createMCAsmInfo(const MCRegisterInfo & /*MRI*/,
                                  const Triple &TT) {
  return new SPIRVMCAsmInfo(TT);
}

static MCInstPrinter *createMCInstPrinter(const Triple & /*T*/,
                                          unsigned SyntaxVariant,
                                          const MCAsmInfo &MAI,
                                          const MCInstrInfo &MII,
                                          const MCRegisterInfo &MRI) {
  assert(SyntaxVariant == 0 && "SPIRV only has one syntax variant");
  return new SPIRVInstPrinter(MAI, MII, MRI);
}

static MCCodeEmitter *createCodeEmitter(const MCInstrInfo &MCII,
                                        const MCRegisterInfo & /*MRI*/,
                                        MCContext & /*Ctx*/) {
  assert(false && "createCodeEmitter not implemented for SPIR-V");
  return nullptr;
}

static MCAsmBackend *createAsmBackend(const Target & /*T*/,
                                      const MCRegisterInfo & /*MRI*/,
                                      const Triple &TT, StringRef /*CPU*/,
                                      const MCTargetOptions & /*Options*/) {
  return createSPIRVAsmBackend(TT);
}

static MCTargetStreamer *createAsmTargetStreamer(MCStreamer &S,
                                                 formatted_raw_ostream &OS,
                                                 MCInstPrinter * /*InstPrint*/,
                                                 bool /*isVerboseAsm*/) {
  return new SPIRVTargetAsmStreamer(S, OS);
}

// Force static initialization.
extern "C" void LLVMInitializeSPIRVTargetMC() {
  for (Target *T : {&getTheSPIRVTarget()}) {
    // Register the MC asm info.
    RegisterMCAsmInfoFn X(*T, createMCAsmInfo);
    
    // Register the MCInstPrinter.
    TargetRegistry::RegisterMCInstPrinter(*T, createMCInstPrinter);    

    // Register the MC code emitter.
    TargetRegistry::RegisterMCCodeEmitter(*T, createCodeEmitter);

    // Register the ASM Backend.
    TargetRegistry::RegisterMCAsmBackend(*T, createAsmBackend);

    // Register the asm target streamer.
    TargetRegistry::RegisterAsmTargetStreamer(*T, createAsmTargetStreamer);    
  }
}
