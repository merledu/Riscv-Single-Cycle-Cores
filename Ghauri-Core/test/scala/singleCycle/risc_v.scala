package singleCycle
import chisel3._
import chisel3 . util._
import org.scalatest._
import chiseltest._
import chisel3.experimental.BundleLiterals._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation


class risc_v extends FreeSpec with ChiselScalatestTester {

  "single cycle signle cycle risc v" in {
    test(new riscv()){ dut =>
        dut.clock.step(200)
        }
    }
}