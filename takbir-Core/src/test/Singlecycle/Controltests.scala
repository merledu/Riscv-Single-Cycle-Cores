package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class CONTROL_TESTS extends FreeSpec with ChiselScalatestTester{
    "CONTROL TESTS" in {
    test(new Control()){c=>
    c.io.opcode.poke(103.U)
    c.clock.step(1)
    c.io.out_memWrite.expect(0.U)
    c.io.out_branch.expect(0.U)
    c.io.out_memRead.expect(0.U)
    c.io.out_regWrite.expect(1.U)
    c.io.out_memToReg.expect(0.U)
    c.io.out_aluOp.expect(3.U)
    c.io.out_operand_a_sel.expect(2.U)
    c.io.out_operand_b_sel.expect(0.U)
    c.io.out_extend_sel.expect(0.U)
    c.io.out_next_pc_sel.expect(3.U)
}}}