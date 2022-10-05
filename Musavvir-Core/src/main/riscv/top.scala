package riscv

import chisel3._
import chisel3.util._
import chisel3.core

class Top extends Module {
  val io = IO (new Bundle {
	val Reg_Out = Output(SInt(32.W))
	val addr= Output(UInt(10.W))
  })
  
//   class objects 
	val Alu = Module(new Alu())
	val Control = Module(new control_decode())
	val ImmediateGeneration = Module(new ImmdValGen())
	val AluControl = Module(new AluCntrl())
	val reg = Module(new  RegFile())
	val Memory = Module(new Memory())
	val Pc = Module(new PC())
	val Jalr = Module(new Jalr())
	val DataMemory = Module(new  data_Mem())
	val Branch= Module(new BranchControl())

	// wiring
	// memory and pc
	Pc.io.input:=Pc.io.pc4
	Memory.io.WriteAddr := Pc.io.pc(11,2)
	io.addr:=Memory.io.WriteAddr
	Control.io.Op_code:= Memory.io.ReadData(6,0) // opcode 7 bits , 
	// reg 
	reg.io.RegWrite := Control.io.RegWrite
	reg.io.reg1:= Memory.io.ReadData(19,15)
	reg.io.reg2:= Memory.io.ReadData(24,20)
	reg.io.rd:=Memory.io.ReadData(11,7)

	// instruction
	ImmediateGeneration.io.instr:=Memory.io.ReadData
	ImmediateGeneration.io.PC:=Pc.io.pc
	// jalr
	Jalr.io.rs1:= reg.io.rs1
	Jalr.io.immd_se:=ImmediateGeneration.io.i_imm
	// Alucntrl
	AluControl.io.AluOp:=Control.io.AluOp
	AluControl.io.funct3:=Memory.io.ReadData(14,12)
	AluControl.io.funct7:=Memory.io.ReadData(30)
	// Branch
	Branch.io.alucnt:=AluControl.io.alucnt
	Branch.io.in1:=MuxCase(0.S,Array(
		(Control.io.OpA === 0.U) -> reg.io.rs1,
		(Control.io.OpA === 1.U ) -> (Pc.io.pc4).asSInt,
		(Control.io.OpA === 2.U )-> (Pc.io.pc).asSInt,
		(Control.io.OpA === 3.U ) -> reg.io.rs1
	))
	Branch.io.in2:= MuxCase(0.S,Array(
		(Control.io.ExtSel === 0.U && Control.io.OpB ===1.U) -> ImmediateGeneration.io.i_imm,
		(Control.io.ExtSel === 1.U &&  Control.io.OpB === 1.U ) -> ImmediateGeneration.io.s_imm,
		(Control.io.ExtSel === 2.U && Control.io.OpB === 1.U )-> ImmediateGeneration.io.u_imm,
		(Control.io.OpB === 0.U ) -> reg.io.rs2))
	Branch.io.Branch:=Control.io.Branch
	

	// Alu
	// mux opA
	Alu.io.in1:= MuxCase(0.S,Array(
		(Control.io.OpA === 0.U) -> reg.io.rs1,
		(Control.io.OpA === 1.U ) -> (Pc.io.pc4).asSInt,
		(Control.io.OpA === 2.U )-> (Pc.io.pc).asSInt,
		(Control.io.OpA === 3.U ) -> reg.io.rs1
	))
	// mux opb
	Alu.io.in2:=MuxCase(0.S,Array(
		(Control.io.ExtSel === 0.U && Control.io.OpB ===1.U) -> ImmediateGeneration.io.i_imm,
		(Control.io.ExtSel === 1.U &&  Control.io.OpB === 1.U ) -> ImmediateGeneration.io.s_imm,
		(Control.io.ExtSel === 2.U && Control.io.OpB === 1.U )-> ImmediateGeneration.io.u_imm,
		(Control.io.OpB === 0.U ) -> reg.io.rs2))
	Alu.io.alucnt:=AluControl.io.alucnt
	// datamemory
	DataMemory.io.Addr:=(Alu.io.out(9,2)).asUInt
	DataMemory.io.Data:=reg.io.rs2
	DataMemory.io.MemWrite:= Control.io.MemWrite
	DataMemory.io.MemRead:= Control.io.MemRead
	// mem to reg
	reg.io.WriteData:= MuxCase(0.S,Array(
		(Control.io.MemtoReg === 0.U) -> Alu.io.out,
		(Control.io.MemtoReg === 1.U) -> DataMemory.io.instRead
		))
	
	Pc.io.input := MuxCase(0.U,Array(
		(Control.io.NextPc === 0.U) -> Pc.io.pc4,
		(Control.io.NextPc === 1.U) ->  Mux(Branch.io.br_taken,(ImmediateGeneration.io.sb_imm).asUInt,Pc.io.pc4),
		(Control.io.NextPc === 2.U) -> (ImmediateGeneration.io.uj_imm).asUInt,
		(Control.io.NextPc === 3.U) -> (Jalr.io.jalout).asUInt()
	)) 
	io.Reg_Out:=0.S
}
