package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class alucontroltest extends FreeSpec with ChiselScalatestTester{
    "ALU" in { test (new alucontrol()){c=>
    c.io.aluop.poke("b000".U)
    c.io.func3.poke("b011".U)
    c.io.func7.poke("b0".U)
    c.clock.step(10)
    c.io.out.expect("b00011".U)
    }
    }
}