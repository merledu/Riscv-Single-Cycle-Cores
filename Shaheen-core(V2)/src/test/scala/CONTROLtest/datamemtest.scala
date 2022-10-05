package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class datamemtest extends FreeSpec with ChiselScalatestTester{
    "controller" in { test (new datamem()){c=>
    // c.io.vl1.poke("b0110".U)
    // c.io.vl2.poke("b0101".U)
    c.io.memread.poke(1.B)
    c.io.memdata.poke(5.S)
    c.io.memwrite.poke(1.B)
    c.io.addr.poke(0.U)
    c.clock.step(20)
    c.io.memout.expect(5.S)
    }
    }
}