package practice

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ALUCONTROLTest extends FreeSpec with ChiselScalatestTester{
   "ALUCONTROLTest test" in{
       test(new Alu_Control  ()){c =>
         c.io.func3.poke(0.U)
         c.io.func7.poke(0.B)
         c.io.aluOp.poke(0.U)
         c.clock.step(1) 
         c.io.out.expect(0.U)
   }
}      
}
