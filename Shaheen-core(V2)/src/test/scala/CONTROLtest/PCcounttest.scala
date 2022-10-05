 package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class PCcounttest extends FreeSpec with ChiselScalatestTester{
    "PCcount" in { test (new pccount()){c=>
    c.io.cin.poke(0.U)
    c.clock.step(20)
    c.io.pc4.expect(4.U)
    c.io.pc.expect(0.U)
    }
    }
}