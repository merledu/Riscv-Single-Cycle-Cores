package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class ControlDecodeTest extends FreeSpec with ChiselScalatestTester{
    
    "Control Decode Test" in {

        test(new ControlDecode) { c=>
        
        c.io.RType.poke(0.B)
        c.io.IType.poke(0.B)
        c.io.Lui .poke(0.B)
        c.io.Jal.poke(1.B)
        c.io.Jalr.poke(0.B)
        c.io.Load.poke(0.B)
        c.io.Store.poke(0.B)
        c.io.SBType.poke(0.B)
    
        c.clock.step(20) 

        c.io.Branch.expect(0.B)
        c.io.RegWrite.expect(1.B)
        c.io.Operand_bSel.expect(0.B)
        c.io.ExtendSel.expect("b0".U)
        c.io.MemRead.expect(0.B)
        c.io.MemToReg.expect(0.B)
        c.io.MemWrite.expect(0.B)
        c.io.NextPcSel.expect("b10".U)
        c.io.AluOp.expect("b011".U) 
        c.io.Operand_aSel.expect("b10".U)

        }
    }
}