package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class INSTRUCTION_Mem extends FreeSpec with ChiselScalatestTester{
    "instruction memory" in {
    test(new InstructionMem()){c=>
    c.io.wrAddr.poke(0.U)
    c.clock.step(100)
    //c.io.readData.expect("b00000000".U)
    
}}}