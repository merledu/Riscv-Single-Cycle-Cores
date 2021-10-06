package example

import chisel3._ 
import chiseltest._ 
import org.scalatest.FreeSpec

import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation

class exampleTest extends FreeSpec with ChiselScalatestTester {
    "Example Test" in {
        test(new example).withAnnotations(Seq(VerilatorBackendAnnotation)){ c =>
            c.io.in.poke(1.U)
            c.clock.step(1)
            c.io.out.expect(0.U)
        }
    }
}