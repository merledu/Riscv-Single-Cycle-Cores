package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class PC_TESTS extends FreeSpec with ChiselScalatestTester{
    "pc tests" in {
    test(new Pc()){c=>
    c.io.in.poke(0.S)
    c.clock.step(1)
    c.io.pc4.expect(4.S)
    c.io.out.expect(0.S)

}}}