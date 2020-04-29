# Digital-electronics-1 Project: Code Lock

#### Table of Contents
1. Introduction <br/>
2. Software <br/>
3. References <br/>


Welcome to our project from course BPC-DE1: Code lock. <br/>
The main task was to create code lock with matrix keyboard 4x3, a time limit for entering the correct pin and signaling an incorrect attempt. <br/>
With use of ISE 14.7 and VHDL programming language we made algorithm for code lock with writing rows and reading columns. In loop, we are testing every 100 us, if there is high level on matrix keyboard on every bit, up to 5000 times. After that, next bit is beeing tested.  

<br/>
In our project we used 4 main modules:
![Schematic](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/Project-Code_Lock/schematic.png)
* Finite state machine
* Keypad
* Clock enable
* LED display

## Software
ISE 14.7 <br/>
EDA Playground
## References
[Our github repository with project](https://github.com/xmajnu00/Digital-electronics-1/tree/master/Labs/Project-Code_Lock)
