//===- SPIRVInstrControl.td - SPIR-V Control-Flow ------------*- tablegen -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief SPIRV control-flow code-gen constructs.
///
//===----------------------------------------------------------------------===//

let isTerminator = 1, hasCtrlDep = 1, isBarrier = 1 in {

let isReturn = 1 in {
  def RETURN_VOID : SPIRVInst<(outs), (ins), 0, "return", [(SPIRVReturn)]>;
} // isReturn = 1

def UNREACHABLE : SPIRVInst<(outs), (ins), 0, "unreachable", [(trap)]>;

} // isTerminator = 1, hasCtrlDep = 1, isBarrier = 1
