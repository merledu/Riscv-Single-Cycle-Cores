package CONTROL

import chisel3._
import chisel3.util._
 
class jalR extends Module{
    val io = IO(new Bundle{
        val vl1 = Input(SInt(32.W))
        val vl2 = Input(SInt(32.W))
        val andfun = Output(SInt(32.W))
        })
        val adder = io.vl1 + io.vl2
        io.andfun := adder & 4284967294L.S
}