package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class alucntrl_test extends FreeSpec with ChiselScalatestTester{
    "alu cntrl" in {
        test(new AluCntrl){ c =>
        c.io.AluOp.poke("b000".U)
        c.io.funct3.poke("b001".U)
        c.io.funct7.poke("b0".U)
        c.clock.step(20)
        c.io.alucnt.expect("b00001".U)
        // c.io.ReadData.expect("b1010101011010101010101010010011".U)
        }
    }
}