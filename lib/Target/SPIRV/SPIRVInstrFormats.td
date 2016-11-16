//===- SPIRVInstrFormats.td - SPIR-V Instruction Formats -----*- tablegen -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief SPIR-V instruction format definitions.
///
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Enum definitions, auto generated with SPIRVMetaGen.py
//===----------------------------------------------------------------------===//
class SourceLanguage<int v, string n> {
  int Value = v;
  string NAME = n;
}

def SourceLanguageESSL: SourceLanguage<1, "ESSL"> {}
def SourceLanguageUnknown: SourceLanguage<0, "Unknown"> {}
def SourceLanguageOpenCL_C: SourceLanguage<3, "OpenCL_C"> {}
def SourceLanguageGLSL: SourceLanguage<2, "GLSL"> {}
def SourceLanguageOpenCL_CPP: SourceLanguage<4, "OpenCL_CPP"> {}

class ExecutionModel<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ExecutionModelTessellationControl: ExecutionModel<1, "TessellationControl"> {}
def ExecutionModelKernel: ExecutionModel<6, "Kernel"> {}
def ExecutionModelVertex: ExecutionModel<0, "Vertex"> {}
def ExecutionModelFragment: ExecutionModel<4, "Fragment"> {}
def ExecutionModelTessellationEvaluation: ExecutionModel<2, "TessellationEvaluation"> {}
def ExecutionModelGLCompute: ExecutionModel<5, "GLCompute"> {}
def ExecutionModelGeometry: ExecutionModel<3, "Geometry"> {}

class AddressingModel<int v, string n> {
  int Value = v;
  string NAME = n;
}

def AddressingModelPhysical32: AddressingModel<1, "Physical32"> {}
def AddressingModelLogical: AddressingModel<0, "Logical"> {}
def AddressingModelPhysical64: AddressingModel<2, "Physical64"> {}

class MemoryModel<int v, string n> {
  int Value = v;
  string NAME = n;
}

def MemoryModelSimple: MemoryModel<0, "Simple"> {}
def MemoryModelGLSL450: MemoryModel<1, "GLSL450"> {}
def MemoryModelOpenCL: MemoryModel<2, "OpenCL"> {}

class ExecutionMode<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ExecutionModeInputLines: ExecutionMode<20, "InputLines"> {}
def ExecutionModeTriangles: ExecutionMode<22, "Triangles"> {}
def ExecutionModeSubgroupsPerWorkgroup: ExecutionMode<36, "SubgroupsPerWorkgroup"> {}
def ExecutionModeOutputLineStrip: ExecutionMode<28, "OutputLineStrip"> {}
def ExecutionModeDepthUnchanged: ExecutionMode<16, "DepthUnchanged"> {}
def ExecutionModeInvocations: ExecutionMode<0, "Invocations"> {}
def ExecutionModeDepthLess: ExecutionMode<15, "DepthLess"> {}
def ExecutionModeLocalSize: ExecutionMode<17, "LocalSize"> {}
def ExecutionModeInputTrianglesAdjacency: ExecutionMode<23, "InputTrianglesAdjacency"> {}
def ExecutionModeOriginUpperLeft: ExecutionMode<7, "OriginUpperLeft"> {}
def ExecutionModeFinalizer: ExecutionMode<34, "Finalizer"> {}
def ExecutionModeInputPoints: ExecutionMode<19, "InputPoints"> {}
def ExecutionModeEarlyFragmentTests: ExecutionMode<9, "EarlyFragmentTests"> {}
def ExecutionModeVertexOrderCcw: ExecutionMode<5, "VertexOrderCcw"> {}
def ExecutionModeVertexOrderCw: ExecutionMode<4, "VertexOrderCw"> {}
def ExecutionModeIsolines: ExecutionMode<25, "Isolines"> {}
def ExecutionModeInputLinesAdjacency: ExecutionMode<21, "InputLinesAdjacency"> {}
def ExecutionModeOutputVertices: ExecutionMode<26, "OutputVertices"> {}
def ExecutionModeOutputPoints: ExecutionMode<27, "OutputPoints"> {}
def ExecutionModeSpacingEqual: ExecutionMode<1, "SpacingEqual"> {}
def ExecutionModeOutputTriangleStrip: ExecutionMode<29, "OutputTriangleStrip"> {}
def ExecutionModeDepthReplacing: ExecutionMode<12, "DepthReplacing"> {}
def ExecutionModePointMode: ExecutionMode<10, "PointMode"> {}
def ExecutionModeContractionOff: ExecutionMode<31, "ContractionOff"> {}
def ExecutionModeDepthGreater: ExecutionMode<14, "DepthGreater"> {}
def ExecutionModeSubgroupSize: ExecutionMode<35, "SubgroupSize"> {}
def ExecutionModeOriginLowerLeft: ExecutionMode<8, "OriginLowerLeft"> {}
def ExecutionModeXfb: ExecutionMode<11, "Xfb"> {}
def ExecutionModeQuads: ExecutionMode<24, "Quads"> {}
def ExecutionModeSpacingFractionalEven: ExecutionMode<2, "SpacingFractionalEven"> {}
def ExecutionModeSpacingFractionalOdd: ExecutionMode<3, "SpacingFractionalOdd"> {}
def ExecutionModeInitializer: ExecutionMode<33, "Initializer"> {}
def ExecutionModePixelCenterInteger: ExecutionMode<6, "PixelCenterInteger"> {}
def ExecutionModeVecTypeHint: ExecutionMode<30, "VecTypeHint"> {}
def ExecutionModeLocalSizeHint: ExecutionMode<18, "LocalSizeHint"> {}

class StorageClass<int v, string n> {
  int Value = v;
  string NAME = n;
}

def StorageClassGeneric: StorageClass<8, "Generic"> {}
def StorageClassCrossWorkgroup: StorageClass<5, "CrossWorkgroup"> {}
def StorageClassInput: StorageClass<1, "Input"> {}
def StorageClassPushConstant: StorageClass<9, "PushConstant"> {}
def StorageClassOutput: StorageClass<3, "Output"> {}
def StorageClassUniformConstant: StorageClass<0, "UniformConstant"> {}
def StorageClassImage: StorageClass<11, "Image"> {}
def StorageClassPrivate: StorageClass<6, "Private"> {}
def StorageClassAtomicCounter: StorageClass<10, "AtomicCounter"> {}
def StorageClassUniform: StorageClass<2, "Uniform"> {}
def StorageClassWorkgroup: StorageClass<4, "Workgroup"> {}
def StorageClassFunction: StorageClass<7, "Function"> {}

class Dim<int v, string n> {
  int Value = v;
  string NAME = n;
}

def DimDim2D: Dim<1, "Dim2D"> {}
def DimSubpassData: Dim<6, "SubpassData"> {}
def DimRect: Dim<4, "Rect"> {}
def DimBuffer: Dim<5, "Buffer"> {}
def DimDim1D: Dim<0, "Dim1D"> {}
def DimDim3D: Dim<2, "Dim3D"> {}
def DimCube: Dim<3, "Cube"> {}

class SamplerAddressingMode<int v, string n> {
  int Value = v;
  string NAME = n;
}

def SamplerAddressingModeRepeat: SamplerAddressingMode<3, "Repeat"> {}
def SamplerAddressingModeClamp: SamplerAddressingMode<2, "Clamp"> {}
def SamplerAddressingModeClampToEdge: SamplerAddressingMode<1, "ClampToEdge"> {}
def SamplerAddressingModeNone: SamplerAddressingMode<0, "None"> {}
def SamplerAddressingModeRepeatMirrored: SamplerAddressingMode<4, "RepeatMirrored"> {}

class SamplerFilterMode<int v, string n> {
  int Value = v;
  string NAME = n;
}

