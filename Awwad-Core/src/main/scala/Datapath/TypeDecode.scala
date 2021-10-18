
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


// package Datapath

// import chisel3._
// import scala.collection.immutable._

// class TypeDecode[ T <: Data ]( opCodeWidth:Int) extends Module {

// 	val  io = IO(new Bundle {

// 		val opcode = Input(UInt(opCodeWidth.W))
// 		val rType = Output(Bool())
// 		val load = Output(Bool())
// 		val store = Output(Bool())
// 		val bType = Output(Bool()) // branch
// 		val iType = Output(Bool())
// 		val jalr = Output(Bool())
// 		val jal = Output(Bool())
// 		val lui = Output(Bool())
// 		val auipc = Output(Bool())
// 		val bOut = Output(Bool())
// 	})
	
//     // val Seq(io.rType, io.load, io.store, io.branch, io.iType, io.jalrType, io.jalType, io.luiType) := Seq.fill(8)(0.S)}
//     Seq(io.rType, io.load, io.store, io.bType
// 	// io.rType := 0.S
// 	// io.load := 0.S
// 	// io.store := 0.S
// 	// io.bType := 0.S
// 	// io.iType := 0.U
// 	// io.jalr := 0.S
// 	// io.jal := 0.S
// 	// io.lui := 0.S

// 	when (io.opcode === "b0110011".U){
// 		io.rType := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b0000011".U){
// 		io.load := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b0100011".U){
// 		io.store := 1.B
// 	}
    
//     .elsewhen(io.opcode === "b1100011".U){
// 		io.bType := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b0010011".U){
// 		io.iType := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b1100111".U){
// 		io.jalr := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b1101111".U){
// 		io.jal := 1.B
// 	}
    
//     .elsewhen (io.opcode === "b0110111".U){
// 		io.lui := 1.B
// 	}

// 	.elsewhen (io.opcode === "b0010111".U){
// 		io.auipc:=1.B
// 	}

// 	.elsewhen (io.opcode === "b1100011".U){
// 		io.bOut:=1.B
// 	}
// }

