package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class jalr_test extends FreeSpec with ChiselScalatestTester{
    "jalr test" in {
        test(new Jalr){ c =>
        c.io.rs1.poke(1.S)
        c.io.immd_se.poke(4.S)
        c.clock.step(20)
        // c.io.ReadData.expect("b1010101011010101010101010010011".U)
        }
    }
}