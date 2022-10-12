package Singlecycle
import chisel3._
import org.scalatest._
import chiseltest._

class TOP_TESTS extends FreeSpec with ChiselScalatestTester{
    "top tests" in {
    test(new Top()){c=>
//     c.io.instruction_step.poke(0.U)
//     c.clock.step(1)
//     c.io.instruction_step.poke(4.U)
//     c.clock.step(1)
//     c.io.instruction_step.poke(8.U)
//     c.clock.step(1)
//     c.io.instruction_step.poke(12.U)
//     c.clock.step(1)
//     c.io.instruction_step.poke(16.U)
//     c.clock.step(1)
//     // step(1)
   c.clock.step(50)

     }}}
  