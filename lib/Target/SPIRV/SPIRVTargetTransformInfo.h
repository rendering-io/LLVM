//===- SPIRVTargetTransformInfo.h - SPIR-V specific TTI -----------*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file a TargetTransformInfo::Concept conforming object specific
/// to the SPIR-V target machine.
///
/// It uses the target's detailed information to provide more precise answers to
/// certain TTI queries, while letting the target independent and default TTI
/// implementations handle the rest.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_SPIRV_SPIRVTARGETTRANSFORMINFO_H
#define LLVM_LIB_TARGET_SPIRV_SPIRVTARGETTRANSFORMINFO_H

#include "SPIRVTargetMachine.h"
#include "llvm/CodeGen/BasicTTIImpl.h"
#include <algorithm>

namespace llvm {

class SPIRVTTIImpl final : public BasicTTIImplBase<SPIRVTTIImpl> {
  typedef BasicTTIImplBase<SPIRVTTIImpl> BaseT;
  typedef TargetTransformInfo TTI;
  friend BaseT;

  const SPIRVSubtarget *ST;
  const SPIRVTargetLowering *TLI;

  const SPIRVSubtarget *getST() const { return ST; }
  const SPIRVTargetLowering *getTLI() const { return TLI; }

public:
  SPIRVTTIImpl(const SPIRVTargetMachine *TM, const Function &F)
      : BaseT(TM, F.getParent()->getDataLayout()), ST(TM->getSubtargetImpl(F)),
        TLI(ST->getTargetLowering()) {}

  // Provide value semantics. MSVC requires that we spell all of these out.
  SPIRVTTIImpl(const SPIRVTTIImpl &Arg)
      : BaseT(static_cast<const BaseT &>(Arg)), ST(Arg.ST), TLI(Arg.TLI) {}
  SPIRVTTIImpl(SPIRVTTIImpl &&Arg)
      : BaseT(std::move(static_cast<BaseT &>(Arg))), ST(std::move(Arg.ST)),
        TLI(std::move(Arg.TLI)) {}
};

} // end namespace llvm

#endif
