//===- SPIRVInstrInfo.td - Describe the SPIR-V Instructions --*- tablegen -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief SPIR-V Instruction definitions.
///
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// SPIR-V Instruction Predicate Definitions.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// SPIRV-specific DAG Node Types.
//===----------------------------------------------------------------------===//

def SDT_SPIRVReturn   : SDTypeProfile<0, -1, []>;

//===----------------------------------------------------------------------===//
// SPIRV-specific DAG Nodes.
//===----------------------------------------------------------------------===//

def SPIRVReturn   : SDNode<"SPIRVISD::RETURN", SDT_SPIRVReturn, [SDNPHasChain]>;

//===----------------------------------------------------------------------===//
// SPIRV-specific Operands.
//===----------------------------------------------------------------------===//

let OperandNamespace = "SPIRV" in {

} // OperandNamespace = "SPIRV"

//===----------------------------------------------------------------------===//
// SPIRV Instruction Format Definitions.
//===----------------------------------------------------------------------===//

include "SPIRVInstrFormats.td"

//===----------------------------------------------------------------------===//
// Additional instructions.
//===----------------------------------------------------------------------===//

// OpNop 
def OpNop : SPIRVInst<OpCodeNop,
  [], (outs), (ins), []>;

// OpUndef IdResultType, IdResult
def OpUndef : SPIRVInst<OpCodeUndef,
  [], (outs), (ins), []>;

// OpSourceContinued LiteralString
def OpSourceContinued : SPIRVInst<OpCodeSourceContinued,
  [], (outs), (ins), []>;

// OpSource SourceLanguage, LiteralInteger, IdRef, LiteralString
def OpSource : SPIRVInst<OpCodeSource,
  [], (outs), (ins), []>;

// OpSourceExtension LiteralString
def OpSourceExtension : SPIRVInst<OpCodeSourceExtension,
  [], (outs), (ins), []>;

// OpName IdRef, LiteralString
def OpName : SPIRVInst<OpCodeName,
  [], (outs), (ins), []>;

// OpMemberName IdRef, LiteralInteger, LiteralString
def OpMemberName : SPIRVInst<OpCodeMemberName,
  [], (outs), (ins), []>;

// OpString IdResult, LiteralString
def OpString : SPIRVInst<OpCodeString,
  [], (outs), (ins), []>;

// OpLine IdRef, LiteralInteger, LiteralInteger
def OpLine : SPIRVInst<OpCodeLine,
  [], (outs), (ins), []>;

// OpExtension LiteralString
def OpExtension : SPIRVInst<OpCodeExtension,
  [], (outs), (ins), []>;

// OpExtInstImport IdResult, LiteralString
def OpExtInstImport : SPIRVInst<OpCodeExtInstImport,
  [], (outs), (ins), []>;

// OpExtInst IdResultType, IdResult, IdRef, LiteralExtInstInteger, IdRef
def OpExtInst : SPIRVInst<OpCodeExtInst,
  [], (outs), (ins), []>;

// OpMemoryModel AddressingModel, MemoryModel
def OpMemoryModel : SPIRVInst<OpCodeMemoryModel,
  [], (outs), (ins), []>;

// OpEntryPoint ExecutionModel, IdRef, LiteralString, IdRef
def OpEntryPoint : SPIRVInst<OpCodeEntryPoint,
  [], (outs), (ins), []>;

// OpExecutionMode IdRef, ExecutionMode
def OpExecutionMode : SPIRVInst<OpCodeExecutionMode,
  [], (outs), (ins), []>;

// OpCapability Capability
def OpCapability : SPIRVInst<OpCodeCapability,
  [], (outs), (ins), []>;

// OpTypeVoid IdResult
def OpTypeVoid : SPIRVInst<OpCodeTypeVoid,
  [], (outs), (ins), []>;

// OpTypeBool IdResult
def OpTypeBool : SPIRVInst<OpCodeTypeBool,
  [], (outs), (ins), []>;

// OpTypeInt IdResult, LiteralInteger, LiteralInteger
def OpTypeInt : SPIRVInst<OpCodeTypeInt,
  [], (outs), (ins), []>;

// OpTypeFloat IdResult, LiteralInteger
def OpTypeFloat : SPIRVInst<OpCodeTypeFloat,
  [], (outs), (ins), []>;

// OpTypeVector IdResult, IdRef, LiteralInteger
def OpTypeVector : SPIRVInst<OpCodeTypeVector,
  [], (outs), (ins), []>;

// OpTypeMatrix IdResult, IdRef, LiteralInteger
def OpTypeMatrix : SPIRVInst<OpCodeTypeMatrix,
  [CapabilityMatrix], (outs), (ins), []>;

// OpTypeImage IdResult, IdRef, Dim, LiteralInteger, LiteralInteger, LiteralInteger, LiteralInteger, ImageFormat, AccessQualifier
def OpTypeImage : SPIRVInst<OpCodeTypeImage,
  [], (outs), (ins), []>;

// OpTypeSampler IdResult
def OpTypeSampler : SPIRVInst<OpCodeTypeSampler,
  [], (outs), (ins), []>;

// OpTypeSampledImage IdResult, IdRef
def OpTypeSampledImage : SPIRVInst<OpCodeTypeSampledImage,
  [], (outs), (ins), []>;

// OpTypeArray IdResult, IdRef, IdRef
def OpTypeArray : SPIRVInst<OpCodeTypeArray,
  [], (outs), (ins), []>;

// OpTypeRuntimeArray IdResult, IdRef
def OpTypeRuntimeArray : SPIRVInst<OpCodeTypeRuntimeArray,
  [CapabilityShader], (outs), (ins), []>;

// OpTypeStruct IdResult, IdRef
def OpTypeStruct : SPIRVInst<OpCodeTypeStruct,
  [], (outs), (ins), []>;

// OpTypeOpaque IdResult, LiteralString
def OpTypeOpaque : SPIRVInst<OpCodeTypeOpaque,
  [CapabilityKernel], (outs), (ins), []>;

// OpTypePointer IdResult, StorageClass, IdRef
def OpTypePointer : SPIRVInst<OpCodeTypePointer,
  [], (outs), (ins), []>;

// OpTypeFunction IdResult, IdRef, IdRef
def OpTypeFunction : SPIRVInst<OpCodeTypeFunction,
  [], (outs), (ins), []>;

// OpTypeEvent IdResult
def OpTypeEvent : SPIRVInst<OpCodeTypeEvent,
  [CapabilityKernel], (outs), (ins), []>;

// OpTypeDeviceEvent IdResult
def OpTypeDeviceEvent : SPIRVInst<OpCodeTypeDeviceEvent,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpTypeReserveId IdResult
def OpTypeReserveId : SPIRVInst<OpCodeTypeReserveId,
  [CapabilityPipes], (outs), (ins), []>;

