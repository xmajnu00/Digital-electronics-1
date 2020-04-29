library ieee;
use ieee.std_logic_1164.all;
  
entity testbench is
--empty
end testbench;
 
architecture tb of testbench is 
begin
  	clk_i_process: process
  	 begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
  	 end process;

	stim_proc: process
	BEGIN
    
		WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		data_i(0) <= data_o(1);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		data_i(0) <= data_o(0);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		data_i(0) <= data_o(2);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    	WAIT FOR 2000 ms;
	for i in 0 to 5000 loop
		data_i(1) <= data_o(1);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    	WAIT FOR 500 ms;
	for i in 0 to 5000 loop
		data_i(1) <= data_o(0);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    	WAIT FOR 1000 ms;
	for i in 0 to 5000 loop
		data_i(1) <= data_o(1);
		
		WAIT FOR 100 us;
	END LOOP;
	data_i <= "1111";
    
    wait;
    end process;
end;