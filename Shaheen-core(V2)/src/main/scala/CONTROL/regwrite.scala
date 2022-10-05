package CONTROL

import chisel3._
import chisel3.util._
 
class regwrite extends Module{
    val io = IO(new Bundle{
        val regwrite = Input(Bool())
        val rs1s = Input(UInt(5.W))
        val rs2s = Input(UInt(5.W))
        val rd = Input(UInt(5.W))
        val writedat = Input(SInt(32.W))
        val rs1 = Output(SInt(32.W))
        val rs2 = Output(SInt(32.W))
        })
        val reg = RegInit(VecInit(Seq.fill(32)(0.S(32.W))))
            reg(0) := 0.S
            io.rs1 := reg(io.rs1s) 
            io.rs2 := reg(io.rs2s)
            when(io.regwrite === 1.U){ 
                when(io.rd =/= "b00000".U){
                    reg(io.rd):= io.writedat      
                }.otherwise {
                    reg(io.rd):= 0.S
                }
        }
}