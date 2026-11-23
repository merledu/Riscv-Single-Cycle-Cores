# RV32I Processor — Verilog

A **RISC-V RV32I processor** implemented in **Verilog/SystemVerilog**, developed as a transition from a previous Logisim-based CPU implementation toward a synthesizable RTL design.

The project currently focuses on building a **single-cycle RV32I processor** from the ground up, with a future extension toward a **5-stage pipelined architecture**.

## Overview

This project explores the implementation of a processor at the RTL level using Verilog.

The initial implementation follows a **single-cycle datapath**, where each instruction completes its execution within one clock cycle.

The processor is based on the **RISC-V RV32I base integer instruction set**.

### Architecture

```text
                 ┌──────────────────┐
                 │ Program Counter  │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ Instruction Mem  │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ Control Unit     │
                 └────────┬─────────┘
                          │
              ┌───────────┴───────────┐
              ▼                       ▼
       ┌──────────────┐       ┌──────────────┐
       │ Register File│       │ Immediate    │
       │              │       │ Generator    │
       └──────┬───────┘       └──────┬───────┘
              │                      │
              └──────────┬───────────┘
                         ▼
                  ┌─────────────┐
                  │     ALU     │
                  └──────┬──────┘
                         │
                  ┌──────▼──────┐
                  │ Data Memory │
                  └──────┬──────┘
                         │
                         ▼
                    Write Back
```

## Current Implementation

### Single-Cycle RV32I

The current goal is to implement the core processor components in RTL:

* Program Counter
* Instruction Memory
* Instruction Decoder
* Control Unit
* Register File
* Immediate Generator
* ALU
* ALU Control
* Data Memory interface
* Branch logic
* Jump logic
* Write-back logic

The design will be verified through simulation using dedicated testbenches.

## RV32I Instructions

The processor targets the RISC-V **RV32I base integer ISA**.

Planned instruction categories include:

### R-Type

```text
ADD
SUB
AND
OR
XOR
SLT
SLTU
SLL
SRL
SRA
```

### I-Type

```text
ADDI
ANDI
ORI
XORI
SLTI
SLTIU
SLLI
SRLI
SRAI
```

### Load / Store

```text
LW
SW
```

### Branch

```text
BEQ
BNE
BLT
BGE
BLTU
BGEU
```

### Jump

```text
JAL
JALR
```

### Upper Immediate

```text
LUI
AUIPC
```

> Instruction support will be added and verified incrementally as the processor develops.


## Verification

Verification is an important part of the project.

The processor will be tested through Verilog/SystemVerilog testbenches covering:

* ALU operations
* Register read/write behavior
* Immediate generation
* Instruction decoding
* Memory operations
* Branch decisions
* Jump operations
* PC updates
* Register write-back
* Complete instruction execution

Waveforms will be used to inspect internal signals and verify processor behavior during simulation.

## Development Roadmap

```text
Phase 1
└── RV32I Single-Cycle Processor
        │
        ├── Datapath
        ├── Control Unit
        ├── ALU
        ├── Register File
        ├── Memory
        └── Verification
                │
                ▼
Phase 2
└── FPGA / Synthesis Testing
                │
                ▼
Phase 3
└── 5-Stage Pipelined RV32I
        │
        ├── IF
        ├── ID
        ├── EX
        ├── MEM
        └── WB
                │
                ├── Pipeline Registers
                ├── Hazard Detection
                ├── Data Forwarding
                └── Branch Handling
```

## Previous Implementation

This processor builds upon an earlier **RV32I single-cycle processor designed in Logisim**.

The Logisim version was used to understand and validate the processor datapath and control architecture before moving toward an RTL implementation.

This repository focuses on translating those concepts into **Verilog/SystemVerilog RTL** and eventually extending the design into a pipelined processor.

## Tools

* **Verilog / SystemVerilog**
* **RISC-V RV32I**
* **RTL simulation**
* **Waveform analysis**
* **FPGA toolchain** *(planned)*
* **Vivado AMD** *(planned)*

## Learning Goals

Through this project, I aim to develop practical understanding of:

* RISC-V processor architecture
* RTL design
* Verilog/SystemVerilog
* CPU datapath and control
* Instruction decoding
* Hardware description and simulation
* Processor verification
* FPGA implementation
* Pipeline architecture
* Data hazards and forwarding

## Future Direction

The long-term goal is to evolve this project from a basic single-cycle RV32I processor into a functional **5-stage pipelined RISC-V processor**, followed by FPGA implementation and further architectural experimentation.