def SamplerFilterModeLinear: SamplerFilterMode<1, "Linear"> {}
def SamplerFilterModeNearest: SamplerFilterMode<0, "Nearest"> {}

class ImageFormat<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ImageFormatRgba32i: ImageFormat<21, "Rgba32i"> {}
def ImageFormatR8ui: ImageFormat<39, "R8ui"> {}
def ImageFormatRgba16: ImageFormat<10, "Rgba16"> {}
def ImageFormatRg16Snorm: ImageFormat<17, "Rg16Snorm"> {}
def ImageFormatRg32i: ImageFormat<25, "Rg32i"> {}
def ImageFormatUnknown: ImageFormat<0, "Unknown"> {}
def ImageFormatRgba8i: ImageFormat<23, "Rgba8i"> {}
def ImageFormatRg16: ImageFormat<12, "Rg16"> {}
def ImageFormatR8Snorm: ImageFormat<20, "R8Snorm"> {}
def ImageFormatRg16i: ImageFormat<26, "Rg16i"> {}
def ImageFormatR16ui: ImageFormat<38, "R16ui"> {}
def ImageFormatRgba16ui: ImageFormat<31, "Rgba16ui"> {}
def ImageFormatRgba32f: ImageFormat<1, "Rgba32f"> {}
def ImageFormatR16: ImageFormat<14, "R16"> {}
def ImageFormatR16i: ImageFormat<28, "R16i"> {}
def ImageFormatRg8ui: ImageFormat<37, "Rg8ui"> {}
def ImageFormatRg16f: ImageFormat<7, "Rg16f"> {}
def ImageFormatR16f: ImageFormat<9, "R16f"> {}
def ImageFormatRg16ui: ImageFormat<36, "Rg16ui"> {}
def ImageFormatRgba32ui: ImageFormat<30, "Rgba32ui"> {}
def ImageFormatRgb10a2ui: ImageFormat<34, "Rgb10a2ui"> {}
def ImageFormatRg8: ImageFormat<13, "Rg8"> {}
def ImageFormatRgba8: ImageFormat<4, "Rgba8"> {}
def ImageFormatRgba16i: ImageFormat<22, "Rgba16i"> {}
def ImageFormatR32i: ImageFormat<24, "R32i"> {}
def ImageFormatRgba16Snorm: ImageFormat<16, "Rgba16Snorm"> {}
def ImageFormatRg8Snorm: ImageFormat<18, "Rg8Snorm"> {}
def ImageFormatRgba16f: ImageFormat<2, "Rgba16f"> {}
def ImageFormatR8i: ImageFormat<29, "R8i"> {}
def ImageFormatR32f: ImageFormat<3, "R32f"> {}
def ImageFormatRg32ui: ImageFormat<35, "Rg32ui"> {}
def ImageFormatRgb10A2: ImageFormat<11, "Rgb10A2"> {}
def ImageFormatR8: ImageFormat<15, "R8"> {}
def ImageFormatRgba8Snorm: ImageFormat<5, "Rgba8Snorm"> {}
def ImageFormatRg32f: ImageFormat<6, "Rg32f"> {}
def ImageFormatR11fG11fB10f: ImageFormat<8, "R11fG11fB10f"> {}
def ImageFormatRg8i: ImageFormat<27, "Rg8i"> {}
def ImageFormatR32ui: ImageFormat<33, "R32ui"> {}
def ImageFormatRgba8ui: ImageFormat<32, "Rgba8ui"> {}
def ImageFormatR16Snorm: ImageFormat<19, "R16Snorm"> {}

class ImageChannelOrder<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ImageChannelOrdersRGBA: ImageChannelOrder<17, "sRGBA"> {}
def ImageChannelOrderRG: ImageChannelOrder<2, "RG"> {}
def ImageChannelOrderABGR: ImageChannelOrder<19, "ABGR"> {}
def ImageChannelOrderR: ImageChannelOrder<0, "R"> {}
def ImageChannelOrderA: ImageChannelOrder<1, "A"> {}
def ImageChannelOrderIntensity: ImageChannelOrder<8, "Intensity"> {}
def ImageChannelOrderRGx: ImageChannelOrder<11, "RGx"> {}
def ImageChannelOrderLuminance: ImageChannelOrder<9, "Luminance"> {}
def ImageChannelOrderRx: ImageChannelOrder<10, "Rx"> {}
def ImageChannelOrderBGRA: ImageChannelOrder<6, "BGRA"> {}
def ImageChannelOrdersRGBx: ImageChannelOrder<16, "sRGBx"> {}
def ImageChannelOrderRGB: ImageChannelOrder<4, "RGB"> {}
def ImageChannelOrderRGBx: ImageChannelOrder<12, "RGBx"> {}
def ImageChannelOrderDepth: ImageChannelOrder<13, "Depth"> {}
def ImageChannelOrderARGB: ImageChannelOrder<7, "ARGB"> {}
def ImageChannelOrderDepthStencil: ImageChannelOrder<14, "DepthStencil"> {}
def ImageChannelOrdersRGB: ImageChannelOrder<15, "sRGB"> {}
def ImageChannelOrderRGBA: ImageChannelOrder<5, "RGBA"> {}
def ImageChannelOrdersBGRA: ImageChannelOrder<18, "sBGRA"> {}
def ImageChannelOrderRA: ImageChannelOrder<3, "RA"> {}

class ImageChannelDataType<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ImageChannelDataTypeUnormInt16: ImageChannelDataType<3, "UnormInt16"> {}
def ImageChannelDataTypeUnsignedInt16: ImageChannelDataType<11, "UnsignedInt16"> {}
def ImageChannelDataTypeSignedInt16: ImageChannelDataType<8, "SignedInt16"> {}
def ImageChannelDataTypeUnormInt101010_2: ImageChannelDataType<16, "UnormInt101010_2"> {}
def ImageChannelDataTypeUnormShort555: ImageChannelDataType<5, "UnormShort555"> {}
def ImageChannelDataTypeHalfFloat: ImageChannelDataType<13, "HalfFloat"> {}
def ImageChannelDataTypeUnormShort565: ImageChannelDataType<4, "UnormShort565"> {}
def ImageChannelDataTypeSnormInt8: ImageChannelDataType<0, "SnormInt8"> {}
def ImageChannelDataTypeUnormInt101010: ImageChannelDataType<6, "UnormInt101010"> {}
def ImageChannelDataTypeUnormInt8: ImageChannelDataType<2, "UnormInt8"> {}
def ImageChannelDataTypeUnormInt24: ImageChannelDataType<15, "UnormInt24"> {}
def ImageChannelDataTypeSignedInt8: ImageChannelDataType<7, "SignedInt8"> {}
def ImageChannelDataTypeSnormInt16: ImageChannelDataType<1, "SnormInt16"> {}
def ImageChannelDataTypeSignedInt32: ImageChannelDataType<9, "SignedInt32"> {}
def ImageChannelDataTypeUnsignedInt32: ImageChannelDataType<12, "UnsignedInt32"> {}
def ImageChannelDataTypeUnsignedInt8: ImageChannelDataType<10, "UnsignedInt8"> {}
def ImageChannelDataTypeFloat: ImageChannelDataType<14, "Float"> {}

class ImageOperands<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ImageOperandsGrad: ImageOperands<2, "Grad"> {}
def ImageOperandsSample: ImageOperands<6, "Sample"> {}
def ImageOperandsConstOffset: ImageOperands<3, "ConstOffset"> {}
def ImageOperandsBias: ImageOperands<0, "Bias"> {}
def ImageOperandsMinLod: ImageOperands<7, "MinLod"> {}
def ImageOperandsOffset: ImageOperands<4, "Offset"> {}
def ImageOperandsConstOffsets: ImageOperands<5, "ConstOffsets"> {}
def ImageOperandsLod: ImageOperands<1, "Lod"> {}

