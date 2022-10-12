package singleCycle
import chisel3._
import chisel3.util._
class control extends Module {
    val io = IO(new Bundle{
        val inst_op = Input(UInt(32.W))
        val mem_Write = Output(Bool())
        val branch = Output(Bool())
        val mem_Read = Output(Bool())
        val reg_Write = Output(Bool())
        val Alu = Output(Bool())
        val mem_to_reg = Output(Bool())
        val operand_A = Output(UInt(2.W))
        val operand_B = Output(Bool())
        val extend_sel = Output(UInt(2.W))
        val Next_pc = Output(UInt((2.W)))
    })
    io.mem_Write := 0.U
    io.branch := 0.U
    io.mem_Read := 0.U
    io.reg_Write := 0.U
    io.mem_to_reg := 0.U
    io.operand_A := 0.U
    io.operand_B := 0.U
    io.extend_sel := 0.U
    io.Next_pc := 0.U
    io.Alu := 0.U
    when (io.inst_op(6,0) === "b0110011".U) { // R-type
        val no = (io.inst_op(6,0) ==="b0110011".U) & (~(io.inst_op(6,0) ==="b0110011".U))
        val yes = (io.inst_op(6,0) ==="b0110011".U) & (io.inst_op(6,0) ==="b0110011".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := no
        io.reg_Write := yes
        io.Alu := yes
        io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := no
        //io.extend_sel := no 
    }.elsewhen (io.inst_op(6,0) === "b0010011".U) { // I-type
        val no = (io.inst_op(6,0) === "b0010011".U) & (~(io.inst_op(6,0) === "b0010011".U))
        val yes = (io.inst_op(6,0) === "b0010011".U) & (io.inst_op(6,0) === "b0010011".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := no
        io.Alu := yes
        io.reg_Write := yes
        io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := yes
        io.extend_sel := 0.U
    }.elsewhen (io.inst_op(6,0) === "b0100011".U) { //S-type
        val no = (io.inst_op(6,0) === "b0100011".U) & (~(io.inst_op(6,0) === "b0100011".U))
        val yes = (io.inst_op(6,0) === "b0100011".U) & (io.inst_op(6,0) === "b0100011".U)
        io.mem_Write := yes
        io.branch := no
        io.mem_Read := no
        io.reg_Write := no
        io.Alu := yes
        //io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := yes
        io.extend_sel := 1.U
    }.elsewhen (io.inst_op(6,0) === "b0000011".U) { //load type (i-type)
        val no = (io.inst_op(6,0) === "b0000011".U) & (~(io.inst_op(6,0) === "b0000011".U))
        val yes = (io.inst_op(6,0) === "b0000011".U) & (io.inst_op(6,0) === "b0000011".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := yes
        io.reg_Write := yes
        io.Alu := yes
        io.mem_to_reg := yes
        io.operand_A := "b00".U
        io.operand_B := yes
        io.extend_sel := 0.U
    }.elsewhen (io.inst_op(6,0) === "b1100011".U){//SB type 
        val no = (io.inst_op(6,0) === "b1100011".U) & (~(io.inst_op(6,0) === "b1100011".U))
        val yes = (io.inst_op(6,0) === "b1100011".U) & (io.inst_op(6,0) === "b1100011".U)
        io.mem_Write := no
        io.branch := yes
        io.mem_Read := no
        io.reg_Write := no
        io.Alu := yes
        io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := no
        //io.extend_sel := "b00".U
        io.Next_pc := 1.U
    }.elsewhen (io.inst_op(6,0) === "b1101111".U) {//UJ-type
        val no = (io.inst_op(6,0) === "b1101111".U) & (~(io.inst_op(6,0) === "b1101111".U))
        val yes = (io.inst_op(6,0) === "b1101111".U) & (io.inst_op(6,0) === "b1101111".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := no
        io.reg_Write := yes
        io.mem_to_reg := no
        io.Alu := yes
        io.operand_A := "b01".U
        io.operand_B := no
        io.Next_pc := 2.U
    }.elsewhen (io.inst_op(6,0) === "b1100111".U){//jalr - type
        val no = (io.inst_op(6,0) === "b1100111".U) & (~(io.inst_op(6,0) === "b1100111".U))
        val yes = (io.inst_op(6,0) === "b1100111".U) & (io.inst_op(6,0) === "b1100111".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := no
        io.Alu := yes
        io.reg_Write := yes
        io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := yes
        io.extend_sel := "b00".U
        io.Next_pc := 3.U
    }.elsewhen (io.inst_op(6,0) === "b0110111".U) {//u type
        val no = (io.inst_op(6,0) === "b0110111".U) & (~(io.inst_op(6,0) === "b0110111".U))
        val yes = (io.inst_op(6,0) === "b0110111".U) & (io.inst_op(6,0) === "b0110111".U)
        io.mem_Write := no
        io.branch := no
        io.mem_Read := no
        io.Alu := yes
        io.reg_Write := yes
        io.mem_to_reg := no
        io.operand_A := "b00".U
        io.operand_B := yes
        io.extend_sel := 2.U
        //io.Next_pc := "b11".U
    }
}
