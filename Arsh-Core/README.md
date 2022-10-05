<h1><b>Arsh - عرش </b> </h1>

<div align='center'><img src="https://readme-typing-svg.demolab.com?font=Arial&size=22&pause=1000&color=89CFF0&multiline=true&width=435&lines=RISC-V+Single+Cycle+Core" alt="Typing SVG" /><br>
<img src="https://readme-typing-svg.demolab.com?font=Arial&size=18&pause=1000&color=89CFF0&multiline=true&width=435&lines=Designed+by+Hamna+Mohiuddin" alt="Typing SVG" />
</div>

First of all get started by cloning this repository on your machine.

```ruby
git clone https://github.com/hamnamohi/Arsh-SingleCycleCore.git
```

Create a .txt file and place the ***hexadecimal*** code of your instructions simulated on ***Venus*** (RISC-V Simulator)\
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
cd Arsh-SingleCycleCore\src\main\singlecycle
```
Open **instmemory.scala** with this command. You can also manually go into the above path and open the file in your favorite text editor.
```ruby
open instmemory.scala
```
Find the following line
``` python
loadMemoryFromFile (imemm,"D:/merl/Scala-Chisel-Learning-Journey/src/main/scala/singlecycle/abc.txt")
```
Change the .txt file path to match your file that you created above storing your own program instructions. or you can also use this file\
After setting up the instmemory.scala file, go inside the Arsh-SingleCycleCore.
```ruby
cd root/Arsh-SingleCycleCore
```
And enter
```ruby
sbt
```
When the terminal changes to this type
```ruby
sbt:Arsh-SingleCycleCore>
```
Enter this command
```ruby
sbt:Arsh-SingleCycleCore> testOnly singlecycle.toptest -- -DwriteVcd=1
```

After success you will get a folder ***test_run_dir*** on root of your folder. Go into the examples folder inside.\
There you will find the folder named Top. Enter in it and you can find the Top.vcd file which you visualise on **gtkwave** to\
see your program running.
