package Datapath


import org.scalatest._
import chiseltest._
import chisel3._
import scala.util._

class ImmGenTest extends FreeSpec with ChiselScalatestTester {

  "Immediate Generation Test" in {

    test(new ImmGen) { c =>

    val inst_array = Array("h00200613","h00300693","h0000c637")

    for (i <- 0 until 100){

        val inst = inst_array(Random.nextInt(3))
        val result = inst match {

            case ("h00200613") => 2
            case ("h00300693") => 3
            case ("h0000c637") => 12

        }

        c.io.instr.poke(inst.U)
        c.io.pc.poke(4.U)
        c.io.i_imm.expect(result.S)
        c.io.u_imm.expect(result.S)
        c.io.s_imm.expect(result.S)
        c.io.uj_imm.expect(result.S)
        c.io.sb_imm.expect(result.S)
        
      }
    }
  }
}