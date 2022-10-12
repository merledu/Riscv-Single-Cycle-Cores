package singleCycle
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source
class inst_memB extends Bundle {
    val addr = Input ( UInt ( 10 . W ) )
    val inst = Output ( UInt ( 32 . W ) )
}
class  inst_mem( initFile : String ) extends Module {
    val io = IO ( new inst_memB )
// INST_MEM_LEN in Bytes or INST_MEM_LEN / 4 in words
    val imem = Mem (1024 , UInt (32 . W ) )
    loadMemoryFromFile ( imem , "/home/masfiyan/Desktop/inst.hex" )
    io . inst := imem ( io . addr/4.U)

}