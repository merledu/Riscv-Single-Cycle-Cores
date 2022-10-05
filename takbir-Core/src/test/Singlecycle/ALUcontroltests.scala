package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class ALUt extends FreeSpec with ChiselScalatestTester{
    "ALU CNTRL TESTS" in {
    test(new AluControl()){c=>
     c.io.aluOp.poke(2.U)
     c.io.func3.poke(7.U)
	 c.io.func7.poke(0.U)
     c.clock.step(1)
	 c.io.output.expect(23.U)
}}}