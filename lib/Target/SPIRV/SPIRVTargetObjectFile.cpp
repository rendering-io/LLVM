//===-- SPIRVTargetObjectFile.cpp - SPIR-V Object Info --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file defines the functions of the SPIR-V specific subclass
/// of TargetLoweringObjectFile.
///
//===----------------------------------------------------------------------===//

#include "SPIRVTargetObjectFile.h"
#include "SPIRVTargetMachine.h"
#include "SPIRVSection.h"

using namespace llvm;

void SPIRVSection::anchor() { }

SPIRVTargetObjectFile::SPIRVTargetObjectFile() {
  TextSection = nullptr;
  DataSection = nullptr;
  BSSSection = nullptr;
  ReadOnlySection = nullptr;
  StaticCtorSection = nullptr;
  StaticDtorSection = nullptr;
  LSDASection = nullptr;
  EHFrameSection = nullptr;
  DwarfAbbrevSection = nullptr;
  DwarfInfoSection = nullptr;
  DwarfLineSection = nullptr;
  DwarfFrameSection = nullptr;
  DwarfPubTypesSection = nullptr;
  DwarfDebugInlineSection = nullptr;
  DwarfStrSection = nullptr;
  DwarfLocSection = nullptr;
  DwarfARangesSection = nullptr;
  DwarfRangesSection = nullptr;
  DwarfMacinfoSection = nullptr;
}

SPIRVTargetObjectFile::~SPIRVTargetObjectFile() {
  delete static_cast<SPIRVSection *>(TextSection);
  delete static_cast<SPIRVSection *>(DataSection);
  delete static_cast<SPIRVSection *>(BSSSection);
  delete static_cast<SPIRVSection *>(ReadOnlySection);

  delete static_cast<SPIRVSection *>(StaticCtorSection);
  delete static_cast<SPIRVSection *>(StaticDtorSection);
  delete static_cast<SPIRVSection *>(LSDASection);
  delete static_cast<SPIRVSection *>(EHFrameSection);
  delete static_cast<SPIRVSection *>(DwarfAbbrevSection);
  delete static_cast<SPIRVSection *>(DwarfInfoSection);
  delete static_cast<SPIRVSection *>(DwarfLineSection);
  delete static_cast<SPIRVSection *>(DwarfFrameSection);
  delete static_cast<SPIRVSection *>(DwarfPubTypesSection);
  delete static_cast<const SPIRVSection *>(DwarfDebugInlineSection);
  delete static_cast<SPIRVSection *>(DwarfStrSection);
  delete static_cast<SPIRVSection *>(DwarfLocSection);
  delete static_cast<SPIRVSection *>(DwarfARangesSection);
  delete static_cast<SPIRVSection *>(DwarfRangesSection);
  delete static_cast<SPIRVSection *>(DwarfMacinfoSection);
}

void SPIRVTargetObjectFile::Initialize(MCContext &ctx, const TargetMachine &TM) {
  TargetLoweringObjectFile::Initialize(ctx, TM);
  TextSection = new SPIRVSection(MCSection::SV_ELF, SectionKind::getText());
  DataSection = new SPIRVSection(MCSection::SV_ELF, SectionKind::getData());
  BSSSection = new SPIRVSection(MCSection::SV_ELF, SectionKind::getBSS());
  ReadOnlySection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getReadOnly());
  StaticCtorSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  StaticDtorSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  LSDASection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  EHFrameSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfAbbrevSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfInfoSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfLineSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfFrameSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfPubTypesSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfDebugInlineSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfStrSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfLocSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfARangesSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfRangesSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
  DwarfMacinfoSection =
      new SPIRVSection(MCSection::SV_ELF, SectionKind::getMetadata());
}

MCSection *SPIRVTargetObjectFile::getSectionForConstant(const DataLayout &DL, SectionKind Kind,
                                 const Constant *C,
                                 unsigned &Align) const {
  return ReadOnlySection;
}

MCSection *SPIRVTargetObjectFile::getExplicitSectionGlobal(const GlobalValue *GV, SectionKind Kind,
                                    const TargetMachine &TM) const {
  return DataSection;
}

MCSection *SPIRVTargetObjectFile::SelectSectionForGlobal(
    const GlobalValue *GV, SectionKind Kind, const TargetMachine &TM) const {
  return getDataSection();
}