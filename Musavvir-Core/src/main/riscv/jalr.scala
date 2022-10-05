package riscv
import chisel3._
import chisel3.util._
class Jalr extends Module {
    val io = IO(new Bundle {
        val rs1 = Input(SInt(3.W))
        val immd_se = Input(SInt(3.W))
	    val jalout = Output(SInt(5.W))
    })
    // val b = Wire(SInt(32.W))
    val b = io.rs1 + io.immd_se
    io.jalout:= (b.asUInt & "hfffffffe".U).asSInt
}
