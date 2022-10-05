package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class IMM_GEN extends FreeSpec with ChiselScalatestTester{
    "IMM_GEN tests" in {
    test(new ImmediateGeneration()){c=>
// c.io.in_r_type.poke(0.U)
    c.io.instruction.poke("b01010101011010101010101010010011".U)
    c.io.pc.poke(0.S)
    c.clock.step(1)
    c.io.i_imm.expect(1366.S)
}}}