package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class branchcntrl_test extends FreeSpec with ChiselScalatestTester{
    "branch test" in {
        test(new BranchControl){ c =>
        c.io.alucnt.poke("b10000".U)
        c.io.in1.poke(1.S)
        c.io.in2.poke(1.S)
        c.io.Branch.poke(1.B)
        c.clock.step(20)
        c.io.br_taken.expect(1.B)
       
        }
    }
}