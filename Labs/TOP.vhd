library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity digilock is
	port(
			clk_i: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			col_line: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			row_line: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds: out STD_LOGIC_VECTOR(2 DOWNTO 0)
			);			
	end digilock;

architecture Behavioral of digilock is	
	
	SIGNAL mode, correct: STD_LOGIC;
	SIGNAL try: STD_LOGIC_VECTOR(1 DOWNTO 0);	
	signal key_in_h 	: STD_LOGIC_VECTOR(3 downto 0);
	signal s_en: STD_LOGIC;
	begin
--led_display
	KEY_PAD: entity work.keypad
		port map(
			col_line => col_line,
			row_line => row_line,
			reset => reset,
			clk => clk_i,
			key_o => key_in_h
			 );
				
	LEDdisplay:	entity work.led_display
		port map	(
			clk=>s_en,
			mode=>mode, 
			unlock=>correct,
			try=>try, 
			led=>leds
				);
	
--FSM
	F_S_M: entity work.FSM
	port map( 
			key_in => key_in_h,
   		clk => clk_i,
			reset => reset,
			try_out => try,
			mode_out => mode, 
			correct => correct
			);
	

--clk generator
 CLK: entity work.clock_enable
	 generic map(
			g_NPERIOD => x"0064"			-- 100ms with 10kHz signal
	 			)
	 port map(
			clk   			=> clk_i,  		-- 10 kHz
			reset 			=> reset,   	-- Synchronous reset
			clock_enable_o 	=> s_en			
				);

				
end Behavioral; 