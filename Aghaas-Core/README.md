# Aghaas-Core

## Introduction To Aghaas-Core

### Designed by Agha Muqarib
I'm in my senior year currently pursuing bachelors in software engineering at [Usman Institute of Technology, Pakistan.](https://www.uit.edu/) Being a trainee @ [Micro Electronics Research Lab](https://github.com/merledu), I've designed a parameterized RISC-V 32-bit Single Cycle Core(supporting I Type) using functional programming in Scala and Chisel.

### First of all get started by Cloning this repository in your machine
```ruby
https://github.com/Agha-Muqarib/Riscv-Single-Cycle-Cores.git
```

### Navigate to Aghaas-Core directory as
```ruby
cd Aghaas-Core
```

And enter
```ruby
sbt
```

The terminal will change to this type
```ruby
sbt:Aghaas-Core>
```

### Navigate to Datapath Directory as

```ruby
cd Aghaas-Core/src/main/scala/Datapath
```

### Then perform the following step

Open  "instrFile.txt" file and place the instruction(Hexa-Decimal) code simulated on ***Venus*** (RISC-V Simulator)\
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

After pasting your own set of instructions or the above ones, Open **Config.scala** with this command. You can also manually go into the above path and open the file in your favorite text editor.
```ruby
open Config.scala
```

Find the following line
``` python
val initFile = "Some Path to txt file"
```

Update the .txt file path to match your "instrFile.txt" that you updated above to store your own program instructions.\
After setting up the Config.scala file, go inside the ***Aghaas-Core*** folder.
```ruby
cd Aghaas-Core
```

Enter this command
```ruby
sbt:Aghaas-Core> testOnly Datapath.TopFileTest -- -DwriteVcd=1
```

After success, you will get a folder naming ***test_run_dir*** on root of your folder. Navigate to the Top_File_Test folder inside.\
There, you will find a file named TopFile.vcd, double click it and visualise on **gtkwave** to\
see your program running.


