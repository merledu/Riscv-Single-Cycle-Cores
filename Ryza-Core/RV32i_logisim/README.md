RV32I Single-Cycle Processor — Logisim

A 32-bit RISC-V processor implementation designed and developed in Logisim 2.7.1 using a modular single-cycle datapath.

The project focuses on understanding and implementing the internal organization of a processor, including instruction decoding, register operations, immediate generation, ALU control, memory access, branching, jumping, and program-counter control.

The processor was constructed from individual functional modules and integrated into a complete processor capable of executing RISC-V machine-code programs loaded into instruction memory.

Overview

This project implements a single-cycle RISC-V processor based on the RV32I instruction-set architecture.

Each instruction passes through the processor datapath within a single clock cycle, with the control unit generating the signals required for register operations, ALU execution, memory access, and control-flow decisions.

Main Processor Components
Program Counter (PC)
Instruction Memory (IMEM)
Register File
Instruction Decode Logic
Immediate Generation Unit
ALU
ALU Control
Operand Selection Logic
Data Memory (DMEM)
Branch Control
Jump Control
JALR Logic
Next-PC Logic
Processor Datapath

The general instruction flow through the processor is:

                 ┌─────────────────┐
                 │ Program Counter │
                 │      (PC)       │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Instruction     │
                 │ Memory (IMEM)   │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Instruction     │
                 │ Decode          │
                 └────────┬────────┘
                          │
                ┌─────────┴─────────┐
                │                   │
                ▼                   ▼
        ┌───────────────┐   ┌─────────────────┐
        │ Register File │   │ Immediate       │
        │               │   │ Generation      │
        └───────┬───────┘   └────────┬────────┘
                │                    │
                └─────────┬──────────┘
                          ▼
                   ┌─────────────┐
                   │     ALU     │
                   └──────┬──────┘
                          │
                 ┌────────┴────────┐
                 │                 │
                 ▼                 ▼
          ┌─────────────┐   ┌──────────────┐
          │ Data Memory │   │ Write Back   │
          │    (DMEM)   │   │              │
          └─────────────┘   └──────────────┘

The processor also contains dedicated logic for determining the next program-counter value, allowing sequential execution, branches, and jumps.

Supported Instruction Types

| Instruction Type | RegWrite | MemWrite | MemRead | Branch | Next PC        | ALU Op |
| ---------------- | -------: | -------: | ------: | -----: | -------------- | -----: |
| R-Type           |        1 |        0 |       0 |      0 | PC + 1         |      0 |
| I-Type           |        1 |        0 |       0 |      0 | PC + 1         |      1 |
| Load             |        1 |        0 |       1 |      0 | PC + 1         |      4 |
| JALR             |        1 |        0 |       0 |      0 | Register-based |      3 |
| Store            |        0 |        1 |       0 |      0 | PC + 1         |      5 |
| B-Type           |        0 |        0 |       0 |      1 | Branch Target  |      2 |
| LUI              |        1 |        0 |       0 |      0 | PC + 1         |      6 |
| JAL              |        1 |        0 |       0 |      0 | Jump Target    |      3 |


ALU Op is used by the control system to determine the required ALU operation, while the ALU control logic generates the corresponding ALU code.

Control Unit

The processor uses instruction-dependent control signals to coordinate the datapath.

Key control signals include:

RegWrite — controls register-file write operations
MemWrite — controls data-memory write operations
MemRead — controls data-memory read operations
Branch — controls conditional branch behavior
Operand A selection — selects the source for ALU operand A
Operand B selection — selects the source for ALU operand B
Next PC selection — determines the source of the next program-counter value
ALU Op — identifies the required category of ALU operation
ALU Code — selects the specific ALU operation
Jump selection — controls jump-related PC behavior

This control structure allows the same datapath to handle different instruction formats while changing the required operations through control signals.

Modular Design

The processor is divided into individual Logisim subcircuits rather than being implemented as one large circuit.

Core Modules
Module	Purpose
RV32i_processor.circ	Top-level processor
PC+IMEM.circ	Program counter and instruction-memory logic
reg_file_32b.circ	32-bit register file
i-DECODE.circ	I-type instruction decoding
c-DECODE.circ	Control/instruction decoding
I-C decode_MODULE.circ	Integrated instruction/control decoding
Immediate Generation.circ	Immediate-value generation
Arithmetic Logic Unit.circ	Arithmetic and logical operations
ALU_Control.circ	ALU operation selection
ALU op.circ	ALU operation decoding
op_A.circ	Operand-A selection logic
nextPC.circ	Next program-counter logic
JALR.circ	JALR target-address logic

This modular approach makes individual processor components easier to understand, test, debug, and integrate.

Testing

The processor was tested using RISC-V machine-code programs loaded into instruction memory.

Testing was performed to verify processor behavior across different instruction types and datapath operations, including:

Arithmetic operations
Immediate operations
Register operations
Load/store operations
Conditional branching
Jump instructions
JALR
Loop-based execution
Register write-back
Program-counter updates

A Fibonacci test circuit is included in the TEST directory.

TEST/
├── TEST FIB.circ
└── TESTING.txt

The test programs can be assembled and converted into machine-code hexadecimal values before being loaded into the processor's instruction memory.

Tools & Technologies
Tool / Technology	Usage
Logisim 2.7.1	Digital circuit and processor design
RISC-V	Instruction-set architecture
RISC-V Assembly	Processor test programs
Venus	Assembly testing and machine-code generation
Hex Machine Code	Instruction-memory initialization
Concepts Demonstrated

This project provides practical implementation experience with:

Computer architecture
RISC-V ISA
Single-cycle processor architecture
Processor datapaths
Instruction formats
Instruction decoding
Control-unit design
Register-file design
ALU design
Immediate generation
Memory operations
Branch and jump control
Program-counter logic
Datapath multiplexing
Hardware module integration
Machine-code execution
Project Structure
RV32i_logisim/
│
├── README.md
│
├── Single cycle  processor/
│   ├── RV32i_processor.circ
│   ├── ALU op.circ
│   ├── ALU_Control.circ
│   ├── Arithmetic Logic Unit.circ
│   ├── I-C decode_MODULE.circ
│   ├── Immediate Generation.circ
│   ├── JALR.circ
│   ├── PC+IMEM.circ
│   ├── c-DECODE.circ
│   ├── i-DECODE.circ
│   ├── nextPC.circ
│   ├── op_A.circ
│   └── reg_file_32b.circ
│
└── TEST/
    ├── TEST FIB.circ
    └── TESTING.txt

Future Development

Potential extensions to the project include:

Expanding instruction coverage
Adding additional RV32I instructions
More extensive processor verification
Additional assembly test programs
Improved memory support
FPGA implementation
Verilog/SystemVerilog implementation
Hardware testing on an FPGA development board
Project Goals

The primary goals of this project were to:

Understand the internal datapath and control structure of a processor.
Implement fundamental processor components in Logisim.
Understand RISC-V instruction decoding and execution.
Integrate individual hardware modules into a functional CPU.
Execute machine-code programs on the implemented processor.
Build a foundation for future processor and RTL/FPGA development.
Author

Syed Muhammad Abdullah

Computer Engineering
UIT University

License

This project was developed for educational and portfolio purposes.