package practice

import chisel3._
import chisel3.util._

class Control extends Module{
    val io = IO(new Bundle{
        val opcode = Input( UInt(7.W) )
        val mem_write = Output( Bool() ) 
        val branch = Output( Bool() ) 
        val mem_read = Output( Bool() ) 
        val reg_write = Output( Bool() ) 
        val men_to_reg = Output( Bool()) 
        val alu_operation = Output( UInt(3.W) )
        val operand_A = Output( UInt(2.W) ) 
        val operand_B = Output( Bool() ) 
        val extend = Output( UInt(2.W) ) 
        val next_pc_sel = Output( UInt(2.W) )  
})
io.men_to_reg := 0.U
// R type
when ( io.opcode === 51.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 0.U
    io.operand_A := 0.U
    io.operand_B := 0.B
    io.extend := 0.U
    io.next_pc_sel := 0.U
// I type
}.elsewhen ( io.opcode === 19.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 1.U
    io.operand_A := 0.U
    io.operand_B := 1.B
    io.extend := 0.U
    io.next_pc_sel := 0.U
// S type
}.elsewhen ( io.opcode === 35.U ) {
    io.mem_write := 1.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 0.B
    io.men_to_reg := 0.B
    io.alu_operation := 5.U
    io.operand_A := 0.U
    io.operand_B := 1.B
    io.extend := 1.U
    io.next_pc_sel := 0.U
// Load
}.elsewhen ( io.opcode === 3.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 1.B
    io.reg_write := 1.B
    io.men_to_reg := 1.B
    io.alu_operation := 4.U
    io.operand_A := 0.U
    io.operand_B := 1.B
    io.extend := 0.U
    io.next_pc_sel := 0.U
// SB type
}.elsewhen ( io.opcode === 99.U ) {
    io.mem_write := 0.B
    io.branch := 1.B
    io.mem_read := 0.B
    io.reg_write := 0.B
    io.men_to_reg := 0.B
    io.alu_operation := 2.U
    io.operand_A := 0.U
    io.operand_B := 0.B
    io.extend := 0.U
    io.next_pc_sel := 1.U
// UJ type
}.elsewhen ( io.opcode === 111.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 3.U
    io.operand_A := 1.U
    io.operand_B := 0.B
    io.extend := 0.U
    io.next_pc_sel := 2.U
// Jalr 
}.elsewhen ( io.opcode === 103.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 3.U
    io.operand_A := 1.U
    io.operand_B := 0.B
    io.extend := 0.U
    io.next_pc_sel := 3.U
// U type (lui)   
}.elsewhen ( io.opcode === 55.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 6.U
    io.operand_A := 3.U
    io.operand_B := 1.B
    io.extend := 2.U
    io.next_pc_sel := 0.U
// U type (auipc)   
}.elsewhen ( io.opcode === 23.U ) {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 1.B
    io.men_to_reg := 0.B
    io.alu_operation := 7.U
    io.operand_A := 2.U
    io.operand_B := 1.B
    io.extend := 2.U
    io.next_pc_sel := 0.U

}.otherwise {
    io.mem_write := 0.B
    io.branch := 0.B
    io.mem_read := 0.B
    io.reg_write := 0.B
    io.men_to_reg := 0.B
    io.alu_operation := 0.U
    io.operand_A := 0.U
    io.operand_B := 0.B
    io.extend := 0.U
    io.next_pc_sel := 0.U
}
}
