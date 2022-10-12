package singleCycle 
import chisel3._
import chisel3.util._
class jalr_immediate extends Module{
    val io = IO(new Bundle{
        val in1 = Input(SInt(32.W))
        val in2 = Input(SInt(32.W))
        val out1 = Output(SInt(32.W))
    })
    val a = io.in1 + io.in2
    io.out1 := a
}
