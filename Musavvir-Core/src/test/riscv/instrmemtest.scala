package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class instrMem_test extends FreeSpec with ChiselScalatestTester{
    "instruction memory" in {
        test(new Memory){ c =>
        c.io.WriteAddr.poke(0.U)
        c.clock.step(20)
        // c.io.ReadData.expect("b1010101011010101010101010010011".U)
        }
    }
}