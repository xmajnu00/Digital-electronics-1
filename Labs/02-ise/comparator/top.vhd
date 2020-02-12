------------------------------------------------------------------------
--
-- VHDL template for combinational logic circuits.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2018-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
    port  (BTN1, BTN0:    in  std_logic;
          LD3, LD2, LD1, LD0: out std_logic);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
begin    
                                                             -- A = BTN0, B = BTN1
    LD3 <= not(BTN1);                                        -- B = 1
    LD2 <= (not(BTN0 and not BTN1)) ;                        -- BTN0 > BTN1
    LD1 <= not((not BTN0 and not BTN1)or(BTN1 and BTN0));    -- BTN0 = BTN1
    LD0 <= not(BTN1 and not BTN0);                           -- BTN0 < BTN1
end architecture Behavioral;


