# Digital-electronics-1 Project: Code Lock

#### Table of Contents
1. Introduction <br/>
2. Software <br/>
3. References <br/>


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
 <br/>
 Maticová postupně testuje hodnotu sloupce. V případě že je stisknuta klávesa v daném sloupci tak je připojena na nízkou hodnotu "0". Totéž se poté provede s testováním řádku a tím se narazí na stisknutou klávesu (například při col_line :="011" a row_line="1110" se jedná o stisknutí klávesy 7). Tyto data jsou následně posílány v FSM, kde jsou porovnávány s hodnotou pro povolení přístupu.
 <br/>
 Do FSM jde signál z klávesnice a porovnává jednotlivé údaje postupně za sebou přičemž jde od hodnoty nejnižšího vstupu a zjišťuje korektnost dané klávesy pro odemknutí. Výstup je následně připojen na LED display, kde se pomocí ledek zobrazuje počet chybných pokusů od 0 tedy začátku až po 3 chybné pokusy signalizovány svícením LEDky. Uvažujeme, že dané ledky by se mohly nacházet na CPLD panelu a dané ledky pro pokusy by svítily červeně.
<br/>
Pracovní frekvence v našem zapojení je 10kHz a uvažovali jsme s připojením maticové klávesnice, která je připojena svými piny na desce coolrunner.  
<br/>
Obohacení programu: přidání RST tlačítka pro kompletní reset, tlařítko po jehož stisknutí si mohu navolit heslo, svícení zelené ledky po uspěšném zadání kódu.
<br/> <br/>

Simulation of our code lock:
![Simulation](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/Project-Code_Lock/simulation_Code_lock.png)


## Software
ISE 14.7 <br/>
EDA Playground
## References
[Our github repository with project](https://github.com/xmajnu00/Digital-electronics-1/tree/master/Labs/Project-Code_Lock)
