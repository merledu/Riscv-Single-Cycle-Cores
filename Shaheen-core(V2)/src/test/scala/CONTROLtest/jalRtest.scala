package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class jalRtest extends FreeSpec with ChiselScalatestTester{
    "controller" in { test (new jalR()){c=>
    c.io.vl1.poke(1.S)
    c.io.vl2.poke(1.S)
    c.clock.step(10)
    c.io.andfun.expect(2.S)
    }
    }
}