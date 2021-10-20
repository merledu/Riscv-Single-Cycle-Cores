# Awwad-Core

## Introduction To Awwad-Core

### Designed by Saad Ali
I'm in my senior year currently pursuing bachelors in software engineering at [Usman Institute of Technology, Pakistan.](https://www.uit.edu/) Being a trainee @ [Micro Electronics Research Lab](https://github.com/merledu), I've designed a parameterized RISC-V 32-bit Single Cycle Core(supporting I Type) using functional programming in Scala and Chisel.

### First of all get started by Cloning this repository in your machine
```ruby
https://github.com/SaadAliHafiz/Riscv-Single-Cycle-Cores.git
```

### Navigate to ***Awwad-Core*** directory as
```ruby
cd Awwad-Core
```

And enter
```ruby
sbt
```

```ruby
sbt:Awwad-Core>
```

### Navigate to Datapath Directory via

```
Awwad-Core/src/main/scala/Datapath
```

Open  "instrFile.txt" file and place the instruction(Hexa-Decimal) code simulated on ***Venus*** (RISC-V Simulator)
Each instruction's hexadecimal code must be on seperate line as following. The following is a sample program containing 9 instructions.
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

After pasting your own set of instructions or the above ones, Open **Config.scala**  manually by following the above path and open the file in your favorite text editor. Find the following line
``` python
val initFile = "Some Path to txt file"
```

Update the .txt file path to match your "instrFile.txt" that you updated above to store your own program instructions.
After setting up the Config.scala file, Enter this command
```ruby
sbt:Awwad-Core> testOnly Datapath.TopFileTest -- -DwriteVcd=1
```

After success, you will get a folder naming ***test_run_dir*** on root of your folder. Navigate to the Top_File_Test folder inside.\
There, you will find a file named TopFile.vcd, double click it and visualise on **[GTKwave](https://sourceforge.net/projects/gtkwave/)** to see your program running.

