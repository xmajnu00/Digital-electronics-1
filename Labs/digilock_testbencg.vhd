--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:58:53 04/29/2020
-- Design Name:   
-- Module Name:   D:/project DE1/Projekt/digilock_testbencg.vhd
-- Project Name:  Projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: digilock
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY digilock_testbencg IS
END digilock_testbencg;
 
ARCHITECTURE behavior OF digilock_testbencg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT digilock
    PORT(
         clk_i : IN  std_logic;
         reset : IN  std_logic;
         col_line : IN  std_logic_vector(2 downto 0);
         row_line : OUT  std_logic_vector(3 downto 0);
         leds : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal reset : std_logic := '1';
   signal col_line : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal row_line : std_logic_vector(3 downto 0);
   signal leds : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: digilock PORT MAP (
          clk_i => clk_i,
          reset => reset,
          col_line => col_line,
          row_line => row_line,
          leds => leds
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk_i <= '0';
		wait for clk_period/2;
		clk_i <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	BEGIN
    
		WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		col_line(0) <= row_line(0);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		col_line(0) <= row_line(1);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		col_line(0) <= row_line(2);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		col_line(0) <= row_line(3);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		col_line(1) <= row_line(0);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		col_line(1) <= row_line(1);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
	WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		col_line(1) <= row_line(2);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		col_line(1) <= row_line(3);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		col_line(2) <= row_line(0);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		col_line(2) <= row_line(1);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		col_line(2) <= row_line(2);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		col_line(2) <= row_line(3);
		
		WAIT FOR 100 us;
	END LOOP;
	col_line <= "111";

      -- insert stimulus here 

      wait;
   end process;

END;
