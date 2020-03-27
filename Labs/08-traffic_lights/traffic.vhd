library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity traffic is
	port(
    clk      	: in  STD_LOGIC;
    clr      	: in  STD_LOGIC;
    lights		: out std_logic_vector(5 downto 0)  
	);
end entity traffic;



architecture traffic of traffic is

	
    signal count : unsigned(3 downto 0);
    constant sec5: unsigned(3 downto 0) := "1111";
    constant sec1: unsigned(3 downto 0) := "0011";
	type state_type is (s0,s1,s2,s3,s4,s5);
	signal state: state_type;
begin
  	process(clk,clr)
  	begin 
		if rising_edge(clk) then
		if clr = '0' then
        	state <= s0;
            	count <= X"0";
      	else
  			
	case state is
            	when s0 =>
              		if count < sec5 then 
                    	state <= s0;
							count <= count +1;
              		else 
                    	state <= s1;
							count <= X"0";
              		end if;
             	when s1 =>
              		if count < sec1 then 
                    	state <= s1;
              			count <= count +1;
              		else 
                    	state <= s2;
              			count <= X"0";
              		end if;
              	when s2 =>
              		if count < sec1 then 
                    	state <= s2;
              			count <= count +1;
              		else 
                    	state <= s3;
              			count <= X"0";
              		end if;
                when s3 =>
              		if count < sec5 then 
                    	state <= s3;
              			count <= count +1;
              		else 
                    	state <= s4;
              			count <= X"0";
              		end if;
              	when s4 =>
              		if count < sec1 then 
                    	state <= s4;
              			count <= count +1;
              		else 
                    	state <= s5;
              			count <= X"0";
              		end if;
              	when s5 =>
              		if count < sec1 then 
                    	state <= s5;
              			count <= count +1;
              		else 
                    	state <= s0;
              			count <= X"0";
              		end if;
              	when others => 
              			state <= s0;
			end case;
		end if;
	end if;
	end process;
    
    Combination: process(state)
    begin
    	case state is
        	when s0 => lights <= "100001";
            when s1 => lights <= "100010";
          	when s2 => lights <= "100100";
          	when s3 => lights <= "001100";
          	when s4 => lights <= "010100";
          	when s5 => lights <= "100100";
          	when others => lights <= "100001";
		end case;
	end process;
end traffic;