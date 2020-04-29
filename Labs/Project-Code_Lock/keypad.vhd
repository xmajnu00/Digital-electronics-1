
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

 

entity keypad is
	port(
		clk,reset: in std_logic;
		col_line : in std_logic_vector(2 downto 0);
		row_line : out std_logic_vector(3 downto 0));
	
end entity keypad; 

architecture Behavioral of keypad is

signal temp : std_logic_vector(10 downto 0);

	begin

		test: process(clk,reset) is

		begin

			if(reset='0') then

			elsif rising_edge(clk) then

				temp <= temp + 1;

				case temp(10 downto 8) is

					when "000" => row_line <= "0111"; 		--first row   # 0 *
					when "001" =>

						if col_line = "011" then		-- #
						elsif col_line = "101" then 	-- 0
						elsif col_line = "110" then	--	*
						end if;
		
					when "010" => row_line <= "1011"; 		--second row	1 2 3
					when "011" =>
			
						if col_line = "110"	then		-- 3
						elsif col_line = "101" then	-- 2
						elsif col_line = "011" then 	-- 1
						end if;

					when "100" =>	row_line <= "1101"; 			--third row	4 5 6
					when "101" =>

						if col_line = "110" 	then		-- 6
						elsif col_line = "101" then 	-- 5
						elsif col_line = "011" then 	-- 4		
						end if;

					when "110" => row_line <= "1110"; 			--fourth row 7 8 9
					when "111" => 
						if col_line = "110" 	then			-- 9
						elsif col_line = "101" then 	-- 8
						elsif col_line = "011" then	-- 7
						end if;
					when others => row_line <= "1111";
			
				end case;

			end if;

		end process;

	end Behavioral;