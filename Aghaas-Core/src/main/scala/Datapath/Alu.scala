package Datapath

import chisel3._
import chisel3.util._

class AluIO(inOutType:SInt,AluCtrl:Int) extends Bundle{

    val AluControl = Input(UInt(AluCtrl.W))
	val in1 = Input(inOutType)
	val in2 = Input(inOutType)
	val Branch = Output(Bool())
	val out = Output(inOutType)
}

class Alu extends Module with Config {

    val io = IO(new AluIO(ioType,AluCtrlWidth))

	io.out := 0.S

	//Add Addi
	when (io.AluControl === "b00000".U){io.out := io.in1 + io.in2}
	//Sll Slli Sra Srai
	.elsewhen (io.AluControl === "b00001".U){io.out := io.in1 << io.in2(4,0)}
	//Xor Xori
	.elsewhen (io.AluControl === "b00100".U){io.out := io.in1 ^ io.in2}
	//Srl Srli
	.elsewhen (io.AluControl === "b00101".U || io.AluControl === "b01101".U){io.out := io.in1 >> io.in2(4,0)}
	//Or Ori
	.elsewhen (io.AluControl === "b00110".U){io.out := io.in1 | io.in2}
	//And Andi
	.elsewhen (io.AluControl === "b00111".U){io.out := io.in1 & io.in2}
	//Sub
	.elsewhen (io.AluControl === "b01000".U){io.out := io.in1 - io.in2}
	//Jal Jalr
	.elsewhen (io.AluControl === "b11111".U){io.out := io.in1}
	//Bge
	.elsewhen (io.AluControl === "b10101".U){
		when (io.in1 >= io.in2){io.out := 1.S}}
		// .otherwise {io.out := 0.S}}
	//Bgeu
	.elsewhen (io.AluControl === "b10111".U){
		when (io.in1.asUInt >= io.in2.asUInt){io.out := 1.S}
		.otherwise {io.out := 0.S}}
	//Sltu Sltui Bltu
	.elsewhen (io.AluControl === "b00011".U || io.AluControl === "b10110".U){
		when (io.in1.asUInt < io.in2.asUInt){io.out := 1.S}
		.otherwise {io.out := 0.S}}
	//Beq
	.elsewhen (io.AluControl === "b10000".U){
		when (io.in1 === io.in2){io.out := 1.S}
		.otherwise {io.out := 0.S}}
	//Slt Slti Blt
	.elsewhen (io.AluControl === "b00010".U || io.AluControl === "b10100".U){
		when (io.in1 < io.in2){io.out := 1.S}
		.otherwise {io.out := 0.S}}
	//Bne
	.elsewhen (io.AluControl === "b10001".U){

		when (io.in1 =/= io.in2){
			io.out := 1.S
		}
		
		.otherwise {
			io.out := 0.S
			}
		}

	.otherwise {
		io.out := DontCare
	}

	//Branch

	when (io.out === 1.S && io.AluControl(4,3) === "b10".U){
		io.Branch := true.B
	}

	.otherwise {
		io.Branch := false.B
	}
}