// OpTypeQueue IdResult
def OpTypeQueue : SPIRVInst<OpCodeTypeQueue,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpTypePipe IdResult, AccessQualifier
def OpTypePipe : SPIRVInst<OpCodeTypePipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpTypeForwardPointer IdRef, StorageClass
def OpTypeForwardPointer : SPIRVInst<OpCodeTypeForwardPointer,
  [CapabilityAddresses], (outs), (ins), []>;

// OpConstantTrue IdResultType, IdResult
def OpConstantTrue : SPIRVInst<OpCodeConstantTrue,
  [], (outs), (ins), []>;

// OpConstantFalse IdResultType, IdResult
def OpConstantFalse : SPIRVInst<OpCodeConstantFalse,
  [], (outs), (ins), []>;

// OpConstant IdResultType, IdResult, LiteralContextDependentNumber
def OpConstant : SPIRVInst<OpCodeConstant,
  [], (outs), (ins), []>;

// OpConstantComposite IdResultType, IdResult, IdRef
def OpConstantComposite : SPIRVInst<OpCodeConstantComposite,
  [], (outs), (ins), []>;

// OpConstantSampler IdResultType, IdResult, SamplerAddressingMode, LiteralInteger, SamplerFilterMode
def OpConstantSampler : SPIRVInst<OpCodeConstantSampler,
  [CapabilityLiteralSampler], (outs), (ins), []>;

// OpConstantNull IdResultType, IdResult
def OpConstantNull : SPIRVInst<OpCodeConstantNull,
  [], (outs), (ins), []>;

// OpSpecConstantTrue IdResultType, IdResult
def OpSpecConstantTrue : SPIRVInst<OpCodeSpecConstantTrue,
  [], (outs), (ins), []>;

// OpSpecConstantFalse IdResultType, IdResult
def OpSpecConstantFalse : SPIRVInst<OpCodeSpecConstantFalse,
  [], (outs), (ins), []>;

// OpSpecConstant IdResultType, IdResult, LiteralContextDependentNumber
def OpSpecConstant : SPIRVInst<OpCodeSpecConstant,
  [], (outs), (ins), []>;

// OpSpecConstantComposite IdResultType, IdResult, IdRef
def OpSpecConstantComposite : SPIRVInst<OpCodeSpecConstantComposite,
  [], (outs), (ins), []>;

// OpSpecConstantOp IdResultType, IdResult, LiteralSpecConstantOpInteger
def OpSpecConstantOp : SPIRVInst<OpCodeSpecConstantOp,
  [], (outs), (ins), []>;

// OpFunction IdResultType, IdResult, FunctionControl, IdRef
def OpFunction : SPIRVInst<OpCodeFunction,
  [], (outs), (ins), []>;

// OpFunctionParameter IdResultType, IdResult
def OpFunctionParameter : SPIRVInst<OpCodeFunctionParameter,
  [], (outs), (ins), []>;

// OpFunctionEnd 
def OpFunctionEnd : SPIRVInst<OpCodeFunctionEnd,
  [], (outs), (ins), []>;

// OpFunctionCall IdResultType, IdResult, IdRef, IdRef
def OpFunctionCall : SPIRVInst<OpCodeFunctionCall,
  [], (outs), (ins), []>;

// OpVariable IdResultType, IdResult, StorageClass, IdRef
def OpVariable : SPIRVInst<OpCodeVariable,
  [], (outs), (ins), []>;

// OpImageTexelPointer IdResultType, IdResult, IdRef, IdRef, IdRef
def OpImageTexelPointer : SPIRVInst<OpCodeImageTexelPointer,
  [], (outs), (ins), []>;

// OpLoad IdResultType, IdResult, IdRef, MemoryAccess
def OpLoad : SPIRVInst<OpCodeLoad,
  [], (outs), (ins), []>;

// OpStore IdRef, IdRef, MemoryAccess
def OpStore : SPIRVInst<OpCodeStore,
  [], (outs), (ins), []>;

// OpCopyMemory IdRef, IdRef, MemoryAccess
def OpCopyMemory : SPIRVInst<OpCodeCopyMemory,
  [], (outs), (ins), []>;

// OpCopyMemorySized IdRef, IdRef, IdRef, MemoryAccess
def OpCopyMemorySized : SPIRVInst<OpCodeCopyMemorySized,
  [CapabilityAddresses], (outs), (ins), []>;

// OpAccessChain IdResultType, IdResult, IdRef, IdRef
def OpAccessChain : SPIRVInst<OpCodeAccessChain,
  [], (outs), (ins), []>;

// OpInBoundsAccessChain IdResultType, IdResult, IdRef, IdRef
def OpInBoundsAccessChain : SPIRVInst<OpCodeInBoundsAccessChain,
  [], (outs), (ins), []>;

// OpPtrAccessChain IdResultType, IdResult, IdRef, IdRef, IdRef
def OpPtrAccessChain : SPIRVInst<OpCodePtrAccessChain,
  [CapabilityAddresses], (outs), (ins), []>;

// OpArrayLength IdResultType, IdResult, IdRef, LiteralInteger
def OpArrayLength : SPIRVInst<OpCodeArrayLength,
  [CapabilityShader], (outs), (ins), []>;

// OpGenericPtrMemSemantics IdResultType, IdResult, IdRef
def OpGenericPtrMemSemantics : SPIRVInst<OpCodeGenericPtrMemSemantics,
  [CapabilityKernel], (outs), (ins), []>;

// OpInBoundsPtrAccessChain IdResultType, IdResult, IdRef, IdRef, IdRef
def OpInBoundsPtrAccessChain : SPIRVInst<OpCodeInBoundsPtrAccessChain,
  [CapabilityAddresses], (outs), (ins), []>;

// OpDecorate IdRef, Decoration
def OpDecorate : SPIRVInst<OpCodeDecorate,
  [], (outs), (ins), []>;

// OpMemberDecorate IdRef, LiteralInteger, Decoration
def OpMemberDecorate : SPIRVInst<OpCodeMemberDecorate,
  [], (outs), (ins), []>;

// OpDecorationGroup IdResult
def OpDecorationGroup : SPIRVInst<OpCodeDecorationGroup,
  [], (outs), (ins), []>;

// OpGroupDecorate IdRef, IdRef
def OpGroupDecorate : SPIRVInst<OpCodeGroupDecorate,
  [], (outs), (ins), []>;

// OpGroupMemberDecorate IdRef, PairIdRefLiteralInteger
def OpGroupMemberDecorate : SPIRVInst<OpCodeGroupMemberDecorate,
  [], (outs), (ins), []>;

// OpVectorExtractDynamic IdResultType, IdResult, IdRef, IdRef
def OpVectorExtractDynamic : SPIRVInst<OpCodeVectorExtractDynamic,
  [], (outs), (ins), []>;

// OpVectorInsertDynamic IdResultType, IdResult, IdRef, IdRef, IdRef
def OpVectorInsertDynamic : SPIRVInst<OpCodeVectorInsertDynamic,
  [], (outs), (ins), []>;

// OpVectorShuffle IdResultType, IdResult, IdRef, IdRef, LiteralInteger
def OpVectorShuffle : SPIRVInst<OpCodeVectorShuffle,
  [], (outs), (ins), []>;

