package riscv
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Memory extends Module {
  val io = IO (new Bundle {
	val WriteAddr = Input(UInt(10.W))
	val ReadData = Output(UInt(32.W))
  })
	val imem = Mem(1024,UInt(32.W))
	
	loadMemoryFromFile(imem,"E:/hello/Scala-Chisel-Learning-Journey/src/main/scala/riscv/abc.txt")
	io.ReadData := imem.read(io.WriteAddr)
	
}
