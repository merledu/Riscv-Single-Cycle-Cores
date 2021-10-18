package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class ControlTest extends FreeSpec with ChiselScalatestTester {

    "Control Test" in {

        test(new Control) {c =>
        
        c.io.opCode.poke(35.U)
        c.io.MemWrite.expect(true.B)
        c.io.Branch.expect(false.B)
        c.io.MemRead.expect(false.B)
        c.io.RegWrite.expect(false.B)
        c.io.MemToReg.expect(false.B) //RegFile
        c.io.AluOp.expect("b101".U)
        c.io.Operand_aSel.expect("b00".U)
        c.io.Operand_bSel.expect(true.B)
        c.io.ExtendSel.expect("b10".U)
		c.io.NextPcSel.expect("b00".U)

        }
    }
}
