package CONTROL

 import chisel3._
import chisel3.util._

class alucontrol extends Module{
    val io = IO(new  Bundle{
        val aluop = Input(UInt(3.W))
        val func3 = Input(UInt(3.W))
        val func7 = Input(UInt(1.W))
        val out = Output(UInt(5.W))
        })

    io.out := 0.U

   when(io.aluop === "b000".U){
        // R-Type Instruction
        io.out := Cat("b0".U, io.func7, io.func3)
    
	} .elsewhen(io.aluop === "b100".U) {
        // Load Type Instruction
        io.out := "b00000".U
    
	} .elsewhen(io.aluop === "b001".U) {
        // I-Type Instruction
    when(io.func3 === "b101".U) {
            io.out := Cat("b0".U, io.func7, io.func3)
        } .otherwise {
            io.out := Cat("b0".U, "b0".U, io.func3)
        }
        
    } .elsewhen(io.aluop === "b101".U) {
        // S-Type Instruction
        io.out := "b00000".U

    } .elsewhen(io.aluop === "b010".U) {
        // SB-Type Instruction
        io.out := Cat("b10".U, io.func3)

    } .elsewhen(io.aluop === "b011".U) {
        // JALR instruction // JAL instruction
        io.out := "b11111".U
   } .elsewhen(io.aluop === "b110".U) {
        // LUI type instruction
        io.out := "b00000".U
 
    } .otherwise {
        io.out := DontCare
    }


}