package Singlecycle
import chisel3._
import chisel3.util.experimental.loadMemoryFromFile


class InstructionMem extends Module {
    val io = IO(new Bundle {
            val wrAddr = Input(UInt(10.W))
            val readData = Output(UInt(32.W))
    })

    val mem = Mem(1024, UInt(32.W))
    io.readData := mem(io.wrAddr)
    loadMemoryFromFile(mem, "C:/Users/DELL/Downloads/Scala-Chisel-Learning-Journey-main/src/main/scala/mem1.txt")
    
}

