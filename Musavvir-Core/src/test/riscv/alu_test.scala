package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class alu_test extends FreeSpec with ChiselScalatestTester{
    "alu test" in {
        test(new Alu){ c =>
        c.io.alucnt.poke("b00000".U)
        c.io.in1.poke(1.S)
        c.io.in2.poke(2.S)
        c.clock.step(20)
        c.io.out.expect(3.S)
       
        }
    }
}