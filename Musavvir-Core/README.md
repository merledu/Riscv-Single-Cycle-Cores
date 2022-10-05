<div ><h1> MUSAVVIR -مُصَوِّر</h1> 

<div align='center'><img src="https://readme-typing-svg.demolab.com?font=Arial&size=22&pause=1000&color=8510d8&multiline=true&width=435&lines=RISC-V+Single+Cycle+Core" alt="Typing SVG" /><br>
<img align='center' src="https://readme-typing-svg.demolab.com?font=Arial&size=18&pause=1000&color=8510d8&multiline=true&width=435&lines=Designed+by+Maira+Usman" alt="Typing SVG" />
</div>
<br><br>
A single cycle processor is a processor that carries out one instruction in a single clock cycle

First of all get started by cloning this repository on your machine.
```
git clone https://github.com/Myrausman/RISCV-single-cycle.git
```
Create a .txt file and place the hexadecimal code of your instructions simulated on Venus (RISC-V Simulator)
Each instruction's hexadecimal code must be on seperate line as following. This program consists of 9 instructions.
```
00500113
00500193
014000EF
00120293
00502023
00002303
00628663
00310233
00008067
```
Then perform the following step
```
cd src/main/scala/text.txt
```
Open insmem.scala with this command. You can also manually go into the above path and open the file in your favorite text editor.
```
open Memory.scala
```
Find the following line
```
loadMemoryFromFile(imem,"E:/hello/Scala-Chisel-Learning-Journey/src/main/scala/riscv/abc.txt")
```
Change the .txt file path to match your file that you created above storing your own program instructions.
After setting up the Memory.scala file, go inside the shaheen folder.
```
cd root/shaheen
```
And enter
```
sbt
```
When the terminal changes to this type
```
sbt:shaheen>
```
Enter this command
```
sbt:shaheen> test:runMain riscv.Launcher Top
```
After you get success
```
sbt:shaheen> test:runMain riscv.Launcher Top --backend-name verilator
```
After success you will get a folder test_run_dir on root of your folder. Go into the examples folder inside.
There you will find the folder named Top. Enter in it and you can find the Top.vcd file which you visualise on gtkwave to
see your program running.