class FPFastMathMode<int v, string n> {
  int Value = v;
  string NAME = n;
}

def FPFastMathModeAllowRecip: FPFastMathMode<3, "AllowRecip"> {}
def FPFastMathModeFast: FPFastMathMode<4, "Fast"> {}
def FPFastMathModeNotInf: FPFastMathMode<1, "NotInf"> {}
def FPFastMathModeNSZ: FPFastMathMode<2, "NSZ"> {}
def FPFastMathModeNotNaN: FPFastMathMode<0, "NotNaN"> {}

class FPRoundingMode<int v, string n> {
  int Value = v;
  string NAME = n;
}

def FPRoundingModeRTE: FPRoundingMode<0, "RTE"> {}
def FPRoundingModeRTN: FPRoundingMode<3, "RTN"> {}
def FPRoundingModeRTP: FPRoundingMode<2, "RTP"> {}
def FPRoundingModeRTZ: FPRoundingMode<1, "RTZ"> {}

class LinkageType<int v, string n> {
  int Value = v;
  string NAME = n;
}

def LinkageTypeExport: LinkageType<0, "Export"> {}
def LinkageTypeImport: LinkageType<1, "Import"> {}

class AccessQualifier<int v, string n> {
  int Value = v;
  string NAME = n;
}

def AccessQualifierReadOnly: AccessQualifier<0, "ReadOnly"> {}
def AccessQualifierReadWrite: AccessQualifier<2, "ReadWrite"> {}
def AccessQualifierWriteOnly: AccessQualifier<1, "WriteOnly"> {}

class FunctionParameterAttribute<int v, string n> {
  int Value = v;
  string NAME = n;
}

def FunctionParameterAttributeSext: FunctionParameterAttribute<1, "Sext"> {}
def FunctionParameterAttributeNoAlias: FunctionParameterAttribute<4, "NoAlias"> {}
def FunctionParameterAttributeNoWrite: FunctionParameterAttribute<6, "NoWrite"> {}
def FunctionParameterAttributeNoCapture: FunctionParameterAttribute<5, "NoCapture"> {}
def FunctionParameterAttributeSret: FunctionParameterAttribute<3, "Sret"> {}
def FunctionParameterAttributeNoReadWrite: FunctionParameterAttribute<7, "NoReadWrite"> {}
def FunctionParameterAttributeZext: FunctionParameterAttribute<0, "Zext"> {}
def FunctionParameterAttributeByVal: FunctionParameterAttribute<2, "ByVal"> {}

class Decoration<int v, string n> {
  int Value = v;
  string NAME = n;
}

def DecorationArrayStride: Decoration<6, "ArrayStride"> {}
def DecorationBufferBlock: Decoration<3, "BufferBlock"> {}
def DecorationSample: Decoration<17, "Sample"> {}
def DecorationLinkageAttributes: Decoration<41, "LinkageAttributes"> {}
def DecorationAlignment: Decoration<44, "Alignment"> {}
def DecorationNonWritable: Decoration<24, "NonWritable"> {}
def DecorationSpecId: Decoration<1, "SpecId"> {}
def DecorationXfbStride: Decoration<37, "XfbStride"> {}
def DecorationVolatile: Decoration<21, "Volatile"> {}
def DecorationStream: Decoration<29, "Stream"> {}
def DecorationBinding: Decoration<33, "Binding"> {}
def DecorationGLSLShared: Decoration<8, "GLSLShared"> {}
def DecorationColMajor: Decoration<5, "ColMajor"> {}
def DecorationRowMajor: Decoration<4, "RowMajor"> {}
def DecorationBlock: Decoration<2, "Block"> {}
def DecorationDescriptorSet: Decoration<34, "DescriptorSet"> {}
def DecorationInputAttachmentIndex: Decoration<43, "InputAttachmentIndex"> {}
def DecorationFPRoundingMode: Decoration<39, "FPRoundingMode"> {}
def DecorationNoContraction: Decoration<42, "NoContraction"> {}
def DecorationOffset: Decoration<35, "Offset"> {}
def DecorationInvariant: Decoration<18, "Invariant"> {}
def DecorationComponent: Decoration<31, "Component"> {}
def DecorationXfbBuffer: Decoration<36, "XfbBuffer"> {}
def DecorationCoherent: Decoration<23, "Coherent"> {}
def DecorationBuiltIn: Decoration<11, "BuiltIn"> {}
def DecorationNoPerspective: Decoration<13, "NoPerspective"> {}
def DecorationAliased: Decoration<20, "Aliased"> {}
def DecorationCentroid: Decoration<16, "Centroid"> {}
def DecorationLocation: Decoration<30, "Location"> {}
def DecorationIndex: Decoration<32, "Index"> {}
def DecorationRelaxedPrecision: Decoration<0, "RelaxedPrecision"> {}
def DecorationFlat: Decoration<14, "Flat"> {}
def DecorationFuncParamAttr: Decoration<38, "FuncParamAttr"> {}
def DecorationSaturatedConversion: Decoration<28, "SaturatedConversion"> {}
def DecorationGLSLPacked: Decoration<9, "GLSLPacked"> {}
def DecorationRestrict: Decoration<19, "Restrict"> {}
def DecorationConstant: Decoration<22, "Constant"> {}
def DecorationMaxByteOffset: Decoration<45, "MaxByteOffset"> {}
def DecorationCPacked: Decoration<10, "CPacked"> {}
def DecorationPatch: Decoration<15, "Patch"> {}
def DecorationNonReadable: Decoration<25, "NonReadable"> {}
def DecorationUniform: Decoration<26, "Uniform"> {}
def DecorationMatrixStride: Decoration<7, "MatrixStride"> {}
def DecorationFPFastMathMode: Decoration<40, "FPFastMathMode"> {}

class BuiltIn<int v, string n> {
  int Value = v;
  string NAME = n;
}

