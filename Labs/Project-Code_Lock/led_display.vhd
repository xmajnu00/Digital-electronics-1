library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_display is
	port( count: in STD_LOGIC_VECTOR(2 DOWNTO 0);
		clk, mode, unlock: in STD_LOGIC;
		try: in STD_LOGIC_VECTOR(1 DOWNTO 0);
		led: out STD_LOGIC_VECTOR(7 DOWNTO 0));
	end led_display;
	
architecture Behavioral of led_display is
	signal temp_count : std_logic_vector(7 downto 0);
begin
	process(clk, mode, count, try, unlock)
	begin
		if(clk'EVENT AND clk='1') then
			if(unlock='0') then--locked
				if(mode='0') then --usr mode
					led(7)<='1';
					if(try="00") then
						led(6 DOWNTO 4)<="000";
					elsif(try="01") then
						led(6 DOWNTO 4)<="001";
					elsif(try="10") then
						led(6 DOWNTO 4)<="011";
					elsif(try="11") then
						led(6 DOWNTO 4)<="111";
					end if;
				else --admin mode
					led(7 DOWNTO 4)<=X"F";
				end if;

				if(count="000") then
					led(3 DOWNTO 0)<=X"0";
				elsif(count="001") then
					led(3 DOWNTO 0)<=X"1";
				elsif(count="010") then
					led(3 DOWNTO 0)<=X"3";
				elsif(count="011") then
					led(3 DOWNTO 0)<=X"7";
				elsif(count="100") then
					led(3 DOWNTO 0)<=X"F";
				end if;
			else --unlcocked
				case temp_count is
					when "00000001" => temp_count <="00000010";
					when "00000010" => temp_count <="00000100";
					when "00000100" => temp_count <="00001000";
					when "00001000" => temp_count <="00010000";
					when "00010000" => temp_count <="00100000";
					when "00100000" => temp_count <="01000000";
					when "01000000" => temp_count <="10000000";
					when "10000000" => temp_count <="00000001";
					when others => temp_count <="00000001";
				end case;
					led<=temp_count;
			end if;
		end if;
	end process;
end Behavioral; 

