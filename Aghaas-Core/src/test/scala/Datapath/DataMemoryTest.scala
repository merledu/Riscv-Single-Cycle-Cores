package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class DataMemTest extends FreeSpec with ChiselScalatestTester {
    
    "Data Memory Test" in {
    
        test(new DataMem) { c =>

        c.io.wr_en.poke(1.B)
        // c.io.waddr.poke(3.U)
        
        c.io.addr.poke(3.U)

        c.io.data_in.poke(55.S)

        c.clock.step(1)
        c.io.wr_en.poke(0.B)
        c.io.rd_en.poke(1.B)

        c.io.data_out.expect(55.S)

        c.clock.step(100)
   
        }
    }
}