package riscv
import chisel3._
import chisel3.util._
class AluCntrl extends Module {
    val io = IO(new Bundle {
        val AluOp = Input(UInt(3.W))
        val funct3 = Input(UInt(3.W))
        val funct7 = Input(UInt(1.W))
	    val alucnt = Output(UInt(5.W))
    })
    
    when (io.AluOp === "b000".U ){
    io.alucnt:= Cat("b0".U,io.funct7,io.funct3)}

    .elsewhen (io.AluOp === "b001".U ){
        io.alucnt:= Cat("b00".U,io.funct3)}
    .elsewhen (io.AluOp === "b101".U || io.AluOp === "b100".U){
        io.alucnt := "b00000".U}
    .elsewhen(io.AluOp === "b010".U){
        io.alucnt := Cat(io.AluOp(1,0),io.funct3)}
    .elsewhen(io.AluOp === "b011".U){
        io.alucnt := "b11111".U}
    .elsewhen(io.AluOp === "b110".U){
        io.alucnt := "b00000".U}
    .otherwise{
        io.alucnt:=DontCare
    }
    

}