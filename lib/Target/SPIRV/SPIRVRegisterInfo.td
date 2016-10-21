//SPIRVRegisterInfo.td-Describe the SPIRV Registers -*- tablegen -*-
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file describes the SPIRV register classes and some nominal
/// physical registers.
///
//===----------------------------------------------------------------------===//

class SPIRVReg<string n> : Register<n> {
  let Namespace = "SPIRV";
}

class SPIRVRegClass<list<ValueType> regTypes, int alignment, dag regList>
     : RegisterClass<"SPIRV", regTypes, alignment, regList>;

//===----------------------------------------------------------------------===//
// Registers
//===----------------------------------------------------------------------===//

// Special registers used as the frame and stack pointer.
//
// SPIRV may someday supports mixed 32-bit and 64-bit heaps in the same
// application, which requires separate width FP and SP.
def FP32 : SPIRVReg<"%FP32">;
def FP64 : SPIRVReg<"%FP64">;
def SP32 : SPIRVReg<"%SP32">;
def SP64 : SPIRVReg<"%SP64">;

// The register allocation framework requires register classes have at least
// one register, so we define a few for the floating point register classes
// since we otherwise don't need a physical register in those classes.
def F32_0 : SPIRVReg<"%f32.0">;
def F64_0 : SPIRVReg<"%f64.0">;

def V128_0: SPIRVReg<"%v128">;
def LP_0: SPIRVReg<"%lp">;
def TR_0: SPIRVReg<"%TypeRef">;

// The value stack "register". This is an opaque entity which serves to order
// uses and defs that must remain in LIFO order.
def VALUE_STACK : SPIRVReg<"STACK">;

// The incoming arguments "register". This is an opaque entity which serves to
// order the ARGUMENT instructions that are emulating live-in registers and
// must not be scheduled below other instructions.
def ARGUMENTS : SPIRVReg<"ARGUMENTS">;

//===----------------------------------------------------------------------===//
//  Register classes
//===----------------------------------------------------------------------===//
def LogicalPtr : SPIRVRegClass<[i64], 64, (add LP_0)>;
def TypeRef : SPIRVRegClass<[i64], 64, (add TR_0)>;
def I32 : SPIRVRegClass<[i32], 32, (add FP32, SP32)>;
def I64 : SPIRVRegClass<[i64], 64, (add FP64, SP64)>;
//def F32 : SPIRVRegClass<[f32], 32, (add F32_0)>;
def F64 : SPIRVRegClass<[f64], 64, (add F64_0)>;
//def V128 : SPIRVRegClass<[v4f32, v4i32, v16i8, v8i16], 128, (add V128_0)>;