// OpCompositeConstruct IdResultType, IdResult, IdRef
def OpCompositeConstruct : SPIRVInst<OpCodeCompositeConstruct,
  [], (outs), (ins), []>;

// OpCompositeExtract IdResultType, IdResult, IdRef, LiteralInteger
def OpCompositeExtract : SPIRVInst<OpCodeCompositeExtract,
  [], (outs), (ins), []>;

// OpCompositeInsert IdResultType, IdResult, IdRef, IdRef, LiteralInteger
def OpCompositeInsert : SPIRVInst<OpCodeCompositeInsert,
  [], (outs), (ins), []>;

// OpCopyObject IdResultType, IdResult, IdRef
def OpCopyObject : SPIRVInst<OpCodeCopyObject,
  [], (outs), (ins), []>;

// OpTranspose IdResultType, IdResult, IdRef
def OpTranspose : SPIRVInst<OpCodeTranspose,
  [CapabilityMatrix], (outs), (ins), []>;

// OpSampledImage IdResultType, IdResult, IdRef, IdRef
def OpSampledImage : SPIRVInst<OpCodeSampledImage,
  [], (outs), (ins), []>;

// OpImageSampleImplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSampleImplicitLod : SPIRVInst<OpCodeImageSampleImplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleExplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSampleExplicitLod : SPIRVInst<OpCodeImageSampleExplicitLod,
  [], (outs), (ins), []>;

// OpImageSampleDrefImplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSampleDrefImplicitLod : SPIRVInst<OpCodeImageSampleDrefImplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleDrefExplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSampleDrefExplicitLod : SPIRVInst<OpCodeImageSampleDrefExplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleProjImplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSampleProjImplicitLod : SPIRVInst<OpCodeImageSampleProjImplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleProjExplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSampleProjExplicitLod : SPIRVInst<OpCodeImageSampleProjExplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleProjDrefImplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSampleProjDrefImplicitLod : SPIRVInst<OpCodeImageSampleProjDrefImplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageSampleProjDrefExplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSampleProjDrefExplicitLod : SPIRVInst<OpCodeImageSampleProjDrefExplicitLod,
  [CapabilityShader], (outs), (ins), []>;

// OpImageFetch IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageFetch : SPIRVInst<OpCodeImageFetch,
  [], (outs), (ins), []>;

// OpImageGather IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageGather : SPIRVInst<OpCodeImageGather,
  [CapabilityShader], (outs), (ins), []>;

// OpImageDrefGather IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageDrefGather : SPIRVInst<OpCodeImageDrefGather,
  [CapabilityShader], (outs), (ins), []>;

// OpImageRead IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageRead : SPIRVInst<OpCodeImageRead,
  [], (outs), (ins), []>;

// OpImageWrite IdRef, IdRef, IdRef, ImageOperands
def OpImageWrite : SPIRVInst<OpCodeImageWrite,
  [], (outs), (ins), []>;

// OpImage IdResultType, IdResult, IdRef
def OpImage : SPIRVInst<OpCodeImage,
  [], (outs), (ins), []>;

// OpImageQueryFormat IdResultType, IdResult, IdRef
def OpImageQueryFormat : SPIRVInst<OpCodeImageQueryFormat,
  [CapabilityKernel], (outs), (ins), []>;

// OpImageQueryOrder IdResultType, IdResult, IdRef
def OpImageQueryOrder : SPIRVInst<OpCodeImageQueryOrder,
  [CapabilityKernel], (outs), (ins), []>;

// OpImageQuerySizeLod IdResultType, IdResult, IdRef, IdRef
def OpImageQuerySizeLod : SPIRVInst<OpCodeImageQuerySizeLod,
  [CapabilityKernel, CapabilityImageQuery], (outs), (ins), []>;

// OpImageQuerySize IdResultType, IdResult, IdRef
def OpImageQuerySize : SPIRVInst<OpCodeImageQuerySize,
  [CapabilityKernel, CapabilityImageQuery], (outs), (ins), []>;

// OpImageQueryLod IdResultType, IdResult, IdRef, IdRef
def OpImageQueryLod : SPIRVInst<OpCodeImageQueryLod,
  [CapabilityImageQuery], (outs), (ins), []>;

// OpImageQueryLevels IdResultType, IdResult, IdRef
def OpImageQueryLevels : SPIRVInst<OpCodeImageQueryLevels,
  [CapabilityKernel, CapabilityImageQuery], (outs), (ins), []>;

// OpImageQuerySamples IdResultType, IdResult, IdRef
def OpImageQuerySamples : SPIRVInst<OpCodeImageQuerySamples,
  [CapabilityKernel, CapabilityImageQuery], (outs), (ins), []>;

// OpConvertFToU IdResultType, IdResult, IdRef
def OpConvertFToU : SPIRVInst<OpCodeConvertFToU,
  [], (outs), (ins), []>;

// OpConvertFToS IdResultType, IdResult, IdRef
def OpConvertFToS : SPIRVInst<OpCodeConvertFToS,
  [], (outs), (ins), []>;

// OpConvertSToF IdResultType, IdResult, IdRef
def OpConvertSToF : SPIRVInst<OpCodeConvertSToF,
  [], (outs), (ins), []>;

// OpConvertUToF IdResultType, IdResult, IdRef
def OpConvertUToF : SPIRVInst<OpCodeConvertUToF,
  [], (outs), (ins), []>;

// OpUConvert IdResultType, IdResult, IdRef
def OpUConvert : SPIRVInst<OpCodeUConvert,
  [], (outs), (ins), []>;

// OpSConvert IdResultType, IdResult, IdRef
def OpSConvert : SPIRVInst<OpCodeSConvert,
  [], (outs), (ins), []>;

// OpFConvert IdResultType, IdResult, IdRef
def OpFConvert : SPIRVInst<OpCodeFConvert,
  [], (outs), (ins), []>;

// OpQuantizeToF16 IdResultType, IdResult, IdRef
def OpQuantizeToF16 : SPIRVInst<OpCodeQuantizeToF16,
  [], (outs), (ins), []>;

// OpConvertPtrToU IdResultType, IdResult, IdRef
def OpConvertPtrToU : SPIRVInst<OpCodeConvertPtrToU,
  [CapabilityAddresses], (outs), (ins), []>;

// OpSatConvertSToU IdResultType, IdResult, IdRef
def OpSatConvertSToU : SPIRVInst<OpCodeSatConvertSToU,
  [CapabilityKernel], (outs), (ins), []>;

// OpSatConvertUToS IdResultType, IdResult, IdRef
def OpSatConvertUToS : SPIRVInst<OpCodeSatConvertUToS,
  [CapabilityKernel], (outs), (ins), []>;

// OpConvertUToPtr IdResultType, IdResult, IdRef
def OpConvertUToPtr : SPIRVInst<OpCodeConvertUToPtr,
  [CapabilityAddresses], (outs), (ins), []>;

