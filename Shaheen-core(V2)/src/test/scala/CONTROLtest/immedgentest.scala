package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class immedgentest extends FreeSpec with ChiselScalatestTester{
    "Imm" in { test (new immedgen()){c=>
    c.io.instruction.poke(0x00200113.U)
    c.io.pc.poke(0.U)
    c.clock.step(10)
    //c.io.i_imm.expect(1366.S)
    }
    }
}