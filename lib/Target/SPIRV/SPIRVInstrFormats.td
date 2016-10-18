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

//class SPIRVReg<string n> : Register<n> {
  //let Namespace = "SPIRV";
//}

//class SPIRVRegClass<list<ValueType> regTypes, int alignment, dag regList>
  //   : RegisterClass <"SPIRV", regTypes, alignment, regList>;

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
class SPIRVInst<dag outs, dag ins, 
                bits<32> inst,
                string asmstr,
                list<dag> pattern> : Instruction {
  field bits<32> Inst = inst; // Instruction encoding.
  let Namespace   = "SPIRV";
  //let Pattern     = [];
  //let AsmString   = asmstr;
  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = asmstr;
  let Pattern = pattern;  
}

def OpDummy :
    SPIRVInst<(outs Int64Regs:$dst), (ins Int64Regs:$a),
              0,
              "OpDummy",
              [(set Int64Regs:$dst, Int64Regs:$a)]>;