// OpPtrCastToGeneric IdResultType, IdResult, IdRef
def OpPtrCastToGeneric : SPIRVInst<OpCodePtrCastToGeneric,
  [CapabilityKernel], (outs), (ins), []>;

// OpGenericCastToPtr IdResultType, IdResult, IdRef
def OpGenericCastToPtr : SPIRVInst<OpCodeGenericCastToPtr,
  [CapabilityKernel], (outs), (ins), []>;

// OpGenericCastToPtrExplicit IdResultType, IdResult, IdRef, StorageClass
def OpGenericCastToPtrExplicit : SPIRVInst<OpCodeGenericCastToPtrExplicit,
  [CapabilityKernel], (outs), (ins), []>;

// OpBitcast IdResultType, IdResult, IdRef
def OpBitcast : SPIRVInst<OpCodeBitcast,
  [], (outs), (ins), []>;

// OpSNegate IdResultType, IdResult, IdRef
def OpSNegate : SPIRVInst<OpCodeSNegate,
  [], (outs), (ins), []>;

// OpFNegate IdResultType, IdResult, IdRef
def OpFNegate : SPIRVInst<OpCodeFNegate,
  [], (outs), (ins), []>;

// OpIAdd IdResultType, IdResult, IdRef, IdRef
def OpIAdd : SPIRVInst<OpCodeIAdd,
  [], (outs), (ins), []>;

// OpFAdd IdResultType, IdResult, IdRef, IdRef
def OpFAdd : SPIRVInst<OpCodeFAdd,
  [], (outs), (ins), []>;

// OpISub IdResultType, IdResult, IdRef, IdRef
def OpISub : SPIRVInst<OpCodeISub,
  [], (outs), (ins), []>;

// OpFSub IdResultType, IdResult, IdRef, IdRef
def OpFSub : SPIRVInst<OpCodeFSub,
  [], (outs), (ins), []>;

// OpIMul IdResultType, IdResult, IdRef, IdRef
def OpIMul : SPIRVInst<OpCodeIMul,
  [], (outs), (ins), []>;

// OpFMul IdResultType, IdResult, IdRef, IdRef
def OpFMul : SPIRVInst<OpCodeFMul,
  [], (outs), (ins), []>;

// OpUDiv IdResultType, IdResult, IdRef, IdRef
def OpUDiv : SPIRVInst<OpCodeUDiv,
  [], (outs), (ins), []>;

// OpSDiv IdResultType, IdResult, IdRef, IdRef
def OpSDiv : SPIRVInst<OpCodeSDiv,
  [], (outs), (ins), []>;

// OpFDiv IdResultType, IdResult, IdRef, IdRef
def OpFDiv : SPIRVInst<OpCodeFDiv,
  [], (outs), (ins), []>;

// OpUMod IdResultType, IdResult, IdRef, IdRef
def OpUMod : SPIRVInst<OpCodeUMod,
  [], (outs), (ins), []>;

// OpSRem IdResultType, IdResult, IdRef, IdRef
def OpSRem : SPIRVInst<OpCodeSRem,
  [], (outs), (ins), []>;

// OpSMod IdResultType, IdResult, IdRef, IdRef
def OpSMod : SPIRVInst<OpCodeSMod,
  [], (outs), (ins), []>;

// OpFRem IdResultType, IdResult, IdRef, IdRef
def OpFRem : SPIRVInst<OpCodeFRem,
  [], (outs), (ins), []>;

// OpFMod IdResultType, IdResult, IdRef, IdRef
def OpFMod : SPIRVInst<OpCodeFMod,
  [], (outs), (ins), []>;

// OpVectorTimesScalar IdResultType, IdResult, IdRef, IdRef
def OpVectorTimesScalar : SPIRVInst<OpCodeVectorTimesScalar,
  [], (outs), (ins), []>;

// OpMatrixTimesScalar IdResultType, IdResult, IdRef, IdRef
def OpMatrixTimesScalar : SPIRVInst<OpCodeMatrixTimesScalar,
  [CapabilityMatrix], (outs), (ins), []>;

// OpVectorTimesMatrix IdResultType, IdResult, IdRef, IdRef
def OpVectorTimesMatrix : SPIRVInst<OpCodeVectorTimesMatrix,
  [CapabilityMatrix], (outs), (ins), []>;

// OpMatrixTimesVector IdResultType, IdResult, IdRef, IdRef
def OpMatrixTimesVector : SPIRVInst<OpCodeMatrixTimesVector,
  [CapabilityMatrix], (outs), (ins), []>;

// OpMatrixTimesMatrix IdResultType, IdResult, IdRef, IdRef
def OpMatrixTimesMatrix : SPIRVInst<OpCodeMatrixTimesMatrix,
  [CapabilityMatrix], (outs), (ins), []>;

// OpOuterProduct IdResultType, IdResult, IdRef, IdRef
def OpOuterProduct : SPIRVInst<OpCodeOuterProduct,
  [CapabilityMatrix], (outs), (ins), []>;

// OpDot IdResultType, IdResult, IdRef, IdRef
def OpDot : SPIRVInst<OpCodeDot,
  [], (outs), (ins), []>;

// OpIAddCarry IdResultType, IdResult, IdRef, IdRef
def OpIAddCarry : SPIRVInst<OpCodeIAddCarry,
  [], (outs), (ins), []>;

// OpISubBorrow IdResultType, IdResult, IdRef, IdRef
def OpISubBorrow : SPIRVInst<OpCodeISubBorrow,
  [], (outs), (ins), []>;

// OpUMulExtended IdResultType, IdResult, IdRef, IdRef
def OpUMulExtended : SPIRVInst<OpCodeUMulExtended,
  [], (outs), (ins), []>;

// OpSMulExtended IdResultType, IdResult, IdRef, IdRef
def OpSMulExtended : SPIRVInst<OpCodeSMulExtended,
  [], (outs), (ins), []>;

// OpAny IdResultType, IdResult, IdRef
def OpAny : SPIRVInst<OpCodeAny,
  [], (outs), (ins), []>;

// OpAll IdResultType, IdResult, IdRef
def OpAll : SPIRVInst<OpCodeAll,
  [], (outs), (ins), []>;

// OpIsNan IdResultType, IdResult, IdRef
def OpIsNan : SPIRVInst<OpCodeIsNan,
  [], (outs), (ins), []>;

// OpIsInf IdResultType, IdResult, IdRef
def OpIsInf : SPIRVInst<OpCodeIsInf,
  [], (outs), (ins), []>;

// OpIsFinite IdResultType, IdResult, IdRef
def OpIsFinite : SPIRVInst<OpCodeIsFinite,
  [CapabilityKernel], (outs), (ins), []>;

// OpIsNormal IdResultType, IdResult, IdRef
def OpIsNormal : SPIRVInst<OpCodeIsNormal,
  [CapabilityKernel], (outs), (ins), []>;

// OpSignBitSet IdResultType, IdResult, IdRef
def OpSignBitSet : SPIRVInst<OpCodeSignBitSet,
  [CapabilityKernel], (outs), (ins), []>;

