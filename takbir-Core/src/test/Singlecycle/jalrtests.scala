package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class JALr_TESTS extends FreeSpec with ChiselScalatestTester{
    "JALR tests" in {
    test(new Jalr()){c=>
        c.io.input_a.poke(1.S)
        c.io.input_b.poke(1.S)
	    c.clock.step(1)
	    c.io.output.expect(2.S)
}}}