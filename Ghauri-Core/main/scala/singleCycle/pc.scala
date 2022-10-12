package singleCycle
import chisel3._
import chisel3.util._
class pc extends Module {
    val io = IO(new Bundle {
        val start = Input(SInt(32.W))
        val pc = Output(SInt(32.W))
        val pc4 = Output(SInt(32.W))
    })
    val count = RegInit(0.S(32.W))
    count := io.start
    io.pc4 := count + 4.S
    io.pc := count

}

