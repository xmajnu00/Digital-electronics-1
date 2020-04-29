library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clockGenerator is
	port(
		sysClk: in std_logic;	--50Mhz clock
		msClk : out std_logic;
		secClk: out std_logic);
	end clockGenerator;
	
	architecture Behavioral of clockGenerator is
	begin
		process (sysclk)
			variable cnt: integer range 0 to 50000 := 0;
			variable mscnt: integer range 0 to 1000 := 0;
		begin
			if(sysClk'event and sysClk='1')then
				cnt:=cnt+1;
				--generates msclk
					if (cnt=25000) then --half a millisecond?
						msClk<='1';
					elsif (cnt=50000) then --a full millisecond?
						msClk <= '0';
						cnt:= 0;
						msCnt:= msCnt + 1;
					end if;

					--generates secClk
					if (msCnt = 500)then --half a second?
						secclk<='1';
					elsif (mscnt = 1000) then --a full second?
						secClk <='0';
						mscnt:=0;
					end if;
			end if;
	end process;
end Behavioral;