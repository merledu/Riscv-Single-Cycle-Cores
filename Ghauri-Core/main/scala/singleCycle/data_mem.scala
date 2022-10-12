package singleCycle
import chisel3._
import chisel3.util._
class data_mem extends Module {
    val io = IO(new Bundle{
        val mem_Write = Input(Bool())
        val mem_Read = Input(Bool())
        val A = Input(UInt(32.W))
        val D = Input(SInt(32.W))
        val Dout = Output(SInt(32.W))
    })
    val mem = Mem(1024,SInt(32.W))
    when (io.mem_Write) {
        mem.write(io.A,io.D)
    }
    io.Dout := 0.S
    when(io.mem_Read) {
        io.Dout := mem.read(io.A)
    }
}