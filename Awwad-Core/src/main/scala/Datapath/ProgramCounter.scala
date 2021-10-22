package Datapath

import chisel3._
 
class PC_IO(widthU :UInt) extends Bundle{

    val in = Input(widthU)
    val pc = Output(widthU)
    val pcPlus4 = Output(widthU)

}

class PC extends Module with Config{

    val io = IO(new PC_IO(sizePc))

    val reg = RegInit(0.U(width_parameter.W))
    reg := io.in
    io.pc := reg
    io.pcPlus4 := (reg + 4.U) 
}