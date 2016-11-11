//===-- SPIRVLowerAlloca.cpp - SPIR-V alloca lowering ---------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// The default behaviour for alloca instructions results in lowering to 
// FrameIndex SDNodes. This loses information that we need, so instead we 
// replace AllocaInst with a call to a target specific alloca intrinsic.
//
//===----------------------------------------------------------------------===//

#include "SPIRV.h"
#include "llvm/Pass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;

#define DEBUG_TYPE "spirv-lower-alloca"

namespace {
class SPIRVLowerAlloca : public FunctionPass {
public:
  static char ID;
  SPIRVLowerAlloca() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override;
  StringRef getPassName() const override;
private:
  bool replaceAlloca(AllocaInst* AI);
};
}

FunctionPass *llvm::createSPIRVLowerAlloca() {
  return new SPIRVLowerAlloca();
}

char SPIRVLowerAlloca::ID = 0;

StringRef SPIRVLowerAlloca::getPassName() const {
  return "SPIR-V Alloca Lowering"; 
}

bool SPIRVLowerAlloca::replaceAlloca(AllocaInst* AI) {
  // Get the parent module.
  Module *M = AI->getModule();
  
  // Create replacement function.
  Function *F = Intrinsic::getDeclaration(M, Intrinsic::spirv_alloca, AI->getType()); 
  
  // Now create call and replace original instruction.
  Instruction *CI = CallInst::Create(F);
  if (!AI->use_empty())
    AI->replaceAllUsesWith(CI);
  ReplaceInstWithInst(AI, CI); 

  return true;
}

bool SPIRVLowerAlloca::runOnFunction(Function &F) {
  bool Modified = false;

  // Iterate each basic block.
  for (auto& BB: F) {
    // Find all the AllocaInst instructions. Replacing invalidates the iterator,
    // so store them in a list and replace afterwards.
    SmallVector<AllocaInst*, 4> ReplaceInsts;
    for (Instruction& I: BB)
      if (isa<AllocaInst>(&I))
        ReplaceInsts.push_back(cast<AllocaInst>(&I));

    for (auto AI: ReplaceInsts)
      if (replaceAlloca(AI))
        Modified = true;
  }

  return Modified;
}
