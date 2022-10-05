package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class Controller extends FreeSpec with ChiselScalatestTester{
    "ALU tests" in {
    test(new ControlDecode()){c=>
    c.io.in_r_type.poke(0.U)
    c.io.in_load_type.poke(0.U)
    c.io.in_s_type.poke(1.U)
    c.io.in_sb_type.poke(0.U)
    c.io.in_jalr_type.poke(0.U)
    c.io.in_jal_type.poke(0.U)
    c.io.in_lui_type.poke(0.U)

    
    c.clock.step(1)
    c.io.memWrite.expect(1.U)
    c.io.branch.expect(0.U)
    c.io.memRead.expect(0.U)
    c.io.regWrite.expect(0.U)
    c.io.memToReg.expect(0.U)
    c.io.aluOperation.expect("b101".U)
    c.io.operand_a_sel.expect("b00".U)
    c.io.operand_b_sel.expect(1.U)
    c.io.extend_sel.expect("b01".U)
    c.io.next_pc_sel.expect("b00".U)
}}}