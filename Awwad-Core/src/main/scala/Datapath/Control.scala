package Datapath

import chisel3._

class ControlIO extends Bundle{

	val opCode = Input(UInt(7.W))
	val MemWrite = Output(Bool())
	val Branch = Output(Bool())
	val MemRead = Output(Bool())
	val RegWrite = Output(Bool())
	val MemToReg = Output(Bool())
	val AluOp = Output(UInt(3.W))
	val Operand_aSel = Output(UInt(2.W))
	val Operand_bSel = Output(Bool())
	val ExtendSel = Output(UInt(2.W))
	val NextPcSel = Output(UInt(2.W))
}

class Control extends Module{

	val io = IO(new ControlIO)

	val typeDec = Module(new TypeDecode)
	val controlDec = Module(new ControlDecode)
	
	typeDec.io.opCode := io.opCode
	
	Seq(controlDec.io.RType,controlDec.io.Load,controlDec.io.Store,controlDec.io.SBType,
		controlDec.io.IType,controlDec.io.Jalr,controlDec.io.Jal,controlDec.io.Lui) zip 
		Seq(typeDec.io.RType,typeDec.io.Load,typeDec.io.Store,typeDec.io.Branch,
		typeDec.io.IType,typeDec.io.Jalr,typeDec.io.Jal,typeDec.io.Lui) map{ x => x._1 := x._2}
	
	Seq(io.MemWrite,io.Branch,io.MemRead,io.RegWrite,io.MemToReg,io.AluOp,io.Operand_aSel,
		io.Operand_bSel,io.ExtendSel,io.NextPcSel) zip Seq(controlDec.io.MemWrite,
		controlDec.io.Branch, controlDec.io.MemRead, controlDec.io.RegWrite,controlDec.io.MemToReg,
		controlDec.io.AluOp, controlDec.io.Operand_aSel,controlDec.io.Operand_bSel,
		controlDec.io.ExtendSel, controlDec.io.NextPcSel) map{x => x._1 := x._2}
}