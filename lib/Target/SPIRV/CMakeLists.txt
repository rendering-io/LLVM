add_llvm_target(SPIRVCodeGen
  SPIRVTargetMachine.cpp
)

add_dependencies(LLVMSPIRVCodeGen intrinsics_gen)

add_subdirectory(InstPrinter)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
