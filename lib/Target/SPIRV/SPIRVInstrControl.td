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
//  def Return : SPIRVInst<OpReturn, [],
//                         (outs), (ins),
//                         [(SPIRVReturn)]>;

// OpReturn 
def OpReturn : SPIRVInst<OpCodeReturn,
  [], (outs), (ins), [(SPIRVReturn)]>;


} // isReturn = 1

} // isTerminator = 1, hasCtrlDep = 1, isBarrier = 1
