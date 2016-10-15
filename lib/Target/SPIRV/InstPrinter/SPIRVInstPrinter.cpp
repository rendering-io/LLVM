//=- SPIRVInstPrinter.cpp - SPIR-V assembly instruction printing ------------=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief Print MCInst instructions to SPIR-V format.
///
//===----------------------------------------------------------------------===//

#include "InstPrinter/SPIRVInstPrinter.h"
#include "MCTargetDesc/SPIRVMCTargetDesc.h"
#include "SPIRV.h"
//#include "SPIRVMachineFunctionInfo.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetRegisterInfo.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

//#include "SPIRVGenAsmWriter.inc"

SPIRVInstPrinter::SPIRVInstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                                   const MCRegisterInfo &MRI)
    : MCInstPrinter(MAI, MII, MRI) {}

void SPIRVInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {}

void SPIRVInstPrinter::printInst(const MCInst *MI, raw_ostream &OS,
                                 StringRef Annot,
                                 const MCSubtargetInfo & /*STI*/) {}

void SPIRVInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                    raw_ostream &O) {}
