package Datapath

import chisel3._
import org.scalatest._
import chiseltest._

class RegFileTest extends FreeSpec with ChiselScalatestTester {
 
    "Register File Test" in {

        test(new RegFile) { c =>

        c.io.regEn.poke(1.B)
        c.io.waddr.poke(3.U)
        c.io.wdata.poke(55.S)

        c.clock.step(1)
        c.io.regEn.poke(0.B)
        c.io.raddr1.poke(3.U)

        c.io.rdata1.expect(55.S)

        c.clock.step(100)
        
    }
  }
}