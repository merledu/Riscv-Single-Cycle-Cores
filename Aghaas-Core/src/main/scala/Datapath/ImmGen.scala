package Datapath

import chisel3._
import chisel3.util._

class ImmGenIO(inType:UInt, outType:SInt) extends Bundle{

	val instr = Input(inType)
	val pc = Input(inType)
	val s_imm = Output(outType)
	val sb_imm = Output(outType)
	val uj_imm = Output(outType)
	val u_imm = Output(outType)
	val i_imm = Output(outType)

}

class ImmGen extends Module with Config {

 	val io = IO (new ImmGenIO(immInType, immOutType))

	//S
	val s_imm13 = Cat (io.instr(31,25),io.instr(11,7))
	io.s_imm := (Cat(Fill(20,s_imm13(11)),s_imm13)).asSInt

	//SB
	val sb_imm13 = Cat (io.instr(31),io.instr(7),io.instr(30,25),io.instr(11,8),"b0".U)
	io.sb_imm := ((Cat(Fill(19,sb_imm13(12)),sb_imm13)) + io.pc).asSInt

	//UJ
	val uj_imm21 = Cat (io.instr(31),io.instr(19,12),io.instr(20),io.instr(30,21),"b0".U)
	io.uj_imm := ((Cat(Fill(12,uj_imm21(20)),uj_imm21)) + io.pc).asSInt

	//U
	io.u_imm := ((Cat(Fill(12,io.instr(31)),io.instr(31,12))) << 12).asSInt
	
	//I
	io.i_imm := (Cat(Fill(20,io.instr(31)),io.instr(31,20))).asSInt
}