// OpLessOrGreater IdResultType, IdResult, IdRef, IdRef
def OpLessOrGreater : SPIRVInst<OpCodeLessOrGreater,
  [CapabilityKernel], (outs), (ins), []>;

// OpOrdered IdResultType, IdResult, IdRef, IdRef
def OpOrdered : SPIRVInst<OpCodeOrdered,
  [CapabilityKernel], (outs), (ins), []>;

// OpUnordered IdResultType, IdResult, IdRef, IdRef
def OpUnordered : SPIRVInst<OpCodeUnordered,
  [CapabilityKernel], (outs), (ins), []>;

// OpLogicalEqual IdResultType, IdResult, IdRef, IdRef
def OpLogicalEqual : SPIRVInst<OpCodeLogicalEqual,
  [], (outs), (ins), []>;

// OpLogicalNotEqual IdResultType, IdResult, IdRef, IdRef
def OpLogicalNotEqual : SPIRVInst<OpCodeLogicalNotEqual,
  [], (outs), (ins), []>;

// OpLogicalOr IdResultType, IdResult, IdRef, IdRef
def OpLogicalOr : SPIRVInst<OpCodeLogicalOr,
  [], (outs), (ins), []>;

// OpLogicalAnd IdResultType, IdResult, IdRef, IdRef
def OpLogicalAnd : SPIRVInst<OpCodeLogicalAnd,
  [], (outs), (ins), []>;

// OpLogicalNot IdResultType, IdResult, IdRef
def OpLogicalNot : SPIRVInst<OpCodeLogicalNot,
  [], (outs), (ins), []>;

// OpSelect IdResultType, IdResult, IdRef, IdRef, IdRef
def OpSelect : SPIRVInst<OpCodeSelect,
  [], (outs), (ins), []>;

// OpIEqual IdResultType, IdResult, IdRef, IdRef
def OpIEqual : SPIRVInst<OpCodeIEqual,
  [], (outs), (ins), []>;

// OpINotEqual IdResultType, IdResult, IdRef, IdRef
def OpINotEqual : SPIRVInst<OpCodeINotEqual,
  [], (outs), (ins), []>;

// OpUGreaterThan IdResultType, IdResult, IdRef, IdRef
def OpUGreaterThan : SPIRVInst<OpCodeUGreaterThan,
  [], (outs), (ins), []>;

// OpSGreaterThan IdResultType, IdResult, IdRef, IdRef
def OpSGreaterThan : SPIRVInst<OpCodeSGreaterThan,
  [], (outs), (ins), []>;

// OpUGreaterThanEqual IdResultType, IdResult, IdRef, IdRef
def OpUGreaterThanEqual : SPIRVInst<OpCodeUGreaterThanEqual,
  [], (outs), (ins), []>;

// OpSGreaterThanEqual IdResultType, IdResult, IdRef, IdRef
def OpSGreaterThanEqual : SPIRVInst<OpCodeSGreaterThanEqual,
  [], (outs), (ins), []>;

// OpULessThan IdResultType, IdResult, IdRef, IdRef
def OpULessThan : SPIRVInst<OpCodeULessThan,
  [], (outs), (ins), []>;

// OpSLessThan IdResultType, IdResult, IdRef, IdRef
def OpSLessThan : SPIRVInst<OpCodeSLessThan,
  [], (outs), (ins), []>;

// OpULessThanEqual IdResultType, IdResult, IdRef, IdRef
def OpULessThanEqual : SPIRVInst<OpCodeULessThanEqual,
  [], (outs), (ins), []>;

// OpSLessThanEqual IdResultType, IdResult, IdRef, IdRef
def OpSLessThanEqual : SPIRVInst<OpCodeSLessThanEqual,
  [], (outs), (ins), []>;

// OpFOrdEqual IdResultType, IdResult, IdRef, IdRef
def OpFOrdEqual : SPIRVInst<OpCodeFOrdEqual,
  [], (outs), (ins), []>;

// OpFUnordEqual IdResultType, IdResult, IdRef, IdRef
def OpFUnordEqual : SPIRVInst<OpCodeFUnordEqual,
  [], (outs), (ins), []>;

// OpFOrdNotEqual IdResultType, IdResult, IdRef, IdRef
def OpFOrdNotEqual : SPIRVInst<OpCodeFOrdNotEqual,
  [], (outs), (ins), []>;

// OpFUnordNotEqual IdResultType, IdResult, IdRef, IdRef
def OpFUnordNotEqual : SPIRVInst<OpCodeFUnordNotEqual,
  [], (outs), (ins), []>;

// OpFOrdLessThan IdResultType, IdResult, IdRef, IdRef
def OpFOrdLessThan : SPIRVInst<OpCodeFOrdLessThan,
  [], (outs), (ins), []>;

// OpFUnordLessThan IdResultType, IdResult, IdRef, IdRef
def OpFUnordLessThan : SPIRVInst<OpCodeFUnordLessThan,
  [], (outs), (ins), []>;

// OpFOrdGreaterThan IdResultType, IdResult, IdRef, IdRef
def OpFOrdGreaterThan : SPIRVInst<OpCodeFOrdGreaterThan,
  [], (outs), (ins), []>;

// OpFUnordGreaterThan IdResultType, IdResult, IdRef, IdRef
def OpFUnordGreaterThan : SPIRVInst<OpCodeFUnordGreaterThan,
  [], (outs), (ins), []>;

// OpFOrdLessThanEqual IdResultType, IdResult, IdRef, IdRef
def OpFOrdLessThanEqual : SPIRVInst<OpCodeFOrdLessThanEqual,
  [], (outs), (ins), []>;

// OpFUnordLessThanEqual IdResultType, IdResult, IdRef, IdRef
def OpFUnordLessThanEqual : SPIRVInst<OpCodeFUnordLessThanEqual,
  [], (outs), (ins), []>;

// OpFOrdGreaterThanEqual IdResultType, IdResult, IdRef, IdRef
def OpFOrdGreaterThanEqual : SPIRVInst<OpCodeFOrdGreaterThanEqual,
  [], (outs), (ins), []>;

// OpFUnordGreaterThanEqual IdResultType, IdResult, IdRef, IdRef
def OpFUnordGreaterThanEqual : SPIRVInst<OpCodeFUnordGreaterThanEqual,
  [], (outs), (ins), []>;

// OpShiftRightLogical IdResultType, IdResult, IdRef, IdRef
def OpShiftRightLogical : SPIRVInst<OpCodeShiftRightLogical,
  [], (outs), (ins), []>;

// OpShiftRightArithmetic IdResultType, IdResult, IdRef, IdRef
def OpShiftRightArithmetic : SPIRVInst<OpCodeShiftRightArithmetic,
  [], (outs), (ins), []>;

// OpShiftLeftLogical IdResultType, IdResult, IdRef, IdRef
def OpShiftLeftLogical : SPIRVInst<OpCodeShiftLeftLogical,
  [], (outs), (ins), []>;

