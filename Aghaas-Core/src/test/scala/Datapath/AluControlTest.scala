package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class AluControlTest extends FreeSpec with ChiselScalatestTester {
    
    "ALU Control Test" in {
    
        test(new AluControl) { c =>

        c.io.Aluop.poke("b001".U)
        c.io.func7.poke(false.B)
        c.io.func3.poke("b101".U)

        c.clock.step(1)

        c.io.control.expect("b00101".U)

        }   
    }
}