package practice

import chisel3._
import chisel3.util._

class Top extends Module {
    val io = IO (new Bundle{
        val out = Output ( SInt(4.W) )
        val inst = Output (UInt(32.W))
        val w_reg_out = Output (UInt(32.W))
        val reg_out = Output (UInt(32.W))
        val data_mem_addr = Output (UInt(32.W))
        val data_mem_dataIn = Output (UInt(32.W))
        val b_out = Output (UInt(32.W))
        val b_2x1mux = Output (UInt(32.W))
        val b_4x1mux = Output (SInt(32.W))
})

val PC_module = Module(new PC)
val Program_Counter_module = Module(new Program_Counter)
val InstMem1_module =  Module(new InstMem1 ("C:/Users/Muhammad Sameed/Desktop/Desktop clean/Hafsa/Merl/input.txt"))
val Control_module = Module(new Control)
val Immde_module =  Module(new Immde)
val RegFile_module = Module(new RegFile)
val Alu_Control_module = Module(new Alu_Control)
val ALU_1_module = Module(new ALU_1)
val Branch_module = Module(new BranchControl)
val DataMem_module = Module(new DataMem)
val Jalr_module = Module(new Jalr)

ALU_1_module.io.in_A := MuxLookup (Control_module.io.operand_A, 0.S, Array (
    (0.U) -> RegFile_module.io.rdata1,
    (1.U) -> Program_Counter_module.io.out.asSInt,
    (2.U) -> PC_module.io.out.asSInt,
    (3.U) -> RegFile_module.io.rdata1))

val a = MuxLookup (Control_module.io.extend, 0.S, Array (
    (0.U) -> Immde_module.io.I_type,
    (1.U) -> Immde_module.io.S_type,
    (2.U) -> Immde_module.io.U_type))

ALU_1_module.io.in_B := MuxLookup (Control_module.io.operand_B, 0.S, Array (
    (0.U) -> RegFile_module.io.rdata2,
    (1.U) -> a))

RegFile_module.io.w_data := MuxLookup (Control_module.io.men_to_reg, 0.S, Array (
    (0.U) -> ALU_1_module.io.out,
    (1.U) -> DataMem_module.io.dataOut))

val c = Branch_module.io.br_taken & Control_module.io.branch

val b = MuxLookup (c, 0.U, Array (
    (0.U) -> Program_Counter_module.io.out,
    (1.U) -> Immde_module.io.SB_type.asUInt))

PC_module.io.in := MuxLookup (Control_module.io.next_pc_sel, 0.S, Array (
    (0.U) -> Program_Counter_module.io.out.asSInt,
    (1.U) -> b.asSInt,
    (2.U) -> Immde_module.io.UJ_type,
    (3.U) -> Jalr_module.io.out.asSInt))

Program_Counter_module.io.pc := PC_module.io.out.asUInt 
InstMem1_module.io.addr := PC_module.io.out(21, 2)
Immde_module.io.pc := PC_module.io.out.asUInt

Control_module.io.opcode := InstMem1_module.io.data(6, 0)
RegFile_module.io.rs1 := Mux(Control_module.io.opcode === 51.U || Control_module.io.opcode === 19.U || Control_module.io.opcode === 35.U || Control_module.io.opcode === 3.U || Control_module.io.opcode === 99.U || Control_module.io.opcode === 103.U, InstMem1_module.io.data(19, 15), 0.U )
RegFile_module.io.rs2 := Mux(Control_module.io.opcode === 51.U || Control_module.io.opcode === 35.U || Control_module.io.opcode === 99.U, InstMem1_module.io.data(24, 20), 0.U)
RegFile_module.io.w_reg := InstMem1_module.io.data(11, 7)
Immde_module.io.instr := InstMem1_module.io.data
Alu_Control_module.io.func3 := InstMem1_module.io.data(14, 12)
Alu_Control_module.io.func7 := InstMem1_module.io.data(30)

RegFile_module.io.reg_write := Control_module.io.reg_write 

Alu_Control_module.io.aluOp := Control_module.io.alu_operation
ALU_1_module.io.alu_Op := Alu_Control_module.io.out

DataMem_module.io.addr := ALU_1_module.io.out.asUInt
DataMem_module.io.dataIn := RegFile_module.io.rdata2
DataMem_module.io.mem_read := Control_module.io.mem_read
DataMem_module.io.mem_write := Control_module.io.mem_write
 
Jalr_module.io.imme := a.asUInt
Jalr_module.io.rdata1 := RegFile_module.io.rdata1.asUInt

Branch_module.io.fnct3 := Alu_Control_module.io.func3
Branch_module.io.branch := Control_module.io.branch
Branch_module.io.arg_x := RegFile_module.io.rdata1
Branch_module.io.arg_y := RegFile_module.io.rdata2

io.out := 0.S
io.inst := InstMem1_module.io.data
io.w_reg_out := RegFile_module.io.w_reg 
io.reg_out := RegFile_module.io.w_data.asUInt
io.data_mem_addr := DataMem_module.io.addr
io.data_mem_dataIn := DataMem_module.io.dataIn.asUInt
io.b_out := Branch_module.io.br_taken
io.b_2x1mux := b
io.b_4x1mux := PC_module.io.in
}