// OpBitwiseOr IdResultType, IdResult, IdRef, IdRef
def OpBitwiseOr : SPIRVInst<OpCodeBitwiseOr,
  [], (outs), (ins), []>;

// OpBitwiseXor IdResultType, IdResult, IdRef, IdRef
def OpBitwiseXor : SPIRVInst<OpCodeBitwiseXor,
  [], (outs), (ins), []>;

// OpBitwiseAnd IdResultType, IdResult, IdRef, IdRef
def OpBitwiseAnd : SPIRVInst<OpCodeBitwiseAnd,
  [], (outs), (ins), []>;

// OpNot IdResultType, IdResult, IdRef
def OpNot : SPIRVInst<OpCodeNot,
  [], (outs), (ins), []>;

// OpBitFieldInsert IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpBitFieldInsert : SPIRVInst<OpCodeBitFieldInsert,
  [CapabilityShader], (outs), (ins), []>;

// OpBitFieldSExtract IdResultType, IdResult, IdRef, IdRef, IdRef
def OpBitFieldSExtract : SPIRVInst<OpCodeBitFieldSExtract,
  [CapabilityShader], (outs), (ins), []>;

// OpBitFieldUExtract IdResultType, IdResult, IdRef, IdRef, IdRef
def OpBitFieldUExtract : SPIRVInst<OpCodeBitFieldUExtract,
  [CapabilityShader], (outs), (ins), []>;

// OpBitReverse IdResultType, IdResult, IdRef
def OpBitReverse : SPIRVInst<OpCodeBitReverse,
  [CapabilityShader], (outs), (ins), []>;

// OpBitCount IdResultType, IdResult, IdRef
def OpBitCount : SPIRVInst<OpCodeBitCount,
  [], (outs), (ins), []>;

// OpDPdx IdResultType, IdResult, IdRef
def OpDPdx : SPIRVInst<OpCodeDPdx,
  [CapabilityShader], (outs), (ins), []>;

// OpDPdy IdResultType, IdResult, IdRef
def OpDPdy : SPIRVInst<OpCodeDPdy,
  [CapabilityShader], (outs), (ins), []>;

// OpFwidth IdResultType, IdResult, IdRef
def OpFwidth : SPIRVInst<OpCodeFwidth,
  [CapabilityShader], (outs), (ins), []>;

// OpDPdxFine IdResultType, IdResult, IdRef
def OpDPdxFine : SPIRVInst<OpCodeDPdxFine,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpDPdyFine IdResultType, IdResult, IdRef
def OpDPdyFine : SPIRVInst<OpCodeDPdyFine,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpFwidthFine IdResultType, IdResult, IdRef
def OpFwidthFine : SPIRVInst<OpCodeFwidthFine,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpDPdxCoarse IdResultType, IdResult, IdRef
def OpDPdxCoarse : SPIRVInst<OpCodeDPdxCoarse,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpDPdyCoarse IdResultType, IdResult, IdRef
def OpDPdyCoarse : SPIRVInst<OpCodeDPdyCoarse,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpFwidthCoarse IdResultType, IdResult, IdRef
def OpFwidthCoarse : SPIRVInst<OpCodeFwidthCoarse,
  [CapabilityDerivativeControl], (outs), (ins), []>;

// OpEmitVertex 
def OpEmitVertex : SPIRVInst<OpCodeEmitVertex,
  [CapabilityGeometry], (outs), (ins), []>;

// OpEndPrimitive 
def OpEndPrimitive : SPIRVInst<OpCodeEndPrimitive,
  [CapabilityGeometry], (outs), (ins), []>;

// OpEmitStreamVertex IdRef
def OpEmitStreamVertex : SPIRVInst<OpCodeEmitStreamVertex,
  [CapabilityGeometryStreams], (outs), (ins), []>;

// OpEndStreamPrimitive IdRef
def OpEndStreamPrimitive : SPIRVInst<OpCodeEndStreamPrimitive,
  [CapabilityGeometryStreams], (outs), (ins), []>;

// OpControlBarrier IdScope, IdScope, IdMemorySemantics
def OpControlBarrier : SPIRVInst<OpCodeControlBarrier,
  [], (outs), (ins), []>;

// OpMemoryBarrier IdScope, IdMemorySemantics
def OpMemoryBarrier : SPIRVInst<OpCodeMemoryBarrier,
  [], (outs), (ins), []>;

// OpAtomicLoad IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics
def OpAtomicLoad : SPIRVInst<OpCodeAtomicLoad,
  [], (outs), (ins), []>;

// OpAtomicStore IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicStore : SPIRVInst<OpCodeAtomicStore,
  [], (outs), (ins), []>;

// OpAtomicExchange IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicExchange : SPIRVInst<OpCodeAtomicExchange,
  [], (outs), (ins), []>;

// OpAtomicCompareExchange IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdMemorySemantics, IdRef, IdRef
def OpAtomicCompareExchange : SPIRVInst<OpCodeAtomicCompareExchange,
  [], (outs), (ins), []>;

// OpAtomicCompareExchangeWeak IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdMemorySemantics, IdRef, IdRef
def OpAtomicCompareExchangeWeak : SPIRVInst<OpCodeAtomicCompareExchangeWeak,
  [CapabilityKernel], (outs), (ins), []>;

// OpAtomicIIncrement IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics
def OpAtomicIIncrement : SPIRVInst<OpCodeAtomicIIncrement,
  [], (outs), (ins), []>;

// OpAtomicIDecrement IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics
def OpAtomicIDecrement : SPIRVInst<OpCodeAtomicIDecrement,
  [], (outs), (ins), []>;

// OpAtomicIAdd IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicIAdd : SPIRVInst<OpCodeAtomicIAdd,
  [], (outs), (ins), []>;

// OpAtomicISub IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicISub : SPIRVInst<OpCodeAtomicISub,
  [], (outs), (ins), []>;

// OpAtomicSMin IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicSMin : SPIRVInst<OpCodeAtomicSMin,
  [], (outs), (ins), []>;

// OpAtomicUMin IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicUMin : SPIRVInst<OpCodeAtomicUMin,
  [], (outs), (ins), []>;

// OpAtomicSMax IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicSMax : SPIRVInst<OpCodeAtomicSMax,
  [], (outs), (ins), []>;

// OpAtomicUMax IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicUMax : SPIRVInst<OpCodeAtomicUMax,
  [], (outs), (ins), []>;

// OpAtomicAnd IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicAnd : SPIRVInst<OpCodeAtomicAnd,
  [], (outs), (ins), []>;

// OpAtomicOr IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicOr : SPIRVInst<OpCodeAtomicOr,
  [], (outs), (ins), []>;

// OpAtomicXor IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics, IdRef
def OpAtomicXor : SPIRVInst<OpCodeAtomicXor,
  [], (outs), (ins), []>;

// OpPhi IdResultType, IdResult, PairIdRefIdRef
def OpPhi : SPIRVInst<OpCodePhi,
  [], (outs), (ins), []>;

