
package Datapath

import chisel3._

class TypeDecodeIO(opcode:UInt) extends Bundle{

	val opCode = Input(opcode)
	val RType = Output(Bool())
	val Load = Output(Bool())
	val Store = Output(Bool())
	val Branch = Output(Bool())
	val IType = Output(Bool())
	val Jalr = Output(Bool())
	val Jal = Output(Bool())
	val Lui = Output(Bool())
}

class TypeDecode extends Module with Config {
	
	val  io = IO(new TypeDecodeIO(opCodeWidth))
	
	io.RType := 0.U
	io.Load := 0.U
	io.Store := 0.U
	io.Branch := 0.U
	io.IType := 0.U
	io.Jalr := 0.U
	io.Jal := 0.U
	io.Lui := 0.U

	when(io.opCode === "b0110011".U){
		io.RType := 1.U	
	}
	
	.elsewhen(io.opCode === "b0000011".U){
		io.Load := 1.U
	}
	
	.elsewhen(io.opCode === "b0100011".U){
		io.Store := 1.U
	}
	
	.elsewhen(io.opCode === "b1100011".U){
		io.Branch := 1.U
	}
	
	.elsewhen(io.opCode === "b0010011".U){
		io.IType := 1.U
	}
	
	.elsewhen(io.opCode === "b1100111".U){
		io.Jalr := 1.U
	}
	
	.elsewhen(io.opCode === "b1101111".U){
		io.Jal := 1.U
	}
	
	.elsewhen(io.opCode === "b0110111".U){
		io.Lui := 1.U
	}
}
