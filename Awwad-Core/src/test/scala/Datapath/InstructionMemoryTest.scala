package Datapath

import chisel3._ 
import org.scalatest._ 
import chiseltest._ 

class InstructionMemoryTest extends FreeSpec with ChiselScalatestTester{

  "InstructionMemory test" in {

    test(new InstructionMemory){ c =>

    c.io.addr.poke(4.U)
    // c.io.output1.expect(6.U)
    // c.io.inst.expect(4.U)
    c.clock.step(100)
    
    }
  }
}