// OpLoopMerge IdRef, IdRef, LoopControl
def OpLoopMerge : SPIRVInst<OpCodeLoopMerge,
  [], (outs), (ins), []>;

// OpSelectionMerge IdRef, SelectionControl
def OpSelectionMerge : SPIRVInst<OpCodeSelectionMerge,
  [], (outs), (ins), []>;

// OpLabel IdResult
def OpLabel : SPIRVInst<OpCodeLabel,
  [], (outs), (ins), []>;

// OpBranch IdRef
def OpBranch : SPIRVInst<OpCodeBranch,
  [], (outs), (ins), []>;

// OpBranchConditional IdRef, IdRef, IdRef, LiteralInteger
def OpBranchConditional : SPIRVInst<OpCodeBranchConditional,
  [], (outs), (ins), []>;

// OpSwitch IdRef, IdRef, PairLiteralIntegerIdRef
def OpSwitch : SPIRVInst<OpCodeSwitch,
  [], (outs), (ins), []>;

// OpKill 
def OpKill : SPIRVInst<OpCodeKill,
  [CapabilityShader], (outs), (ins), []>;

// OpReturn 
//def OpReturn : SPIRVInst<OpCodeReturn,
  //[], (outs), (ins), []>;

// OpReturnValue IdRef
def OpReturnValue : SPIRVInst<OpCodeReturnValue,
  [], (outs), (ins), []>;

// OpUnreachable 
def OpUnreachable : SPIRVInst<OpCodeUnreachable,
  [], (outs), (ins), []>;

// OpLifetimeStart IdRef, LiteralInteger
def OpLifetimeStart : SPIRVInst<OpCodeLifetimeStart,
  [CapabilityKernel], (outs), (ins), []>;

// OpLifetimeStop IdRef, LiteralInteger
def OpLifetimeStop : SPIRVInst<OpCodeLifetimeStop,
  [CapabilityKernel], (outs), (ins), []>;

// OpGroupAsyncCopy IdResultType, IdResult, IdScope, IdRef, IdRef, IdRef, IdRef, IdRef
def OpGroupAsyncCopy : SPIRVInst<OpCodeGroupAsyncCopy,
  [CapabilityKernel], (outs), (ins), []>;

// OpGroupWaitEvents IdScope, IdRef, IdRef
def OpGroupWaitEvents : SPIRVInst<OpCodeGroupWaitEvents,
  [CapabilityKernel], (outs), (ins), []>;

// OpGroupAll IdResultType, IdResult, IdScope, IdRef
def OpGroupAll : SPIRVInst<OpCodeGroupAll,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupAny IdResultType, IdResult, IdScope, IdRef
def OpGroupAny : SPIRVInst<OpCodeGroupAny,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupBroadcast IdResultType, IdResult, IdScope, IdRef, IdRef
def OpGroupBroadcast : SPIRVInst<OpCodeGroupBroadcast,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupIAdd IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupIAdd : SPIRVInst<OpCodeGroupIAdd,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupFAdd IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupFAdd : SPIRVInst<OpCodeGroupFAdd,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupFMin IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupFMin : SPIRVInst<OpCodeGroupFMin,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupUMin IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupUMin : SPIRVInst<OpCodeGroupUMin,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupSMin IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupSMin : SPIRVInst<OpCodeGroupSMin,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupFMax IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupFMax : SPIRVInst<OpCodeGroupFMax,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupUMax IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupUMax : SPIRVInst<OpCodeGroupUMax,
  [CapabilityGroups], (outs), (ins), []>;

// OpGroupSMax IdResultType, IdResult, IdScope, GroupOperation, IdRef
def OpGroupSMax : SPIRVInst<OpCodeGroupSMax,
  [CapabilityGroups], (outs), (ins), []>;

// OpReadPipe IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpReadPipe : SPIRVInst<OpCodeReadPipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpWritePipe IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpWritePipe : SPIRVInst<OpCodeWritePipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpReservedReadPipe IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef
def OpReservedReadPipe : SPIRVInst<OpCodeReservedReadPipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpReservedWritePipe IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef
def OpReservedWritePipe : SPIRVInst<OpCodeReservedWritePipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpReserveReadPipePackets IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpReserveReadPipePackets : SPIRVInst<OpCodeReserveReadPipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpReserveWritePipePackets IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpReserveWritePipePackets : SPIRVInst<OpCodeReserveWritePipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpCommitReadPipe IdRef, IdRef, IdRef, IdRef
def OpCommitReadPipe : SPIRVInst<OpCodeCommitReadPipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpCommitWritePipe IdRef, IdRef, IdRef, IdRef
def OpCommitWritePipe : SPIRVInst<OpCodeCommitWritePipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpIsValidReserveId IdResultType, IdResult, IdRef
def OpIsValidReserveId : SPIRVInst<OpCodeIsValidReserveId,
  [CapabilityPipes], (outs), (ins), []>;

// OpGetNumPipePackets IdResultType, IdResult, IdRef, IdRef, IdRef
def OpGetNumPipePackets : SPIRVInst<OpCodeGetNumPipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpGetMaxPipePackets IdResultType, IdResult, IdRef, IdRef, IdRef
def OpGetMaxPipePackets : SPIRVInst<OpCodeGetMaxPipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpGroupReserveReadPipePackets IdResultType, IdResult, IdScope, IdRef, IdRef, IdRef, IdRef
def OpGroupReserveReadPipePackets : SPIRVInst<OpCodeGroupReserveReadPipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpGroupReserveWritePipePackets IdResultType, IdResult, IdScope, IdRef, IdRef, IdRef, IdRef
def OpGroupReserveWritePipePackets : SPIRVInst<OpCodeGroupReserveWritePipePackets,
  [CapabilityPipes], (outs), (ins), []>;

// OpGroupCommitReadPipe IdScope, IdRef, IdRef, IdRef, IdRef
def OpGroupCommitReadPipe : SPIRVInst<OpCodeGroupCommitReadPipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpGroupCommitWritePipe IdScope, IdRef, IdRef, IdRef, IdRef
def OpGroupCommitWritePipe : SPIRVInst<OpCodeGroupCommitWritePipe,
  [CapabilityPipes], (outs), (ins), []>;

