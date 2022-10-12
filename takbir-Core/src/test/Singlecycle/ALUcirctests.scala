package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class alucirctests extends FreeSpec with ChiselScalatestTester{
    "ALU_CIRC_TESTS" in {
    test(new AluCirc()){c=>
    c.io.in_func3.poke(0.U)
    c.io.in_func7.poke(1.U)
    c.io.in_aluOp.poke(0.U)
    c.io.in_oper_A.poke(10.S)
    c.io.in_oper_B.poke(4.S)
    c.clock.step(1)
    c.io.out.expect(6.S)
}}}
