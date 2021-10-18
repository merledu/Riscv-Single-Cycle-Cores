
package Datapath
import org.scalatest._
import chiseltest._
import chisel3._


class ImmGenTest extends FreeSpec with ChiselScalatestTester {
    
    "ImmGen Test" in {
    
        test(new ImmGen) { c =>
        c.io.instr.poke("h00400513".U)
        c.io.pc.poke(0.U)
        c.io.i_imm.expect(4.S)

        c.clock.step(900)

        // c.io.data_out.expect(0.U)
   
        }
    }
}