// OpEnqueueMarker IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpEnqueueMarker : SPIRVInst<OpCodeEnqueueMarker,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpEnqueueKernel IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef, IdRef
def OpEnqueueKernel : SPIRVInst<OpCodeEnqueueKernel,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpGetKernelNDrangeSubGroupCount IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef
def OpGetKernelNDrangeSubGroupCount : SPIRVInst<OpCodeGetKernelNDrangeSubGroupCount,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpGetKernelNDrangeMaxSubGroupSize IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef
def OpGetKernelNDrangeMaxSubGroupSize : SPIRVInst<OpCodeGetKernelNDrangeMaxSubGroupSize,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpGetKernelWorkGroupSize IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpGetKernelWorkGroupSize : SPIRVInst<OpCodeGetKernelWorkGroupSize,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpGetKernelPreferredWorkGroupSizeMultiple IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpGetKernelPreferredWorkGroupSizeMultiple : SPIRVInst<OpCodeGetKernelPreferredWorkGroupSizeMultiple,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpRetainEvent IdRef
def OpRetainEvent : SPIRVInst<OpCodeRetainEvent,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpReleaseEvent IdRef
def OpReleaseEvent : SPIRVInst<OpCodeReleaseEvent,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpCreateUserEvent IdResultType, IdResult
def OpCreateUserEvent : SPIRVInst<OpCodeCreateUserEvent,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpIsValidEvent IdResultType, IdResult, IdRef
def OpIsValidEvent : SPIRVInst<OpCodeIsValidEvent,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpSetUserEventStatus IdRef, IdRef
def OpSetUserEventStatus : SPIRVInst<OpCodeSetUserEventStatus,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpCaptureEventProfilingInfo IdRef, IdRef, IdRef
def OpCaptureEventProfilingInfo : SPIRVInst<OpCodeCaptureEventProfilingInfo,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpGetDefaultQueue IdResultType, IdResult
def OpGetDefaultQueue : SPIRVInst<OpCodeGetDefaultQueue,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpBuildNDRange IdResultType, IdResult, IdRef, IdRef, IdRef
def OpBuildNDRange : SPIRVInst<OpCodeBuildNDRange,
  [CapabilityDeviceEnqueue], (outs), (ins), []>;

// OpImageSparseSampleImplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseSampleImplicitLod : SPIRVInst<OpCodeImageSparseSampleImplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleExplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseSampleExplicitLod : SPIRVInst<OpCodeImageSparseSampleExplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleDrefImplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseSampleDrefImplicitLod : SPIRVInst<OpCodeImageSparseSampleDrefImplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleDrefExplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseSampleDrefExplicitLod : SPIRVInst<OpCodeImageSparseSampleDrefExplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleProjImplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseSampleProjImplicitLod : SPIRVInst<OpCodeImageSparseSampleProjImplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleProjExplicitLod IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseSampleProjExplicitLod : SPIRVInst<OpCodeImageSparseSampleProjExplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleProjDrefImplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseSampleProjDrefImplicitLod : SPIRVInst<OpCodeImageSparseSampleProjDrefImplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseSampleProjDrefExplicitLod IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseSampleProjDrefExplicitLod : SPIRVInst<OpCodeImageSparseSampleProjDrefExplicitLod,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseFetch IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseFetch : SPIRVInst<OpCodeImageSparseFetch,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseGather IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseGather : SPIRVInst<OpCodeImageSparseGather,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseDrefGather IdResultType, IdResult, IdRef, IdRef, IdRef, ImageOperands
def OpImageSparseDrefGather : SPIRVInst<OpCodeImageSparseDrefGather,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpImageSparseTexelsResident IdResultType, IdResult, IdRef
def OpImageSparseTexelsResident : SPIRVInst<OpCodeImageSparseTexelsResident,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpNoLine 
def OpNoLine : SPIRVInst<OpCodeNoLine,
  [], (outs), (ins), []>;

// OpAtomicFlagTestAndSet IdResultType, IdResult, IdRef, IdScope, IdMemorySemantics
def OpAtomicFlagTestAndSet : SPIRVInst<OpCodeAtomicFlagTestAndSet,
  [CapabilityKernel], (outs), (ins), []>;

// OpAtomicFlagClear IdRef, IdScope, IdMemorySemantics
def OpAtomicFlagClear : SPIRVInst<OpCodeAtomicFlagClear,
  [CapabilityKernel], (outs), (ins), []>;

// OpImageSparseRead IdResultType, IdResult, IdRef, IdRef, ImageOperands
def OpImageSparseRead : SPIRVInst<OpCodeImageSparseRead,
  [CapabilitySparseResidency], (outs), (ins), []>;

// OpSizeOf IdResultType, IdResult, IdRef
def OpSizeOf : SPIRVInst<OpCodeSizeOf,
  [CapabilityAddresses], (outs), (ins), []>;

// OpTypePipeStorage IdResult
def OpTypePipeStorage : SPIRVInst<OpCodeTypePipeStorage,
  [CapabilityPipeStorage], (outs), (ins), []>;

// OpConstantPipeStorage IdResultType, IdResult, LiteralInteger, LiteralInteger, LiteralInteger
def OpConstantPipeStorage : SPIRVInst<OpCodeConstantPipeStorage,
  [CapabilityPipeStorage], (outs), (ins), []>;

// OpCreatePipeFromPipeStorage IdResultType, IdResult, IdRef
def OpCreatePipeFromPipeStorage : SPIRVInst<OpCodeCreatePipeFromPipeStorage,
  [CapabilityPipeStorage], (outs), (ins), []>;

// OpGetKernelLocalSizeForSubgroupCount IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef, IdRef
def OpGetKernelLocalSizeForSubgroupCount : SPIRVInst<OpCodeGetKernelLocalSizeForSubgroupCount,
  [CapabilitySubgroupDispatch], (outs), (ins), []>;

// OpGetKernelMaxNumSubgroups IdResultType, IdResult, IdRef, IdRef, IdRef, IdRef
def OpGetKernelMaxNumSubgroups : SPIRVInst<OpCodeGetKernelMaxNumSubgroups,
  [CapabilitySubgroupDispatch], (outs), (ins), []>;

// OpTypeNamedBarrier IdResult
def OpTypeNamedBarrier : SPIRVInst<OpCodeTypeNamedBarrier,
  [CapabilityNamedBarrier], (outs), (ins), []>;

// OpNamedBarrierInitialize IdResultType, IdResult, IdRef
def OpNamedBarrierInitialize : SPIRVInst<OpCodeNamedBarrierInitialize,
  [CapabilityNamedBarrier], (outs), (ins), []>;

// OpMemoryNamedBarrier IdRef, IdScope, IdMemorySemantics
def OpMemoryNamedBarrier : SPIRVInst<OpCodeMemoryNamedBarrier,
  [CapabilityNamedBarrier], (outs), (ins), []>;

// OpModuleProcessed LiteralString
def OpModuleProcessed : SPIRVInst<OpCodeModuleProcessed,
  [], (outs), (ins), []>;

// OpSubgroupBallotKHR IdResultType, IdResult, IdRef
def OpSubgroupBallotKHR : SPIRVInst<OpCodeSubgroupBallotKHR,
  [CapabilitySubgroupBallotKHR], (outs), (ins), []>;

// OpSubgroupFirstInvocationKHR IdResultType, IdResult, IdRef
def OpSubgroupFirstInvocationKHR : SPIRVInst<OpCodeSubgroupFirstInvocationKHR,
  [CapabilitySubgroupBallotKHR], (outs), (ins), []>;

//===----------------------------------------------------------------------===//
// Additional sets of instructions.
//===----------------------------------------------------------------------===//
include "SPIRVInstrControl.td"
