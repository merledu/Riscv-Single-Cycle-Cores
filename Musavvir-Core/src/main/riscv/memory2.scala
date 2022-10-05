package riscv
import chisel3._
import chisel3.util._
class data_Mem extends Module {
    val width : Int = 16
    val io = IO (new Bundle {
        val MemWrite  = Input ( Bool () )
        val MemRead =Input(Bool())
        val Data = Input(SInt(32.W)) 
        val Addr = Input ( UInt (8. W ) )
        val instRead = Output(SInt(32.W))
    })
    val mem=Mem(1024,SInt(32.W))
    when (io.MemWrite === 1.B){
        mem.write(io.Addr,io.Data)

    }
    when (io.MemRead===1.B){
        io.instRead:=mem.read(io.Addr)
        }
    .otherwise{io.instRead:=0.S}
    

}