def BuiltInSubgroupId: BuiltIn<40, "SubgroupId"> {}
def BuiltInSubgroupLtMaskKHR: BuiltIn<4420, "SubgroupLtMaskKHR"> {}
def BuiltInSubgroupLeMaskKHR: BuiltIn<4419, "SubgroupLeMaskKHR"> {}
def BuiltInSampleMask: BuiltIn<20, "SampleMask"> {}
def BuiltInNumSubgroups: BuiltIn<38, "NumSubgroups"> {}
def BuiltInSubgroupGtMaskKHR: BuiltIn<4418, "SubgroupGtMaskKHR"> {}
def BuiltInWorkDim: BuiltIn<30, "WorkDim"> {}
def BuiltInNumWorkgroups: BuiltIn<24, "NumWorkgroups"> {}
def BuiltInInstanceIndex: BuiltIn<43, "InstanceIndex"> {}
def BuiltInPosition: BuiltIn<0, "Position"> {}
def BuiltInDrawIndex: BuiltIn<4426, "DrawIndex"> {}
def BuiltInHelperInvocation: BuiltIn<23, "HelperInvocation"> {}
def BuiltInTessLevelOuter: BuiltIn<11, "TessLevelOuter"> {}
def BuiltInSubgroupGeMaskKHR: BuiltIn<4417, "SubgroupGeMaskKHR"> {}
def BuiltInFragCoord: BuiltIn<15, "FragCoord"> {}
def BuiltInLayer: BuiltIn<9, "Layer"> {}
def BuiltInSubgroupEqMaskKHR: BuiltIn<4416, "SubgroupEqMaskKHR"> {}
def BuiltInSubgroupSize: BuiltIn<36, "SubgroupSize"> {}
def BuiltInSubgroupMaxSize: BuiltIn<37, "SubgroupMaxSize"> {}
def BuiltInCullDistance: BuiltIn<4, "CullDistance"> {}
def BuiltInPatchVertices: BuiltIn<14, "PatchVertices"> {}
def BuiltInWorkgroupSize: BuiltIn<25, "WorkgroupSize"> {}
def BuiltInGlobalLinearId: BuiltIn<34, "GlobalLinearId"> {}
def BuiltInVertexId: BuiltIn<5, "VertexId"> {}
def BuiltInGlobalOffset: BuiltIn<33, "GlobalOffset"> {}
def BuiltInTessCoord: BuiltIn<13, "TessCoord"> {}
def BuiltInViewportIndex: BuiltIn<10, "ViewportIndex"> {}
def BuiltInPrimitiveId: BuiltIn<7, "PrimitiveId"> {}
def BuiltInFrontFacing: BuiltIn<17, "FrontFacing"> {}
def BuiltInNumEnqueuedSubgroups: BuiltIn<39, "NumEnqueuedSubgroups"> {}
def BuiltInSampleId: BuiltIn<18, "SampleId"> {}
def BuiltInInvocationId: BuiltIn<8, "InvocationId"> {}
def BuiltInWorkgroupId: BuiltIn<26, "WorkgroupId"> {}
def BuiltInVertexIndex: BuiltIn<42, "VertexIndex"> {}
def BuiltInSamplePosition: BuiltIn<19, "SamplePosition"> {}
def BuiltInGlobalInvocationId: BuiltIn<28, "GlobalInvocationId"> {}
def BuiltInGlobalSize: BuiltIn<31, "GlobalSize"> {}
def BuiltInInstanceId: BuiltIn<6, "InstanceId"> {}
def BuiltInEnqueuedWorkgroupSize: BuiltIn<32, "EnqueuedWorkgroupSize"> {}
def BuiltInPointSize: BuiltIn<1, "PointSize"> {}
def BuiltInFragDepth: BuiltIn<22, "FragDepth"> {}
def BuiltInSubgroupLocalInvocationId: BuiltIn<41, "SubgroupLocalInvocationId"> {}
def BuiltInClipDistance: BuiltIn<3, "ClipDistance"> {}
def BuiltInBaseVertex: BuiltIn<4424, "BaseVertex"> {}
def BuiltInTessLevelInner: BuiltIn<12, "TessLevelInner"> {}
def BuiltInPointCoord: BuiltIn<16, "PointCoord"> {}
def BuiltInLocalInvocationId: BuiltIn<27, "LocalInvocationId"> {}
def BuiltInBaseInstance: BuiltIn<4425, "BaseInstance"> {}
def BuiltInLocalInvocationIndex: BuiltIn<29, "LocalInvocationIndex"> {}

class SelectionControl<int v, string n> {
  int Value = v;
  string NAME = n;
}

def SelectionControlDontFlatten: SelectionControl<1, "DontFlatten"> {}
def SelectionControlFlatten: SelectionControl<0, "Flatten"> {}

class LoopControl<int v, string n> {
  int Value = v;
  string NAME = n;
}

def LoopControlUnroll: LoopControl<0, "Unroll"> {}
def LoopControlDontUnroll: LoopControl<1, "DontUnroll"> {}
def LoopControlDependencyLength: LoopControl<3, "DependencyLength"> {}
def LoopControlDependencyInfinite: LoopControl<2, "DependencyInfinite"> {}

class FunctionControl<int v, string n> {
  int Value = v;
  string NAME = n;
}

def FunctionControlPure: FunctionControl<2, "Pure"> {}
def FunctionControlDontInline: FunctionControl<1, "DontInline"> {}
def FunctionControlConst: FunctionControl<3, "Const"> {}
def FunctionControlInline: FunctionControl<0, "Inline"> {}

class MemorySemantics<int v, string n> {
  int Value = v;
  string NAME = n;
}

def MemorySemanticsImageMemory: MemorySemantics<11, "ImageMemory"> {}
def MemorySemanticsUniformMemory: MemorySemantics<6, "UniformMemory"> {}
def MemorySemanticsAtomicCounterMemory: MemorySemantics<10, "AtomicCounterMemory"> {}
def MemorySemanticsRelease: MemorySemantics<2, "Release"> {}
def MemorySemanticsSubgroupMemory: MemorySemantics<7, "SubgroupMemory"> {}
def MemorySemanticsAcquire: MemorySemantics<1, "Acquire"> {}
def MemorySemanticsAcquireRelease: MemorySemantics<3, "AcquireRelease"> {}
def MemorySemanticsSequentiallyConsistent: MemorySemantics<4, "SequentiallyConsistent"> {}
def MemorySemanticsWorkgroupMemory: MemorySemantics<8, "WorkgroupMemory"> {}
def MemorySemanticsCrossWorkgroupMemory: MemorySemantics<9, "CrossWorkgroupMemory"> {}

class MemoryAccess<int v, string n> {
  int Value = v;
  string NAME = n;
}

def MemoryAccessVolatile: MemoryAccess<0, "Volatile"> {}
def MemoryAccessAligned: MemoryAccess<1, "Aligned"> {}
def MemoryAccessNontemporal: MemoryAccess<2, "Nontemporal"> {}

class Scope<int v, string n> {
  int Value = v;
  string NAME = n;
}

def ScopeInvocation: Scope<4, "Invocation"> {}
def ScopeCrossDevice: Scope<0, "CrossDevice"> {}
def ScopeWorkgroup: Scope<2, "Workgroup"> {}
def ScopeDevice: Scope<1, "Device"> {}
def ScopeSubgroup: Scope<3, "Subgroup"> {}

class GroupOperation<int v, string n> {
  int Value = v;
  string NAME = n;
}

def GroupOperationInclusiveScan: GroupOperation<1, "InclusiveScan"> {}
def GroupOperationExclusiveScan: GroupOperation<2, "ExclusiveScan"> {}
def GroupOperationReduce: GroupOperation<0, "Reduce"> {}

class KernelEnqueueFlags<int v, string n> {
  int Value = v;
  string NAME = n;
}

def KernelEnqueueFlagsWaitKernel: KernelEnqueueFlags<1, "WaitKernel"> {}
def KernelEnqueueFlagsWaitWorkGroup: KernelEnqueueFlags<2, "WaitWorkGroup"> {}
def KernelEnqueueFlagsNoWait: KernelEnqueueFlags<0, "NoWait"> {}

class KernelProfilingInfo<int v, string n> {
  int Value = v;
  string NAME = n;
}

def KernelProfilingInfoCmdExecTime: KernelProfilingInfo<0, "CmdExecTime"> {}

class Capability<int v, string n> {
  int Value = v;
  string NAME = n;
}

