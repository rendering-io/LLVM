//===- SPIRV.td - Describe the SPIR-V Target Machine -------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is a target description file for the SPIR-V architecture,
/// which is also known as "spirv".
///
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// SPIR-V Subtarget features.
//===----------------------------------------------------------------------===//

//def FeatureSIMD128 : SubtargetFeature<"simd128", "HasSIMD128", "true",
//                                      "Enable 128-bit SIMD">;

//===----------------------------------------------------------------------===//
// Architectures.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Register File Description
//===----------------------------------------------------------------------===//

include "SPIRVRegisterInfo.td"

//===----------------------------------------------------------------------===//
// Instruction Descriptions
//===----------------------------------------------------------------------===//

include "SPIRVInstrInfo.td"

def SPIRVInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// SPIR-V Processors supported.
//===----------------------------------------------------------------------===//

// Generic processor: latest stable version.
def : ProcessorModel<"generic", NoSchedModel, []>;

// Latest and greatest experimental version of SPIRV. Bugs included!
//def : ProcessorModel<"bleeding-edge", NoSchedModel, [FeatureSIMD128]>;

//===----------------------------------------------------------------------===//
// Target Declaration
//===----------------------------------------------------------------------===//

def SPIRV : Target {
  let InstructionSet = SPIRVInstrInfo;
}
