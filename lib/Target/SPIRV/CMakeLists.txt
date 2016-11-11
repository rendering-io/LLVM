set(LLVM_TARGET_DEFINITIONS SPIRV.td)

tablegen(LLVM SPIRVGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM SPIRVGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM SPIRVGenFastISel.inc -gen-fast-isel)
tablegen(LLVM SPIRVGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM SPIRVGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM SPIRVGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM SPIRVGenSubtargetInfo.inc -gen-subtarget)
add_public_tablegen_target(SPIRVCommonTableGen)

add_llvm_target(SPIRVCodeGen
  SPIRVAsmPrinter.cpp
  SPIRVFrameLowering.cpp
  SPIRVInstrInfo.cpp
  SPIRVISelDAGToDAG.cpp
  SPIRVISelLowering.cpp
  SPIRVLowerAlloca.cpp
  SPIRVMachineFunctionInfo.cpp
  SPIRVMachineModuleInfo.cpp
  SPIRVMCInstLower.cpp
  SPIRVPrologEpilogPass.cpp
  SPIRVRegisterInfo.cpp
  SPIRVSelectionDAGInfo.cpp
  SPIRVSubtarget.cpp
  SPIRVTargetMachine.cpp
  SPIRVTargetObjectFile.cpp
  SPIRVTrackCapabilities.cpp
)

add_dependencies(LLVMSPIRVCodeGen intrinsics_gen)

add_subdirectory(InstPrinter)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
