# Aghaas-Core

## Introduction To Aghaas-Core

### Designed by Agha Muqarib
I'm in my senior year currently pursuing bachelors in software engineering at [Usman Institute of Technology, Pakistan.](https://www.uit.edu/) Being a trainee @ [Micro Electronics Research Lab](https://github.com/merledu), I've designed a parameterized RISC-V 32-bit Single Cycle Core(supporting I Type) using functional programming in Scala and Chisel.

### First of all get started by Cloning this repository in your machine
```ruby
https://github.com/Agha-Muqarib/Riscv-Single-Cycle-Cores.git
```

### Navigate to ***Aghaas-Core*** directory as
```ruby
cd Aghaas-Core
```

And enter
```ruby
sbt
```

The result will look like this

![image](https://user-images.githubusercontent.com/51242857/137596628-4a009c08-7c00-4ab9-9b5a-4209f5a89005.png)


and the terminal will change to this type as shown in the image above
```ruby
sbt:Aghaas-Core>
```

### Navigate to Datapath Directory via

```
Aghaas-Core/src/main/scala/Datapath
```

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

After pasting your own set of instructions or the above ones, Open **Config.scala**  manually by following the above path and open the file in your favorite text editor. Find the following line
``` python
val initFile = "Some Path to txt file"
```

Update the .txt file path to match your "instrFile.txt" that you updated above to store your own program instructions.
After setting up the Config.scala file, Enter this command
```ruby
sbt:Aghaas-Core> testOnly Datapath.TopFileTest -- -DwriteVcd=1
```
The result will look like this:

![image](https://user-images.githubusercontent.com/51242857/137596689-ddd16462-3a85-4979-93d2-011241a1a856.png)

After success, you will get a folder naming ***test_run_dir*** on root of your folder. Navigate to the Top_File_Test folder inside.\
There, you will find a file named TopFile.vcd, double click it and visualise on **GTKwave** to\
see your program running.

-----------------------------------------------------------------------------------------------


**P.S:** ***The Datapath directory also contains a file named VenusInstr.txt which contains Assembly Instructions that can be utilized as a demo or for unit testing of each instruction type. The directory also contains InstrDetails.txt file having the equivalent machine code of the instructions in Venus File, obtained by dumping them on Venus Simulator.***



