# Digital-electronics-1 Project: Code Lock

#### Table of Contents
1. [Introduction](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/Project-Code_Lock/README.md#Introduction) <br/>
2. Program enrichment <br/>
3. Simulation <br/>
3. Software <br/>
4. References <br/>

## Introdcution
Welcome to our project from course BPC-DE1: Code lock. <br/>
The main task was to create code lock with matrix keyboard 4x3, a time limit for entering the correct pin and signaling an incorrect attempt. <br/> <br/>
With use of ISE 14.7 and VHDL programming language we made algorithm for code lock with writing rows and reading columns. In loop, we are testing every 100 us, if there is high level on matrix keyboard on every bit, up to 5000 times. After that, next bit is beeing tested.  <br/>

![Schematic](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/Project-Code_Lock/schematic.png)
In our project we used 4 main modules:
* Finite state machine 
* Keypad
* Clock enable
* LED display
<br/>
In finite state machine(FSM) module was tested state of key input and then checked, if the entered code was correct or incorrect. After every inccorect code there was updated number of attempts until maximum number of allowed attempts is reached.
<br/> <br/>
In keypad module was initialized numbers used on out matrix keyboard 4x3. In first row, there are character "#", number 0 and character "*". In second row, there are numbers 1,2 and 3, in third row numbers 4,5 and 6 and in the last row, there are numbers from 7 to 9. These characters and numbers are lately used for entering the correct or incorrect code. 
 <br/> <br/>
 Matrix keyboard is testing column value gradually. If the key in the given column is pressed, it is connected to the low value "0". The same is then done with line testing and a keystroke is encountered (For example, when col_line: = "011" and row_line = "1110" is displayed, when you press 7). This data is then sent to FSM, where it is compared with the value for allowing access. 
 <br/> <br/>
The signal from the keypad goes to the FSM and compares the individual data one after the other, starting from the value of the lowest input and determining the correctness of the given key for unlocking. The output can be displayed on the LED display, where the LED number of wrong attempts from 0 is used, ie up to 3 wrong attempts signaling the LED lighting. We assume that the given LEDs could be located on the CPLD panel and the given LEDs for the experiments would glow red.
<br/> <br/>
The operating frequency in our connection is 10 kHz and we considered connecting a matrix keyboard, which is connected by its pins on the coolrunner board.
<br/> <br/>

## Program enrichment
* Addition of RST button for complete reset
* Button after which we can choose a password
* Green LED lights up after successful entry of the code.
<br/> <br/>

## Simulation
![Simulation](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/Project-Code_Lock/simulation_Code_lock.png)


## Software
ISE 14.7 <br/>
EDA Playground
## References
[Our github repository with project](https://github.com/xmajnu00/Digital-electronics-1/tree/master/Labs/Project-Code_Lock) <br/>
[Inspiration for testbench looping](https://forums.xilinx.com/t5/Simulation-and-Verification/VHDL-Test-Bench-loop/m-p/508221/highlight/true?fbclid=IwAR0XJdSuRh-YEn6YNLzo23hpYOJm8F1rLGIMSDkAgnSzBemhPuButKjky7Y#M10757)
