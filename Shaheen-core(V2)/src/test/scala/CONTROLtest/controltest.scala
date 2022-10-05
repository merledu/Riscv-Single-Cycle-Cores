package CONTROL

import chisel3._
import org.scalatest._
import chiseltest._

class controllertest extends FreeSpec with ChiselScalatestTester{
    "controller" in { test (new controller()){c=>
    c.io.opcode.poke("b0010011".U)
    c.clock.step(20)
    c.io.memwrite.expect(0.B)
    c.io.branch.expect(0.B)
    c.io.memread.expect(0.B)
    c.io.regwrite.expect(1.B)
    c.io.memtoreg.expect(0.B)
    c.io.aluop.expect("b001".U)
    c.io.operand_A.expect("b00".U)
    c.io.operand_B.expect(1.B)
    c.io.extend.expect("b00".U)
    c.io.next_PC_select.expect("b00".U)
    }
    }
}