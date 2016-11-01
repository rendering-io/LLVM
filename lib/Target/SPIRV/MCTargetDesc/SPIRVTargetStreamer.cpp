//==-- SPIRVTargetStreamer.cpp - SPIRV Target Streamer Methods --=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines SPIRV-specific target streamer classes.
/// These are for implementing support for target-specific assembly directives.
///
//===----------------------------------------------------------------------===//

#include "SPIRVTargetStreamer.h"
#include "InstPrinter/SPIRVInstPrinter.h"
#include "SPIRVMCTargetDesc.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCSectionELF.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbolELF.h"
#include "llvm/Support/ELF.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
using namespace llvm;

SPIRVTargetStreamer::SPIRVTargetStreamer(MCStreamer &S)
    : MCTargetStreamer(S) {}

SPIRVTargetAsmStreamer::SPIRVTargetAsmStreamer(
    MCStreamer &S, formatted_raw_ostream &OS)
    : SPIRVTargetStreamer(S), OS(OS) {}

//SPIRVTargetELFStreamer::SPIRVTargetELFStreamer(MCStreamer &S)
//    : SPIRVTargetStreamer(S) {}

static void PrintTypes(formatted_raw_ostream &OS, ArrayRef<MVT> Types) {
  bool First = true;
  for (MVT Type : Types) {
    if (First)
      First = false;
    else
      OS << ", ";
    //OS << SPIRV::TypeToString(Type);
  }
  OS << '\n';
}

void SPIRVTargetAsmStreamer::emitLabel(MCSymbol *Symbol) {}

void SPIRVTargetAsmStreamer::emitParam(ArrayRef<MVT> Types) {
  OS << "\t.param  \t";
  PrintTypes(OS, Types);
}

void SPIRVTargetAsmStreamer::emitResult(ArrayRef<MVT> Types) {
  OS << "\t.result \t";
  PrintTypes(OS, Types);
}

void SPIRVTargetAsmStreamer::emitLocal(ArrayRef<MVT> Types) {
  OS << "\t.local  \t";
  PrintTypes(OS, Types);
}

void SPIRVTargetAsmStreamer::emitEndFunc() {

}

void SPIRVTargetAsmStreamer::emitIndirectFunctionType(
    StringRef name, SmallVectorImpl<MVT> &Params, SmallVectorImpl<MVT> &Results) {
  OS << "\t.functype\t" << name;
  if (Results.empty())
    OS << ", void";
  else {
    assert(Results.size() == 1);
    //OS << ", " << SPIRV::TypeToString(Results.front());
  }
  //for (auto Ty : Params)
    //OS << ", " << SPIRV::TypeToString(Ty);
  OS << '\n';
}

void SPIRVTargetAsmStreamer::emitIndIdx(const MCExpr *Value) {
  OS << "\t.indidx  \t" << *Value << '\n';
}

// FIXME: What follows is not the real binary encoding.

static void EncodeTypes(MCStreamer &Streamer, ArrayRef<MVT> Types) {
  Streamer.EmitIntValue(Types.size(), sizeof(uint64_t));
  for (MVT Type : Types)
    Streamer.EmitIntValue(Type.SimpleTy, sizeof(uint64_t));
}
/*
void SPIRVTargetELFStreamer::emitParam(ArrayRef<MVT> Types) {
  Streamer.EmitIntValue(SPIRV::DotParam, sizeof(uint64_t));
  EncodeTypes(Streamer, Types);
}

void SPIRVTargetELFStreamer::emitResult(ArrayRef<MVT> Types) {
  Streamer.EmitIntValue(SPIRV::DotResult, sizeof(uint64_t));
  EncodeTypes(Streamer, Types);
}

void SPIRVTargetELFStreamer::emitLocal(ArrayRef<MVT> Types) {
  Streamer.EmitIntValue(SPIRV::DotLocal, sizeof(uint64_t));
  EncodeTypes(Streamer, Types);
}

void SPIRVTargetELFStreamer::emitEndFunc() {
  Streamer.EmitIntValue(SPIRV::DotEndFunc, sizeof(uint64_t));
}

void SPIRVTargetELFStreamer::emitIndIdx(const MCExpr *Value) {
  Streamer.EmitIntValue(SPIRV::DotIndIdx, sizeof(uint64_t));
  Streamer.EmitValue(Value, sizeof(uint64_t));
}
*/