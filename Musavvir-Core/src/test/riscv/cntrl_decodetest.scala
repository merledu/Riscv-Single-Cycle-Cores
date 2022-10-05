package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class cntrl_test extends FreeSpec with ChiselScalatestTester{
    "control decode" in {
        test(new control_decode){ c =>
        c.io.Op_code.poke("b0110011".U)
        c.clock.step(20)
        c.io.MemWrite.expect(0.U)
        c.io.Branch.expect(0.U)
        c.io.MemRead.expect(0.U)
        c.io.RegWrite.expect(1.U)
        c.io.MemtoReg.expect(0.U)
        c.io.AluOp.expect(0.U)
        c.io.OpA.expect(0.U)
        c.io.OpB.expect(0.U)
        c.io.ExtSel.expect(0.U)
        c.io.NextPc.expect(0.U)
        
        
        
        
        }
    }
}