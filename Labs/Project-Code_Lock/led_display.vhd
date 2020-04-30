library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_display is
	port(
		clk,unlock: in STD_LOGIC;
		try: in STD_LOGIC_VECTOR(1 DOWNTO 0);
		led: out STD_LOGIC_VECTOR(2 DOWNTO 0));
	end led_display;
	
architecture Behavioral of led_display is
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if(unlock='0') then--locked
				led(0)<='1';
				if(try="00") then
					led(2 DOWNTO 0)<="000";
				elsif(try="01") then
					led(2 DOWNTO 0) <="001";
				elsif(try="10") then
					led(2 DOWNTO 0)<="010";
				elsif(try="11") then
					led(2 DOWNTO 0)<="100";
				end if;
			end if;
		end if;
	end process;
end Behavioral; 
