package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class PCTest extends FreeSpec with ChiselScalatestTester {
    
    "Program Counter Test" in {
    
        test(new PC) { c =>

        c.io.in.poke(8.U)

        c.clock.step(1)

        c.io.pc.expect(8.U)
        c.io.pcPlus4.expect(12.U)


        }   
    }
}