package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class immdgen_test extends FreeSpec with ChiselScalatestTester{
    "immediate generation" in {
        test(new ImmdValGen){ c =>
        c.io.instr.poke(0x0080016F.U)
        c.io.PC.poke(4.U)
        c.clock.step(1)
        // c.io.immd_se.expect(1366.S)
        }
    }
}