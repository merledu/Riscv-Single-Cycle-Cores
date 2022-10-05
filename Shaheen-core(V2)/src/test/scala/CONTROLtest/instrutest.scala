package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class instrmemtest extends FreeSpec with ChiselScalatestTester{
    "intruction memory" in { test (new instrmem()){c=>
    c.io.writeaddr.poke(1.U)
    c.clock.step(2)
    //c.io.readdata.expect(286331153.U)
    }
    }
}