package CONTROL

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source
 
class instrmem extends Module{
    val io = IO(new Bundle{
        val writeaddr = Input(UInt(10.W))
        val readdata = Output(UInt(32.W))
        })
    val mem = Mem(1024,UInt(32.W)) 
    loadMemoryFromFile(mem,"D:/VS code/Scala-Chisel-Learning-Journey-main1/src/main/scala/CONTROL/text.txt") 
    io.readdata := mem.read(io.writeaddr)
}