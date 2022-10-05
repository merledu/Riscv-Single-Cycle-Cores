package CONTROL

import chisel3._
import chisel3.util._
 
class datamem extends Module{
    val io = IO(new Bundle{
        val memwrite = Input(Bool())
        val memread = Input(Bool())
        val memdata = Input(SInt(32.W))
        val addr = Input(UInt(8.W))
        val memout = Output(SInt(32.W))
        }) 
val mem = Mem(1024,SInt(32.W)) 
// Write with mask
when (io.memwrite === 1.B){
    mem . write ( io . addr ,io.memdata )
    io.memout := 0.S
}
when (io.memread === 1.B){
    io.memout :=  mem (io.addr)
}.otherwise{
    io . memout := 0.S
    }
}