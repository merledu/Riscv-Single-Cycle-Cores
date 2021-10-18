package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class TopFileTest extends FreeSpec with ChiselScalatestTester {
    
    "Top File Test" in {
    
        test(new TopFile) { c =>

        c.clock.step(900)

        // c.io.data_out.expect(0.U)
   
        }
    }
}