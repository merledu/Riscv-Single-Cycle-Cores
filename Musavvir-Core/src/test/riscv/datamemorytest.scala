package riscv
import chisel3._
import org.scalatest._
import chiseltest._
class dataMem_test extends FreeSpec with ChiselScalatestTester{
    "data memory Test" in {
        test(new data_Mem){ c =>
        c.io.MemWrite.poke(1.B)
        c.io.MemRead.poke(0.B)
        c.io.Addr.poke(10.U)
        c.io.Data.poke(7.S)
        c.clock.step(20)
        c.io.instRead.expect(7.S)
        
        }
    }
}