package riscv
import chisel3._
import chisel3.util._
object ALUOP {
    val ALU_ADD = "b00000".U
    val ALU_ADDI = "b00000".U
    val ALU_SUB = "b01000".U
    val ALU_AND = "b00111".U
    val ALU_ANDI = "b00111".U
    val ALU_OR  = "b00110".U
    val ALU_ORI  = "b00110".U
    val ALU_XOR = "b00100".U
    val ALU_XORI = "b00100".U
    val ALU_SLT = "b00010".U
    val ALU_SLTI = "b00010".U
    val ALU_SLL = "b00001".U
    val ALU_SLLI = "b00001".U
    val ALU_SLTU= "b00011".U
    val ALU_SLTIU = "b00011".U
    val ALU_SRL = "b00101".U
    val ALU_SRLI = "b00101".U
    val ALU_SRA = "b01101".U
    val ALU_SRAI = "b00101".U
    val ALU_COPY_A = "b11111".U   //JAL
    val ALU_COPY_B = "b11111" .U  //JALR
    val ALU_XXX = DontCare
}
import ALUOP._
class Alu extends Module {
  val io = IO (new Bundle {
	val alucnt = Input(UInt(5.W))
	val in1 = Input(SInt(32.W))
	val in2 = Input(SInt(32.W))
	val out = Output(SInt(32.W))
  })
	//Add Addi
	when (io.alucnt === ALU_ADD || io.alucnt === ALU_ADDI){io.out := io.in1 + io.in2}
	//Sll Slli 
	.elsewhen (io.alucnt === ALU_SLL || io.alucnt === ALU_SLLI ){io.out := io.in1 << io.in2(4,0)}
	//Xor Xori
	.elsewhen (io.alucnt === ALU_XOR || io.alucnt === ALU_XORI ){io.out := io.in1 ^ io.in2}
	//Srl Srli
	.elsewhen (io.alucnt === ALU_SRL || io.alucnt === ALU_SRLI || io.alucnt === ALU_SRA || io.alucnt === ALU_SRAI){io.out := io.in1 >> io.in2(4,0)}
	//Or Ori
	.elsewhen (io.alucnt === ALU_OR || io.alucnt === ALU_ORI ){io.out := io.in1 | io.in2}
	//And Andi
	.elsewhen (io.alucnt === ALU_AND || io.alucnt === ALU_ANDI){io.out := io.in1 & io.in2}
	//Sub
	.elsewhen (io.alucnt === ALU_SUB){io.out := io.in1 - io.in2}
	//Jal Jalr
	.elsewhen (io.alucnt === ALU_COPY_A || io.alucnt === ALU_COPY_B){io.out := io.in1}
	.elsewhen (io.alucnt === ALU_SLT || io.alucnt === ALU_SLTI){
    when (io.in1<io.in2){
      io.out:=1.S
    }
    .otherwise{
      io.out:=0.S
    }}
  .elsewhen (io.alucnt === ALU_SLTU || io.alucnt === ALU_SLTIU){
    when (io.in1.asUInt<io.in2.asUInt){
      io.out:=1.S
    }
    .otherwise{
      io.out:=0.S
    }
  }
	.otherwise {io.out := DontCare}

}