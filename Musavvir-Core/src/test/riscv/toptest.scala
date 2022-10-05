package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class singlecycle_test extends FreeSpec with ChiselScalatestTester{
    "Single cycle risc v" in {
        test(new Top){ c =>
        // c.io.RegWrite.poke(1.U)
        c.clock.step(18)
    }
}}