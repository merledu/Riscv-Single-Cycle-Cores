package Datapath

import chisel3._


class ControlDecodeIO extends Bundle{

    val RType = Input( Bool())
	val Load = Input( Bool())
	val Store = Input( Bool())
	val SBType = Input( Bool())
	val IType = Input( Bool())
	val Jalr = Input( Bool())
	val Jal = Input( Bool())
	val Lui = Input( Bool())
	val MemWrite = Output( Bool())
	val Branch = Output( Bool())
	val MemRead = Output( Bool())
	val RegWrite = Output( Bool())
	val MemToReg = Output( Bool())
	val AluOp = Output(UInt(3.W))
	val Operand_aSel = Output(UInt(2.W))
	val Operand_bSel = Output( Bool())
	val ExtendSel = Output(UInt(2.W))
	val NextPcSel = Output(UInt(2.W))

}


class ControlDecode extends Module{

	val io = IO(new ControlDecodeIO)
		
	io.MemWrite := 0.B
	io.Branch := 0.B
	io.MemRead := 0.B
	io.RegWrite := 0.B
	io.MemToReg := 0.B
	io.AluOp := "b000".U
	io.Operand_aSel := "b00".U
	io.Operand_bSel := 0.B
	io.ExtendSel := "b00".U
	io.NextPcSel := "b00".U

	when(io.RType === 1.B){
		io.RegWrite := 1.B
	}
        
    .elsewhen(io.Load === 1.B){
		io.MemRead := 1.B
		io.RegWrite := 1.B
		io.MemToReg := 1.B
		io.AluOp := "b100".U
		io.Operand_bSel := 1.B
	}
    
    .elsewhen(io.Store === 1.B){
		io.MemWrite := 1.B
		io.AluOp := "b101".U
		io.Operand_bSel := 1.B
		io.ExtendSel := "b10".U
	}
    
    .elsewhen(io.SBType === 1.B){
		io.Branch := 1.B
		io.AluOp := "b010".U
		io.NextPcSel:= "b01".U
	}
    
    .elsewhen(io.IType === 1.B){
		io.RegWrite := 1.B
		io.AluOp := "b001".U
		io.Operand_bSel := 1.B		
	}
    
    .elsewhen(io.Jalr === 1.B){
		io.RegWrite := 1.B
		io.AluOp := "b011".U
		io.Operand_aSel := "b10".U
		io.NextPcSel := "b11".U
	}
    
    .elsewhen(io.Jal === 1.B){
		io.RegWrite := 1.B
		io.AluOp := "b011".U
		io.Operand_aSel := "b10".U
		io.NextPcSel := "b10".U
	}
    
    .elsewhen(io.Lui === 1.B){
		io.RegWrite := 1.B
		io.AluOp := "b110".U
		io.Operand_aSel := "b11".U
		io.Operand_bSel := 1.B
		io.ExtendSel := "b01".U
	}
}