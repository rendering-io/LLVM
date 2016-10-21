//===- SPIRVSubtarget.h - Define Subtarget for the SPIR-V ----------*- C++ -*-//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file declares the SPIR-V specific subclass of
/// TargetSubtarget.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVSUBTARGET_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVSUBTARGET_H

#include "SPIRVFrameLowering.h"
#include "SPIRVISelLowering.h"
#include "SPIRVInstrInfo.h"
#include "SPIRVSelectionDAGInfo.h"
#include "llvm/Target/TargetSubtargetInfo.h"
#include <string>

#define GET_SUBTARGETINFO_HEADER
#include "SPIRVGenSubtargetInfo.inc"

namespace llvm {

class SPIRVSelectionDAGInfo;
class SPIRVTargetLowering;

class SPIRVSubtarget final : public SPIRVGenSubtargetInfo {
  /// String name of used CPU.
  std::string CPUString;

  /// What processor and OS we're targeting.
  Triple TargetTriple;

  SPIRVFrameLowering FrameLowering;
  SPIRVInstrInfo InstrInfo;
  //SPIRVSelectionDAGInfo TSInfo;
  SPIRVTargetLowering TLInfo;

  /// Initializes using CPUString and the passed in feature string so that we
  /// can use initializer lists for subtarget initialization.
  SPIRVSubtarget &initializeSubtargetDependencies(StringRef FS);

public:
  /// This constructor initializes the data members to match that
  /// of the specified triple.
  SPIRVSubtarget(const Triple &TT, const std::string &CPU,
                       const std::string &FS, const TargetMachine &TM);

  const SPIRVSelectionDAGInfo *getSelectionDAGInfo() const override {
    return  nullptr;//&TSInfo;
  }
  const SPIRVFrameLowering *getFrameLowering() const override {
    return &FrameLowering;
  }
  const SPIRVTargetLowering *getTargetLowering() const override {
    return &TLInfo;
  }
  const SPIRVInstrInfo *getInstrInfo() const override {
    return &InstrInfo;
  }
  const SPIRVRegisterInfo *getRegisterInfo() const override {
    return &getInstrInfo()->getRegisterInfo();
  }
  const Triple &getTargetTriple() const { return TargetTriple; }
  bool enableMachineScheduler() const override;
  bool useAA() const override;

  /// Parses features string setting specified subtarget options. Definition of
  /// function is auto generated by tblgen.
  void ParseSubtargetFeatures(StringRef CPU, StringRef FS);
};

} // end namespace llvm

#endif
