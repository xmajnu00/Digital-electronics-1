# Digital-electronics-1
## A
## B
### C
| **něco** |
| :-: |
| tady nic neni |

# Příprava 04-adder
## Hald adder
| **B** | **A** | **Carry** | **Sum** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |


![Logic diagram half adder](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/03-segment/Half_Adder.png)<br/> <br/>

## Full adder
| **Cin** | **B** | **A** | **Cout** | **Sum** |
| :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 0 | 1 |
| 0 | 1 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 | 1 |
| 1 | 0 | 1 | 1 | 0 |
| 1 | 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 | 1 |

![Logic diagram full adder](https://github.com/xmajnu00/Digital-electronics-1/blob/master/Labs/03-segment/Full_adder.png)<br/> <br/>

# Příprava 05-Binary counters
## Periody a převod do binarní a hexadecimalní soustavy



| **Time** | **Number of periods** | **Number of periods in binary** | **Number of periods in hexa** | 
| :-: | :-: | :-: | :-: |
| 10ms | 100 | 1100100 | 64 | 
| 250ms | 2500 | 100111000100 | 9C4 | 
| 500ms | 5000 | 1001110001000 | 1388 | 
| 1sec | 10000 | 10011100010000 | 2710 |


# Příprava 06-display_driver
## Signal timing to display

![Signal timing to display](https://github.com/xmajnu00/Digital-electronics-1/blob/master/obrazky_pripravy/displaytimingsignal.jpg) <br/>
 ## Upravený kód podle zadání
 
{signal: [ <br/>
  ['Digit position', <br/>
    {name: 'disp_dig_o(3)', wave: 'xx0.......xx', },<br/>
    {name: 'disp_dig_o(2)', wave: 'xx0..10..1xx', },<br/>
    {name: 'disp_dig_o(1)', wave: 'xx010..10.xx', },<br/>
    {name: 'disp_dig_o(0)', wave: 'xx01.0.1.0xx', },<br/>
  ],<br/>
  ['Seven-segment data',<br/>
    {name: 'disp_seg_o',       wave: 'xx33335555xx', data: ['0','3','1','4','0','3','1','4'], }, <br/> 
    {name: 'A: disp_seg_o(6)', wave: 'xx0.1.0.1.xx', },<br/>
    {name: 'B: disp_seg_o(5)', wave: 'xx0.......xx',          },<br/>
    {name: 'C: disp_seg_o(4)', wave: 'xx0.......xx',          },<br/>
    {name: 'D: disp_seg_o(3)', wave: 'xx0.1.0.1.xx',          },<br/>
    {name: 'E: disp_seg_o(2)', wave: 'xx01..01..xx',          },<br/>
    {name: 'F: disp_seg_o(1)', wave: 'xx01.0.1.0xx',          },<br/>
    {name: 'G: disp_seg_o(0)', wave: 'xx10101010xx',          },<br/>
  ],<br/>
  {name: 'Decimal point', wave: 'xx101..01.xx', },<br/>
],<br/>
  head: {<br/>
    text: '4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms',<br/>
  },<br/>
}<br/>
