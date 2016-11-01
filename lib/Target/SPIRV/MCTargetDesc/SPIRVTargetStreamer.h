//==-- SPIRVTargetStreamer.h - SPIR-V Target Streamer ------------*- C++ -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares SPIR-V specific target streamer classes.
/// These are for implementing support for target-specific assembly directives.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVTARGETSTREAMER_H
#define LLVM_LIB_TARGET_SPIRV_MCTARGETDESC_SPIRVTARGETSTREAMER_H

#include "llvm/CodeGen/MachineValueType.h"
#include "llvm/MC/MCStreamer.h"

namespace llvm {

class MCELFStreamer;

/// SPIRV-specific streamer interface, to implement support
/// SPIRV-specific assembly directives.
class SPIRVTargetStreamer : public MCTargetStreamer {
public:
  explicit SPIRVTargetStreamer(MCStreamer &S);

  /// .param
  virtual void emitParam(ArrayRef<MVT> Types) = 0;
  /// .result
  virtual void emitResult(ArrayRef<MVT> Types) = 0;
  /// .local
  virtual void emitLocal(ArrayRef<MVT> Types) = 0;
  /// .endfunc
  virtual void emitEndFunc() = 0;
  /// .functype
  virtual void emitIndirectFunctionType(StringRef name,
                                        SmallVectorImpl<MVT> &Params,
                                        SmallVectorImpl<MVT> &Results) {
    llvm_unreachable("emitIndirectFunctionType not implemented");
  }
  /// .indidx
  virtual void emitIndIdx(const MCExpr *Value) = 0;
};

/// This part is for ascii assembly output
class SPIRVTargetAsmStreamer final : public SPIRVTargetStreamer {
  formatted_raw_ostream &OS;

public:
  SPIRVTargetAsmStreamer(MCStreamer &S, formatted_raw_ostream &OS);

  void emitLabel(MCSymbol *Symbol) override;
  void emitParam(ArrayRef<MVT> Types) override;
  void emitResult(ArrayRef<MVT> Types) override;
  void emitLocal(ArrayRef<MVT> Types) override;
  void emitEndFunc() override;
  void emitIndirectFunctionType(StringRef name,
                                SmallVectorImpl<MVT> &Params,
                                SmallVectorImpl<MVT> &Results) override;
  void emitIndIdx(const MCExpr *Value) override;
};

/// This part is for ELF object output
class SPIRVTargetBinaryStreamer final : public SPIRVTargetStreamer {
public:
  explicit SPIRVTargetBinaryStreamer(MCStreamer &S);

  void emitParam(ArrayRef<MVT> Types) override;
  void emitResult(ArrayRef<MVT> Types) override;
  void emitLocal(ArrayRef<MVT> Types) override;
  void emitEndFunc() override;
  void emitIndIdx(const MCExpr *Value) override;
};

} // end namespace llvm

#endif
