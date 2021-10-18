package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class JalrTest extends FreeSpec with ChiselScalatestTester {

    "PC Test" in {

        test(new Jalr){c =>

        c.io.rs1.poke(2.S)
        c.io.Type.poke(2.S)
        c.clock.step(1)
        c.io.out.expect(4.S)

        }
    }
}