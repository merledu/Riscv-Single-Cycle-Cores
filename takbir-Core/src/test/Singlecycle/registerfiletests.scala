package Singlecycle

import chisel3._
import org.scalatest._
import chiseltest._

class Register_File extends FreeSpec with ChiselScalatestTester{
    "Register File Tests" in {
    test(new RegisterFile()){c=>
    c.io.rs1_sel.poke(1.U)
    c.io.rs2_sel.poke(3.U)
    c.io.regWrite.poke(1.U)
    c.io.writeData.poke(10.S)
    c.io.rd_sel.poke(3.U)
    c.clock.step(100)
    c.io.rs2.expect(10.S)    
    // step(1)
}}}