| **A** | **NOT** |
| :-: | :-: |
| 0 | 1 |
| 1 | 0 | \

| **A** | **B** | **AND** | **NAND** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 | \

| **A** | **B** | **OR** | **NOR** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | \

| **A** | **B** | **XOR** | **XNOR** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 | \

![](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/01-gates/simulation.png) <br> <br> <br>
![a](https://latex.codecogs.com/gif.latex?f%3D%20a%20.%20%5Cbar%7Bb%7D%20&plus;%20%5Cbar%7Bb%7D%20.%20%5Cbar%7Bc%7D)<br> <br>
![b](https://latex.codecogs.com/gif.latex?f%3D%20%5Coverline%7B%28%5Coverline%7Ba%20.%20%5Cbar%7Bb%7D%7D%29%20.%20%28%5Coverline%7B%5Cbar%7Bb%7D%20.%20%5Cbar%7Bc%7D%7D%29%7D) <br>  <br>
![b](https://latex.codecogs.com/gif.latex?f_%7BOR%7D%3D%20%28%5Coverline%7B%5Cbar%7Ba%7D%20&plus;%20b%29%20&plus;%20%28%5Coverline%20b%20&plus;%20c%7D%29)





| **A** | **B** | **C** | **f** | **fAND** | **fOR** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 0 | 1 | 1 | 
| 0 | 0 | 1 | 1 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |
