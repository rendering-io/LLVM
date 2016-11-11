//===- IntrinsicsSPIRV.td - Defines SPIR-V intrinsics ------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines all of the SPIR-V specific intrinsics.
///
//===----------------------------------------------------------------------===//

let TargetPrefix = "spirv" in {  // All intrinsics start with "llvm.spirv.".

def int_spirv_alloca : Intrinsic<[llvm_anyptr_ty], [], [IntrNoMem]>;

}
