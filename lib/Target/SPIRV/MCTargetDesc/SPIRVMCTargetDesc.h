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
  /// Capability immediate for OpCapability.
  OPERAND_CAPABILITY,
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

enum Capability: uint32_t {
  Matrix = 0,
  Shader = 1,
  Geometry = 2,
  Tessellation = 3,
  Addresses = 4,
  Linkage = 5,
  Kernel = 6,
  Vector16 = 7,
  Float16Buffer = 8,
  Float16 = 9,
  Float64 = 10,
  Int64 = 11,
  Int64Atomics = 12,
  ImageBasic = 13,
  ImageReadWrite = 14,
  ImageMipmap = 15,
  Pipes = 17,
  Groups = 18,
  DeviceEnqueue = 19,
  LiteralSampler = 20,
  AtomicStorage = 21,
  Int16 = 22,
  TessellationPointSize = 23,
  GeometryPointSize = 24,
  ImageGatherExtended = 25,
  StorageImageMultisample = 27,
  UniformBufferArrayDynamicIndexing = 28,
  SampledImageArrayDynamicIndexing = 29,
  StorageBufferArrayDynamicIndexing = 30,
  StorageImageArrayDynamicIndexing = 31,
  ClipDistance = 32,
  CullDistance = 33,
  ImageCubeArray = 34,
  SampleRateShading = 35,
  ImageRect = 36,
  SampledRect = 37,
  GenericPointer = 38,
  Int8 = 39,
  InputAttachment = 40,
  SparseResidency = 41,
  MinLod = 42,
  Sampled1D = 43,
  Image1D = 44,
  SampledCubeArray = 45,
  SampledBuffer = 46,
  ImageBuffer = 47,
  ImageMSArray = 48,
  StorageImageExtendedFormats = 49,
  ImageQuery = 50,
  DerivativeControl = 51,
  InterpolationFunction = 52,
  TransformFeedback = 53,
  GeometryStreams = 54,
  StorageImageReadWithoutFormat = 55,
  StorageImageWriteWithoutFormat = 56,
  MultiViewport = 57,
  SubgroupDispatch = 58,
  NamedBarrier = 59,
  PipeStorage = 60,
  SubgroupBallotKHR = 4423,
  DrawParameters = 4427,
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
