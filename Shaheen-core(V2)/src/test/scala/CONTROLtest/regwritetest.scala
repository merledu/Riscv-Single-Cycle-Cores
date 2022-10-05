package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class regwritetest extends FreeSpec with ChiselScalatestTester{
    "reg write" in { test (new regwrite()){c=>
    c.io.regwrite.poke(1.B)
    c.io.rs1s.poke(1.U)
    c.io.rs2s.poke(3.U)
    c.io.rd.poke(3.U)
    c.io.writedat.poke(10.S)
    c.clock.step(20)
    c.io.rs1.expect(0.S)
    c.io.rs2.expect(10.S)
    }
    }
}