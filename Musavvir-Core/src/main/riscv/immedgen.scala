package riscv
import chisel3._
import chisel3.util._
class interface_ImmdValGen extends Bundle {
    val instr = Input ( UInt (32. W ) )
    val PC = Input(UInt(32.W))
	val s_imm = Output(SInt(32.W))
	val sb_imm = Output(SInt(32.W))
	val uj_imm = Output(SInt(32.W))
	val u_imm = Output(SInt(32.W))
	val i_imm = Output(SInt(32.W))
}

import cntrl._
class ImmdValGen extends Module {
    val io = IO (new interface_ImmdValGen )

// Start coding here
    val s_immed = Cat (io.instr(31,25),io.instr(11,7))
	io.s_imm := (Cat(Fill(20,s_immed(11)),s_immed)).asSInt
	//SB
	val sb_immed = Cat (io.instr(31),io.instr(7),io.instr(30,25),io.instr(11,8),"b0".U)
	io.sb_imm := ((Cat(Fill(19,sb_immed(12)),sb_immed)) + io.PC).asSInt
	//UJ
	val uj_immed = Cat (io.instr(31),io.instr(19,12),io.instr(20),io.instr(30,21),"b0".U)
	io.uj_imm := ((Cat(Fill(12,uj_immed(20)),uj_immed)) + io.PC).asSInt
	//U
	io.u_imm := ((Cat(Fill(12,io.instr(31)),io.instr(31,12))) << 12).asSInt
	//I
	io.i_imm := (Cat(Fill(20,io.instr(31)),io.instr(31,20))).asSInt
}