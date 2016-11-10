//=- SPIRVInstPrinter.cpp - SPIR-V assembly instruction printing ------------=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief Print MCInst instructions to SPIR-V format.
///
//===----------------------------------------------------------------------===//

#include "InstPrinter/SPIRVInstPrinter.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRV.h"
//#include "SPIRVMachineFunctionInfo.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetRegisterInfo.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

#include "SPIRVGenAsmWriter.inc"

SPIRVInstPrinter::SPIRVInstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                                   const MCRegisterInfo &MRI)
    : MCInstPrinter(MAI, MII, MRI) {}

void SPIRVInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {}

void SPIRVInstPrinter::printInst(const MCInst *MI, raw_ostream &OS,
                                 StringRef Annot,
                                 const MCSubtargetInfo & /*STI*/) {
  // Print the instruction (this uses the AsmStrings from the .td files).
  printInstruction(MI, OS);

  // Print any additional variadic operands.
//  const MCInstrDesc &Desc = MII.get(MI->getOpcode());
//  if (Desc.isVariadic())
//    for (auto i = Desc.getNumOperands(), e = MI->getNumOperands(); i < e; ++i) {
//      if (i != 0)
//        OS << ", ";
//      printOperand(MI, i, OS);
//    }

  // Print any added annotation.
  printAnnotation(OS, Annot);
}

void SPIRVInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                    raw_ostream &O) {}

void SPIRVInstPrinter::printAddressingModelOperand(const MCInst *MI,
                                                   unsigned OpNo,
                                                   raw_ostream &OS) {
  const MCOperand& Op = MI->getOperand(OpNo);
  assert(Op.isImm() && "AddressingModel operand must be an immediate.");

  switch (Op.getImm()) {
  case SPIRV::Logical:    OS << "Logical";    break;
  case SPIRV::Physical32: OS << "Physical32"; break;
  case SPIRV::Physical64: OS << "Physical64"; break;
  default:
    llvm_unreachable("Unsupported AddressingModel.");
  }
}

