package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class ControlDecodeTESTS extends FreeSpec with ChiselScalatestTester{
    "CDT" in {
    test(new Alu()){c=>
    c.io.oper_a.poke(-3.S)
    c.io.oper_b.poke(-1.S)
    c.io.aluCtrl.poke(0.U)
    c.clock.step(1)
    c.io.out.expect(-4.S)
    c.io.branch.expect(0.U)
}}}