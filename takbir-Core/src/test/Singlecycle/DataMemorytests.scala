package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class DATA_Mem extends FreeSpec with ChiselScalatestTester{
    "data memory" in {
    test(new DataMem()){c=>
    c.io.memWrite.poke(1.U)
    c.io.memRead.poke(0.U)
    c.io.memAddress.poke(0.U)
    c.io.memData.poke(5.S)
    c.clock.step(1)
    c.io.memWrite.poke(0.U)
    c.io.memRead.poke(1.U)
    c.io.memAddress.poke(0.U)
    c.clock.step(1)
}}}