void SPIRVInstPrinter::printCapabilityOperand(const MCInst *MI,
                                              unsigned OpNo,
                                              raw_ostream &OS) {
  const MCOperand& Op = MI->getOperand(OpNo);
  assert(Op.isImm() && "AddressingModel operand must be an immediate.");

  switch (Op.getImm()) {
  case SPIRV::Matrix:
    OS << "Matrix"; 
    break;
  case SPIRV::Shader:
    OS << "Shader"; 
    break;
  case SPIRV::Geometry:
    OS << "Geometry"; 
    break;
  case SPIRV::Tessellation:
    OS << "Tessellation"; 
    break;
  case SPIRV::Addresses:
    OS << "Addresses"; 
    break;
  case SPIRV::Linkage:
    OS << "Linkage"; 
    break;
  case SPIRV::Kernel:
    OS << "Kernel"; 
    break;
  case SPIRV::Vector16:
    OS << "Vector16"; 
    break;
  case SPIRV::Float16Buffer:
    OS << "Float16Buffer"; 
    break;
  case SPIRV::Float16:
    OS << "Float16"; 
    break;
  case SPIRV::Float64:
    OS << "Float64"; 
    break;
  case SPIRV::Int64:
    OS << "Int64"; 
    break;
  case SPIRV::Int64Atomics:
    OS << "Int64Atomics"; 
    break;
  case SPIRV::ImageBasic:
    OS << "ImageBasic"; 
    break;
  case SPIRV::ImageReadWrite:
    OS << "ImageReadWrite"; 
    break;
  case SPIRV::ImageMipmap:
    OS << "ImageMipmap"; 
    break;
  case SPIRV::Pipes:
    OS << "Pipes"; 
    break;
  case SPIRV::Groups:
    OS << "Groups"; 
    break;
  case SPIRV::DeviceEnqueue:
    OS << "DeviceEnqueue"; 
    break;
  case SPIRV::LiteralSampler:
    OS << "LiteralSampler"; 
    break;
  case SPIRV::AtomicStorage:
    OS << "AtomicStorage"; 
    break;
  case SPIRV::Int16:
    OS << "Int16"; 
    break;
  case SPIRV::TessellationPointSize:
    OS << "TessellationPointSize"; 
    break;
  case SPIRV::GeometryPointSize:
    OS << "GeometryPointSize"; 
    break;
  case SPIRV::ImageGatherExtended:
    OS << "ImageGatherExtended"; 
    break;
  case SPIRV::StorageImageMultisample:
    OS << "StorageImageMultisample"; 
    break;
  case SPIRV::UniformBufferArrayDynamicIndexing:
    OS << "UniformBufferArrayDynamicIndexing"; 
    break;
  case SPIRV::SampledImageArrayDynamicIndexing:
    OS << "SampledImageArrayDynamicIndexing"; 
    break;
  case SPIRV::StorageBufferArrayDynamicIndexing:
    OS << "StorageBufferArrayDynamicIndexing"; 
    break;
  case SPIRV::StorageImageArrayDynamicIndexing:
    OS << "StorageImageArrayDynamicIndexing"; 
    break;
  case SPIRV::ClipDistance:
    OS << "ClipDistance"; 
    break;
  case SPIRV::CullDistance:
    OS << "CullDistance"; 
    break;
  case SPIRV::ImageCubeArray:
    OS << "ImageCubeArray"; 
    break;
  case SPIRV::SampleRateShading:
    OS << "SampleRateShading"; 
    break;
  case SPIRV::ImageRect:
    OS << "ImageRect"; 
    break;
  case SPIRV::SampledRect:
    OS << "SampledRect"; 
    break;
  case SPIRV::GenericPointer:
    OS << "GenericPointer"; 
    break;
  case SPIRV::Int8:
    OS << "Int8"; 
    break;
  case SPIRV::InputAttachment:
    OS << "InputAttachment"; 
    break;
  case SPIRV::SparseResidency:
    OS << "SparseResidency"; 
    break;
  case SPIRV::MinLod:
    OS << "MinLod"; 
    break;
  case SPIRV::Sampled1D:
    OS << "Sampled1D"; 
    break;
  case SPIRV::Image1D:
    OS << "Image1D"; 
    break;
  case SPIRV::SampledCubeArray:
    OS << "SampledCubeArray"; 
    break;
  case SPIRV::SampledBuffer:
    OS << "SampledBuffer"; 
    break;
  case SPIRV::ImageBuffer:
    OS << "ImageBuffer"; 
    break;
  case SPIRV::ImageMSArray:
    OS << "ImageMSArray"; 
    break;
  case SPIRV::StorageImageExtendedFormats:
    OS << "StorageImageExtendedFormats"; 
    break;
  case SPIRV::ImageQuery:
    OS << "ImageQuery"; 
    break;
  case SPIRV::DerivativeControl:
    OS << "DerivativeControl"; 
    break;
  case SPIRV::InterpolationFunction:
    OS << "InterpolationFunction"; 
    break;
  case SPIRV::TransformFeedback:
    OS << "TransformFeedback"; 
    break;
  case SPIRV::GeometryStreams:
    OS << "GeometryStreams"; 
    break;
  case SPIRV::StorageImageReadWithoutFormat:
    OS << "StorageImageReadWithoutFormat"; 
    break;
  case SPIRV::StorageImageWriteWithoutFormat:
    OS << "StorageImageWriteWithoutFormat"; 
    break;
  case SPIRV::MultiViewport:
    OS << "MultiViewport"; 
    break;
  case SPIRV::SubgroupDispatch:
    OS << "SubgroupDispatch"; 
    break;
  case SPIRV::NamedBarrier:
    OS << "NamedBarrier"; 
    break;
  case SPIRV::PipeStorage:
    OS << "PipeStorage"; 
    break;
  case SPIRV::SubgroupBallotKHR:
    OS << "SubgroupBallotKHR"; 
    break;
  case SPIRV::DrawParameters:
    OS << "DrawParameters"; 
    break;
  default:
    llvm_unreachable("Unsupported AddressingModel.");
  }
}

void SPIRVInstPrinter::printMemoryModelOperand(const MCInst *MI, unsigned OpNo,
                                               raw_ostream &OS) {
  const MCOperand& Op = MI->getOperand(OpNo);
  assert(Op.isImm() && "MemoryModel operand must be an immediate.");

  switch (Op.getImm()) {
  case SPIRV::Simple:  OS << "Simple";  break;
  case SPIRV::GLSL450: OS << "GLSL450"; break;
  case SPIRV::OpenCL:  OS << "OpenCL";  break;
  default:
    llvm_unreachable("Unsupported MemoryModel.");
  }
}