def CapabilityImageMipmap: Capability<15, "ImageMipmap"> {}
def CapabilityStorageImageArrayDynamicIndexing: Capability<31, "StorageImageArrayDynamicIndexing"> {}
def CapabilityLiteralSampler: Capability<20, "LiteralSampler"> {}
def CapabilityAddresses: Capability<4, "Addresses"> {}
def CapabilityPipeStorage: Capability<60, "PipeStorage"> {}
def CapabilityGroups: Capability<18, "Groups"> {}
def CapabilityDrawParameters: Capability<4427, "DrawParameters"> {}
def CapabilityStorageImageExtendedFormats: Capability<49, "StorageImageExtendedFormats"> {}
def CapabilitySubgroupBallotKHR: Capability<4423, "SubgroupBallotKHR"> {}
def CapabilityImageQuery: Capability<50, "ImageQuery"> {}
def CapabilityStorageImageReadWithoutFormat: Capability<55, "StorageImageReadWithoutFormat"> {}
def CapabilityFloat16Buffer: Capability<8, "Float16Buffer"> {}
def CapabilityAtomicStorage: Capability<21, "AtomicStorage"> {}
def CapabilityInt8: Capability<39, "Int8"> {}
def CapabilityLinkage: Capability<5, "Linkage"> {}
def CapabilityStorageImageWriteWithoutFormat: Capability<56, "StorageImageWriteWithoutFormat"> {}
def CapabilityImageCubeArray: Capability<34, "ImageCubeArray"> {}
def CapabilitySampledImageArrayDynamicIndexing: Capability<29, "SampledImageArrayDynamicIndexing"> {}
def CapabilityInputAttachment: Capability<40, "InputAttachment"> {}
def CapabilityImageBuffer: Capability<47, "ImageBuffer"> {}
def CapabilityImageReadWrite: Capability<14, "ImageReadWrite"> {}
def CapabilityInt16: Capability<22, "Int16"> {}
def CapabilityInterpolationFunction: Capability<52, "InterpolationFunction"> {}
def CapabilityInt64Atomics: Capability<12, "Int64Atomics"> {}
def CapabilityUniformBufferArrayDynamicIndexing: Capability<28, "UniformBufferArrayDynamicIndexing"> {}
def CapabilityCullDistance: Capability<33, "CullDistance"> {}
def CapabilityImageGatherExtended: Capability<25, "ImageGatherExtended"> {}
def CapabilityShader: Capability<1, "Shader"> {}
def CapabilityPipes: Capability<17, "Pipes"> {}
def CapabilityGeometry: Capability<2, "Geometry"> {}
def CapabilityClipDistance: Capability<32, "ClipDistance"> {}
def CapabilityDerivativeControl: Capability<51, "DerivativeControl"> {}
def CapabilityKernel: Capability<6, "Kernel"> {}
def CapabilitySampledBuffer: Capability<46, "SampledBuffer"> {}
def CapabilitySampled1D: Capability<43, "Sampled1D"> {}
def CapabilityTessellation: Capability<3, "Tessellation"> {}
def CapabilityStorageImageMultisample: Capability<27, "StorageImageMultisample"> {}
def CapabilityImageMSArray: Capability<48, "ImageMSArray"> {}
def CapabilityFloat16: Capability<9, "Float16"> {}
def CapabilityFloat64: Capability<10, "Float64"> {}
def CapabilitySampledCubeArray: Capability<45, "SampledCubeArray"> {}
def CapabilityNamedBarrier: Capability<59, "NamedBarrier"> {}
def CapabilityMultiViewport: Capability<57, "MultiViewport"> {}
def CapabilityGeometryStreams: Capability<54, "GeometryStreams"> {}
def CapabilityMatrix: Capability<0, "Matrix"> {}
def CapabilityDeviceEnqueue: Capability<19, "DeviceEnqueue"> {}
def CapabilityGenericPointer: Capability<38, "GenericPointer"> {}
def CapabilityMinLod: Capability<42, "MinLod"> {}
def CapabilitySubgroupDispatch: Capability<58, "SubgroupDispatch"> {}
def CapabilityGeometryPointSize: Capability<24, "GeometryPointSize"> {}
def CapabilitySampledRect: Capability<37, "SampledRect"> {}
def CapabilityStorageBufferArrayDynamicIndexing: Capability<30, "StorageBufferArrayDynamicIndexing"> {}
def CapabilityImage1D: Capability<44, "Image1D"> {}
def CapabilityImageRect: Capability<36, "ImageRect"> {}
def CapabilitySparseResidency: Capability<41, "SparseResidency"> {}
def CapabilityVector16: Capability<7, "Vector16"> {}
def CapabilityTessellationPointSize: Capability<23, "TessellationPointSize"> {}
def CapabilityInt64: Capability<11, "Int64"> {}
def CapabilitySampleRateShading: Capability<35, "SampleRateShading"> {}
def CapabilityImageBasic: Capability<13, "ImageBasic"> {}
def CapabilityTransformFeedback: Capability<53, "TransformFeedback"> {}

class Op<int v, string n> {
  int Value = v;
  string NAME = n;
}

