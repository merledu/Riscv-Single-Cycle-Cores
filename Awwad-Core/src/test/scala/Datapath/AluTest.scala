package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class AluTest extends FreeSpec with ChiselScalatestTester{
    
    "ALU Test" in {

        test(new Alu){ c=>
        
        c.io.in1.poke(1.S)
        c.io.in2.poke(3.S)
        c.io.AluControl.poke("b00000".U)
        c.io.Branch.expect(false.B)
        c.io.out.expect(4.S)

        }
    }
}