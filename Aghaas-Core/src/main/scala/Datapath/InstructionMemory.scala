package Datapath

import chisel3._ 
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class InstMemIO(DW:Int, AW:Int) extends Bundle{
    val addr = Input(UInt(AW.W))
    val inst = Output(UInt(DW.W))
}

class InstructionMemory extends Module with Config{

    val io = IO(new InstMemIO(WLEN,AWLEN))
    val imem = Mem(nRows,UInt(WLEN.W))
    io.inst := imem(io.addr)
    loadMemoryFromFile(imem, initFile)
}