def OpCodeImageTexelPointer: Op<60, "OpImageTexelPointer"> {}
def OpCodeConstantTrue: Op<41, "OpConstantTrue"> {}
def OpCodeSLessThanEqual: Op<179, "OpSLessThanEqual"> {}
def OpCodeMemoryBarrier: Op<225, "OpMemoryBarrier"> {}
def OpCodeGroupDecorate: Op<74, "OpGroupDecorate"> {}
def OpCodeLogicalEqual: Op<164, "OpLogicalEqual"> {}
def OpCodeControlBarrier: Op<224, "OpControlBarrier"> {}
def OpCodeCompositeExtract: Op<81, "OpCompositeExtract"> {}
def OpCodeIAddCarry: Op<149, "OpIAddCarry"> {}
def OpCodeImageQuerySamples: Op<107, "OpImageQuerySamples"> {}
def OpCodePhi: Op<245, "OpPhi"> {}
def OpCodeAtomicUMax: Op<239, "OpAtomicUMax"> {}
def OpCodeGetKernelNDrangeMaxSubGroupSize: Op<294, "OpGetKernelNDrangeMaxSubGroupSize"> {}
def OpCodeTypeReserveId: Op<36, "OpTypeReserveId"> {}
def OpCodeShiftRightArithmetic: Op<195, "OpShiftRightArithmetic"> {}
def OpCodeCreateUserEvent: Op<299, "OpCreateUserEvent"> {}
def OpCodeGetMaxPipePackets: Op<284, "OpGetMaxPipePackets"> {}
def OpCodeTranspose: Op<84, "OpTranspose"> {}
def OpCodeTypeImage: Op<25, "OpTypeImage"> {}
def OpCodeFMul: Op<133, "OpFMul"> {}
def OpCodeAtomicAnd: Op<240, "OpAtomicAnd"> {}
def OpCodeSwitch: Op<251, "OpSwitch"> {}
def OpCodeAtomicFlagClear: Op<319, "OpAtomicFlagClear"> {}
def OpCodeBitReverse: Op<204, "OpBitReverse"> {}
def OpCodeExtInstImport: Op<11, "OpExtInstImport"> {}
def OpCodeImageSampleImplicitLod: Op<87, "OpImageSampleImplicitLod"> {}
def OpCodeIsValidEvent: Op<300, "OpIsValidEvent"> {}
def OpCodeUDiv: Op<134, "OpUDiv"> {}
def OpCodeTypeRuntimeArray: Op<29, "OpTypeRuntimeArray"> {}
def OpCodeGetKernelMaxNumSubgroups: Op<326, "OpGetKernelMaxNumSubgroups"> {}
def OpCodeSelect: Op<169, "OpSelect"> {}
def OpCodeVectorExtractDynamic: Op<77, "OpVectorExtractDynamic"> {}
def OpCodeImageSparseSampleProjImplicitLod: Op<309, "OpImageSparseSampleProjImplicitLod"> {}
def OpCodeGroupBroadcast: Op<263, "OpGroupBroadcast"> {}
def OpCodeImageQuerySize: Op<104, "OpImageQuerySize"> {}
def OpCodeReserveWritePipePackets: Op<279, "OpReserveWritePipePackets"> {}
def OpCodeLabel: Op<248, "OpLabel"> {}
def OpCodeISub: Op<130, "OpISub"> {}
def OpCodeTypeNamedBarrier: Op<327, "OpTypeNamedBarrier"> {}
def OpCodeBitwiseAnd: Op<199, "OpBitwiseAnd"> {}
def OpCodeTypeBool: Op<20, "OpTypeBool"> {}
def OpCodeImageSparseTexelsResident: Op<316, "OpImageSparseTexelsResident"> {}
def OpCodeString: Op<7, "OpString"> {}
def OpCodeReturnValue: Op<254, "OpReturnValue"> {}
def OpCodeSourceExtension: Op<4, "OpSourceExtension"> {}
def OpCodeEnqueueMarker: Op<291, "OpEnqueueMarker"> {}
def OpCodeSpecConstantOp: Op<52, "OpSpecConstantOp"> {}
def OpCodeIAdd: Op<128, "OpIAdd"> {}
def OpCodeImageDrefGather: Op<97, "OpImageDrefGather"> {}
def OpCodeNamedBarrierInitialize: Op<328, "OpNamedBarrierInitialize"> {}
def OpCodeDPdy: Op<208, "OpDPdy"> {}
def OpCodeFUnordLessThanEqual: Op<189, "OpFUnordLessThanEqual"> {}
def OpCodeImageSparseRead: Op<320, "OpImageSparseRead"> {}
def OpCodeAtomicCompareExchange: Op<230, "OpAtomicCompareExchange"> {}
def OpCodeGroupWaitEvents: Op<260, "OpGroupWaitEvents"> {}
def OpCodeImageQueryOrder: Op<102, "OpImageQueryOrder"> {}
def OpCodeAny: Op<154, "OpAny"> {}
def OpCodeGenericPtrMemSemantics: Op<69, "OpGenericPtrMemSemantics"> {}
def OpCodeINotEqual: Op<171, "OpINotEqual"> {}
def OpCodeAll: Op<155, "OpAll"> {}
def OpCodeImageSparseFetch: Op<313, "OpImageSparseFetch"> {}
def OpCodeISubBorrow: Op<150, "OpISubBorrow"> {}
def OpCodeFwidth: Op<209, "OpFwidth"> {}
def OpCodeConstantFalse: Op<42, "OpConstantFalse"> {}
def OpCodeGenericCastToPtr: Op<122, "OpGenericCastToPtr"> {}
def OpCodeTypeVector: Op<23, "OpTypeVector"> {}
def OpCodeSatConvertUToS: Op<119, "OpSatConvertUToS"> {}
def OpCodeAtomicUMin: Op<237, "OpAtomicUMin"> {}
def OpCodeSMulExtended: Op<152, "OpSMulExtended"> {}
def OpCodeMemoryModel: Op<14, "OpMemoryModel $addr $mem"> {}
def OpCodeImageQueryLevels: Op<106, "OpImageQueryLevels"> {}
def OpCodeImageWrite: Op<99, "OpImageWrite"> {}
def OpCodeSizeOf: Op<321, "OpSizeOf"> {}
def OpCodeFOrdEqual: Op<180, "OpFOrdEqual"> {}
def OpCodeConvertUToPtr: Op<120, "OpConvertUToPtr"> {}
def OpCodeReadPipe: Op<274, "OpReadPipe"> {}
def OpCodeGroupAll: Op<261, "OpGroupAll"> {}
def OpCodeImageSparseSampleProjExplicitLod: Op<310, "OpImageSparseSampleProjExplicitLod"> {}
def OpCodeSpecConstantFalse: Op<49, "OpSpecConstantFalse"> {}
def OpCodeInBoundsPtrAccessChain: Op<70, "OpInBoundsPtrAccessChain"> {}
def OpCodeFOrdLessThan: Op<184, "OpFOrdLessThan"> {}
def OpCodeFwidthCoarse: Op<215, "OpFwidthCoarse"> {}
def OpCodeTypeSampledImage: Op<27, "OpTypeSampledImage"> {}
def OpCodeBitFieldInsert: Op<201, "OpBitFieldInsert"> {}
def OpCodeOuterProduct: Op<147, "OpOuterProduct"> {}
def OpCodeUConvert: Op<113, "OpUConvert"> {}
def OpCodeNop: Op<0, "OpNop"> {}
def OpCodeIsValidReserveId: Op<282, "OpIsValidReserveId"> {}
def OpCodeUnreachable: Op<255, "OpUnreachable"> {}
def OpCodeTypeEvent: Op<34, "OpTypeEvent"> {}
def OpCodePtrAccessChain: Op<67, "OpPtrAccessChain"> {}
def OpCodeIsInf: Op<157, "OpIsInf"> {}
def OpCodeGroupAny: Op<262, "OpGroupAny"> {}
def OpCodeULessThan: Op<176, "OpULessThan"> {}
def OpCodeGetKernelNDrangeSubGroupCount: Op<293, "OpGetKernelNDrangeSubGroupCount"> {}
def OpCodeImageRead: Op<98, "OpImageRead"> {}
def OpCodeGetKernelLocalSizeForSubgroupCount: Op<325, "OpGetKernelLocalSizeForSubgroupCount"> {}
def OpCodeKill: Op<252, "OpKill"> {}
def OpCodeTypeInt: Op<21, "OpTypeInt"> {}
def OpCodeGroupUMin: Op<267, "OpGroupUMin"> {}
def OpCodeReturn: Op<253, "OpReturn"> {}
def OpCodeFSub: Op<131, "OpFSub"> {}
def OpCodeVectorShuffle: Op<79, "OpVectorShuffle"> {}
def OpCodeSampledImage: Op<86, "OpSampledImage"> {}
def OpCodeVariable: Op<59, "OpVariable"> {}
def OpCodeAtomicFlagTestAndSet: Op<318, "OpAtomicFlagTestAndSet"> {}
def OpCodeCopyMemorySized: Op<64, "OpCopyMemorySized"> {}
def OpCodeDecorationGroup: Op<73, "OpDecorationGroup"> {}
def OpCodeConstantPipeStorage: Op<323, "OpConstantPipeStorage"> {}
def OpCodeCaptureEventProfilingInfo: Op<302, "OpCaptureEventProfilingInfo"> {}
def OpCodeTypeDeviceEvent: Op<35, "OpTypeDeviceEvent"> {}
def OpCodeVectorInsertDynamic: Op<78, "OpVectorInsertDynamic"> {}
def OpCodeBitCount: Op<205, "OpBitCount"> {}
def OpCodeConstant: Op<43, "OpConstant"> {}
def OpCodeFUnordGreaterThan: Op<187, "OpFUnordGreaterThan"> {}
def OpCodeCreatePipeFromPipeStorage: Op<324, "OpCreatePipeFromPipeStorage"> {}
def OpCodeCompositeInsert: Op<82, "OpCompositeInsert"> {}
def OpCodeShiftLeftLogical: Op<196, "OpShiftLeftLogical"> {}
def OpCodeNot: Op<200, "OpNot"> {}
def OpCodeImageSparseDrefGather: Op<315, "OpImageSparseDrefGather"> {}
def OpCodeGroupAsyncCopy: Op<259, "OpGroupAsyncCopy"> {}
def OpCodeTypeVoid: Op<19, "OpTypeVoid"> {}
def OpCodeImageSparseSampleImplicitLod: Op<305, "OpImageSparseSampleImplicitLod"> {}
def OpCodeFunction: Op<54, "% = OpFunction % $ctrl %"> {}
def OpCodeImageQuerySizeLod: Op<103, "OpImageQuerySizeLod"> {}
def OpCodeImageSampleProjImplicitLod: Op<91, "OpImageSampleProjImplicitLod"> {}
def OpCodeImageQueryFormat: Op<101, "OpImageQueryFormat"> {}
def OpCodeLogicalNot: Op<168, "OpLogicalNot"> {}
def OpCodeCopyObject: Op<83, "OpCopyObject"> {}
def OpCodeDPdxCoarse: Op<213, "OpDPdxCoarse"> {}
def OpCodeLifetimeStart: Op<256, "OpLifetimeStart"> {}
def OpCodeConvertSToF: Op<111, "OpConvertSToF"> {}
def OpCodeLogicalOr: Op<166, "OpLogicalOr"> {}
def OpCodeLessOrGreater: Op<161, "OpLessOrGreater"> {}
def OpCodeDPdyFine: Op<211, "OpDPdyFine"> {}
def OpCodeGroupFMin: Op<266, "OpGroupFMin"> {}
def OpCodeEndStreamPrimitive: Op<221, "OpEndStreamPrimitive"> {}
def OpCodeSelectionMerge: Op<247, "OpSelectionMerge"> {}
def OpCodeSGreaterThanEqual: Op<175, "OpSGreaterThanEqual"> {}
def OpCodeBitwiseOr: Op<197, "OpBitwiseOr"> {}
def OpCodeFConvert: Op<115, "OpFConvert"> {}
def OpCodeGroupReserveWritePipePackets: Op<286, "OpGroupReserveWritePipePackets"> {}
def OpCodeInBoundsAccessChain: Op<66, "OpInBoundsAccessChain"> {}
def OpCodeGroupMemberDecorate: Op<75, "OpGroupMemberDecorate"> {}
def OpCodeShiftRightLogical: Op<194, "OpShiftRightLogical"> {}
def OpCodeUnordered: Op<163, "OpUnordered"> {}
def OpCodeMatrixTimesVector: Op<145, "OpMatrixTimesVector"> {}
def OpCodeLogicalNotEqual: Op<165, "OpLogicalNotEqual"> {}
def OpCodeSConvert: Op<114, "OpSConvert"> {}
def OpCodeImageSparseSampleExplicitLod: Op<306, "OpImageSparseSampleExplicitLod"> {}
def OpCodeFDiv: Op<136, "OpFDiv"> {}
def OpCodeSignBitSet: Op<160, "OpSignBitSet"> {}
def OpCodeSourceContinued: Op<2, "OpSourceContinued"> {}
def OpCodeSubgroupFirstInvocationKHR: Op<4422, "OpSubgroupFirstInvocationKHR"> {}
def OpCodeConvertFToS: Op<110, "OpConvertFToS"> {}
def OpCodeReservedWritePipe: Op<277, "OpReservedWritePipe"> {}
def OpCodeCommitReadPipe: Op<280, "OpCommitReadPipe"> {}
def OpCodeGroupCommitReadPipe: Op<287, "OpGroupCommitReadPipe"> {}
def OpCodeGetDefaultQueue: Op<303, "OpGetDefaultQueue"> {}
def OpCodeFOrdGreaterThanEqual: Op<190, "OpFOrdGreaterThanEqual"> {}
def OpCodeMatrixTimesScalar: Op<143, "OpMatrixTimesScalar"> {}
def OpCodeGetKernelWorkGroupSize: Op<295, "OpGetKernelWorkGroupSize"> {}
def OpCodeConvertFToU: Op<109, "OpConvertFToU"> {}
def OpCodeGroupSMin: Op<268, "OpGroupSMin"> {}
def OpCodeReservedReadPipe: Op<276, "OpReservedReadPipe"> {}
def OpCodeUMod: Op<137, "OpUMod"> {}
def OpCodeCapability: Op<17, "OpCapability $cap"> {}
def OpCodeVectorTimesMatrix: Op<144, "OpVectorTimesMatrix"> {}
def OpCodeImageSparseSampleProjDrefExplicitLod: Op<312, "OpImageSparseSampleProjDrefExplicitLod"> {}
def OpCodeEmitVertex: Op<218, "OpEmitVertex"> {}
def OpCodeFUnordGreaterThanEqual: Op<191, "OpFUnordGreaterThanEqual"> {}
def OpCodeConvertUToF: Op<112, "OpConvertUToF"> {}
def OpCodeIsNan: Op<156, "OpIsNan"> {}
def OpCodeFAdd: Op<129, "OpFAdd"> {}
def OpCodeStore: Op<62, "OpStore"> {}
def OpCodeGroupFMax: Op<269, "OpGroupFMax"> {}
def OpCodeSpecConstant: Op<50, "OpSpecConstant"> {}
def OpCodeEmitStreamVertex: Op<220, "OpEmitStreamVertex"> {}
def OpCodeLifetimeStop: Op<257, "OpLifetimeStop"> {}
def OpCodeAtomicIIncrement: Op<232, "OpAtomicIIncrement"> {}
def OpCodeReserveReadPipePackets: Op<278, "OpReserveReadPipePackets"> {}
def OpCodeCopyMemory: Op<63, "OpCopyMemory"> {}
def OpCodeMemberDecorate: Op<72, "OpMemberDecorate"> {}
def OpCodeTypeOpaque: Op<31, "OpTypeOpaque"> {}
def OpCodeSubgroupBallotKHR: Op<4421, "OpSubgroupBallotKHR"> {}
def OpCodeBranch: Op<249, "OpBranch"> {}
def OpCodeWritePipe: Op<275, "OpWritePipe"> {}
def OpCodeExecutionMode: Op<16, "OpExecutionMode"> {}
def OpCodeGroupCommitWritePipe: Op<288, "OpGroupCommitWritePipe"> {}
def OpCodeFUnordLessThan: Op<185, "OpFUnordLessThan"> {}
def OpCodeEntryPoint: Op<15, "OpEntryPoint"> {}
def OpCodeDecorate: Op<71, "OpDecorate"> {}
def OpCodeDPdx: Op<207, "OpDPdx"> {}
def OpCodeImage: Op<100, "OpImage"> {}
def OpCodeLine: Op<8, "OpLine"> {}
def OpCodeSDiv: Op<135, "OpSDiv"> {}
def OpCodeIsNormal: Op<159, "OpIsNormal"> {}
def OpCodeAtomicISub: Op<235, "OpAtomicISub"> {}
def OpCodeCompositeConstruct: Op<80, "OpCompositeConstruct"> {}
def OpCodeAtomicSMin: Op<236, "OpAtomicSMin"> {}
def OpCodeTypeMatrix: Op<24, "OpTypeMatrix"> {}
def OpCodeImageSampleProjDrefExplicitLod: Op<94, "OpImageSampleProjDrefExplicitLod"> {}
def OpCodeNoLine: Op<317, "OpNoLine"> {}
def OpCodeGroupFAdd: Op<265, "OpGroupFAdd"> {}
def OpCodeReleaseEvent: Op<298, "OpReleaseEvent"> {}
def OpCodeSpecConstantTrue: Op<48, "OpSpecConstantTrue"> {}
def OpCodeMemoryNamedBarrier: Op<329, "OpMemoryNamedBarrier"> {}
def OpCodeFunctionCall: Op<57, "OpFunctionCall"> {}
def OpCodeMatrixTimesMatrix: Op<146, "OpMatrixTimesMatrix"> {}
def OpCodeUMulExtended: Op<151, "OpUMulExtended"> {}
def OpCodeTypeArray: Op<28, "OpTypeArray"> {}
def OpCodeSatConvertSToU: Op<118, "OpSatConvertSToU"> {}
def OpCodeGenericCastToPtrExplicit: Op<123, "OpGenericCastToPtrExplicit"> {}
def OpCodeImageSparseGather: Op<314, "OpImageSparseGather"> {}
def OpCodeConstantComposite: Op<44, "OpConstantComposite"> {}
def OpCodeTypeSampler: Op<26, "OpTypeSampler"> {}
def OpCodeConvertPtrToU: Op<117, "OpConvertPtrToU"> {}
def OpCodeExtInst: Op<12, "OpExtInst"> {}
def OpCodeFUnordNotEqual: Op<183, "OpFUnordNotEqual"> {}
def OpCodeCommitWritePipe: Op<281, "OpCommitWritePipe"> {}
def OpCodeTypeFunction: Op<33, "OpTypeFunction"> {}
def OpCodeTypePipe: Op<38, "OpTypePipe"> {}
def OpCodeSNegate: Op<126, "OpSNegate"> {}
def OpCodeSRem: Op<138, "OpSRem"> {}
def OpCodeConstantNull: Op<46, "OpConstantNull"> {}
def OpCodeImageFetch: Op<95, "OpImageFetch"> {}
def OpCodeLoad: Op<61, "OpLoad"> {}
def OpCodeImageSparseSampleDrefImplicitLod: Op<307, "OpImageSparseSampleDrefImplicitLod"> {}
def OpCodeAtomicIDecrement: Op<233, "OpAtomicIDecrement"> {}
def OpCodeGetKernelPreferredWorkGroupSizeMultiple: Op<296, "OpGetKernelPreferredWorkGroupSizeMultiple"> {}
def OpCodeFOrdGreaterThan: Op<186, "OpFOrdGreaterThan"> {}
def OpCodeAtomicSMax: Op<238, "OpAtomicSMax"> {}
def OpCodeAccessChain: Op<65, "OpAccessChain"> {}
def OpCodeTypeStruct: Op<30, "OpTypeStruct"> {}
def OpCodeBitcast: Op<124, "OpBitcast"> {}
def OpCodeImageSparseSampleDrefExplicitLod: Op<308, "OpImageSparseSampleDrefExplicitLod"> {}
def OpCodeConstantSampler: Op<45, "OpConstantSampler"> {}
def OpCodeFOrdNotEqual: Op<182, "OpFOrdNotEqual"> {}
def OpCodeSetUserEventStatus: Op<301, "OpSetUserEventStatus"> {}
def OpCodeExtension: Op<10, "OpExtension"> {}
def OpCodeName: Op<5, "OpName"> {}
def OpCodeULessThanEqual: Op<178, "OpULessThanEqual"> {}
def OpCodeGroupSMax: Op<271, "OpGroupSMax"> {}
def OpCodeDPdxFine: Op<210, "OpDPdxFine"> {}
def OpCodeGetNumPipePackets: Op<283, "OpGetNumPipePackets"> {}
def OpCodeTypePipeStorage: Op<322, "OpTypePipeStorage"> {}
def OpCodeUndef: Op<1, "OpUndef"> {}
def OpCodeQuantizeToF16: Op<116, "OpQuantizeToF16"> {}
def OpCodeImageSampleProjDrefImplicitLod: Op<93, "OpImageSampleProjDrefImplicitLod"> {}
def OpCodeSource: Op<3, "OpSource"> {}
def OpCodeFOrdLessThanEqual: Op<188, "OpFOrdLessThanEqual"> {}
def OpCodeDPdyCoarse: Op<214, "OpDPdyCoarse"> {}
def OpCodeMemberName: Op<6, "OpMemberName"> {}
def OpCodeAtomicStore: Op<228, "OpAtomicStore"> {}
def OpCodeBitwiseXor: Op<198, "OpBitwiseXor"> {}
def OpCodeEndPrimitive: Op<219, "OpEndPrimitive"> {}
def OpCodeTypeForwardPointer: Op<39, "OpTypeForwardPointer"> {}
def OpCodeLogicalAnd: Op<167, "OpLogicalAnd"> {}
def OpCodeFNegate: Op<127, "OpFNegate"> {}
def OpCodeTypeQueue: Op<37, "OpTypeQueue"> {}
def OpCodeSLessThan: Op<177, "OpSLessThan"> {}
def OpCodeAtomicOr: Op<241, "OpAtomicOr"> {}
def OpCodeSGreaterThan: Op<173, "OpSGreaterThan"> {}
def OpCodeAtomicCompareExchangeWeak: Op<231, "OpAtomicCompareExchangeWeak"> {}
def OpCodeAtomicExchange: Op<229, "OpAtomicExchange"> {}
def OpCodeTypeFloat: Op<22, "OpTypeFloat"> {}
def OpCodeIMul: Op<132, "OpIMul"> {}
def OpCodeImageSparseSampleProjDrefImplicitLod: Op<311, "OpImageSparseSampleProjDrefImplicitLod"> {}
def OpCodeImageQueryLod: Op<105, "OpImageQueryLod"> {}
def OpCodeUGreaterThanEqual: Op<174, "OpUGreaterThanEqual"> {}
def OpCodeIEqual: Op<170, "OpIEqual"> {}
def OpCodeFUnordEqual: Op<181, "OpFUnordEqual"> {}
def OpCodeFMod: Op<141, "OpFMod"> {}
def OpCodeDot: Op<148, "OpDot"> {}
def OpCodeFunctionEnd: Op<56, "OpFunctionEnd"> {}
def OpCodeFunctionParameter: Op<55, "OpFunctionParameter"> {}
def OpCodeTypePointer: Op<32, "OpTypePointer"> {}
def OpCodeIsFinite: Op<158, "OpIsFinite"> {}
def OpCodeBuildNDRange: Op<304, "OpBuildNDRange"> {}
def OpCodeEnqueueKernel: Op<292, "OpEnqueueKernel"> {}
def OpCodeImageSampleDrefExplicitLod: Op<90, "OpImageSampleDrefExplicitLod"> {}
def OpCodeGroupIAdd: Op<264, "OpGroupIAdd"> {}
def OpCodeArrayLength: Op<68, "OpArrayLength"> {}
def OpCodeBitFieldUExtract: Op<203, "OpBitFieldUExtract"> {}
def OpCodeImageSampleProjExplicitLod: Op<92, "OpImageSampleProjExplicitLod"> {}
def OpCodeUGreaterThan: Op<172, "OpUGreaterThan"> {}
def OpCodeGroupReserveReadPipePackets: Op<285, "OpGroupReserveReadPipePackets"> {}
def OpCodePtrCastToGeneric: Op<121, "OpPtrCastToGeneric"> {}
def OpCodeBitFieldSExtract: Op<202, "OpBitFieldSExtract"> {}
def OpCodeFRem: Op<140, "OpFRem"> {}
def OpCodeSMod: Op<139, "OpSMod"> {}
def OpCodeOrdered: Op<162, "OpOrdered"> {}
def OpCodeBranchConditional: Op<250, "OpBranchConditional"> {}
def OpCodeAtomicLoad: Op<227, "OpAtomicLoad"> {}
def OpCodeImageSampleExplicitLod: Op<88, "OpImageSampleExplicitLod"> {}
def OpCodeAtomicXor: Op<242, "OpAtomicXor"> {}
def OpCodeImageGather: Op<96, "OpImageGather"> {}
def OpCodeImageSampleDrefImplicitLod: Op<89, "OpImageSampleDrefImplicitLod"> {}
def OpCodeLoopMerge: Op<246, "OpLoopMerge"> {}
def OpCodeModuleProcessed: Op<330, "OpModuleProcessed"> {}
def OpCodeAtomicIAdd: Op<234, "OpAtomicIAdd"> {}
def OpCodeVectorTimesScalar: Op<142, "OpVectorTimesScalar"> {}
def OpCodeGroupUMax: Op<270, "OpGroupUMax"> {}
def OpCodeFwidthFine: Op<212, "OpFwidthFine"> {}
def OpCodeRetainEvent: Op<297, "OpRetainEvent"> {}
def OpCodeSpecConstantComposite: Op<51, "OpSpecConstantComposite"> {}



//===----------------------------------------------------------------------===//
//  Registers
//===----------------------------------------------------------------------===//

// We use virtual registers, but define a few physical registers here to keep
// SDAG and the MachineInstr layers happy.
foreach i = 0-4 in {
  def RL#i : SPIRVReg<"%rd"#i>; // 64-bit
}


//===----------------------------------------------------------------------===//
//  Register classes
//===----------------------------------------------------------------------===//
def Int64Regs : SPIRVRegClass<[i64], 64, (add (sequence "RL%u", 0, 4))>;

// SPIRV Instruction Format.
class SPIRVInst<Op op, list<Capability> caps,
                dag outs, dag ins, 
                list<dag> pattern> : Instruction {
  field bits<32> Inst = op.Value; // Instruction encoding.
  dag OutOperandList = outs;
  dag InOperandList = ins;

  let Namespace   = "SPIRV";
  let AsmString = op.NAME;
  let Pattern = pattern;  
}
