package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class instructiontype extends FreeSpec with ChiselScalatestTester{
    "INSTRUCTION TYPE DECODE TESTS" in {
    test(new InstructionTypeDecode()){c=>
    c.io.r_type.expect(0.U)
    c.io.load_type.expect(0.U)
    c.io.s_type.expect(0.U)
    c.io.sb_type.expect(0.U)
    c.io.jalr_type.expect(0.U)
    c.io.jal_type.expect(0.U)
    c.io.lui_type.expect(0.U)
    }}}