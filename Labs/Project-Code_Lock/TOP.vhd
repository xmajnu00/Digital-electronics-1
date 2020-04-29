library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity digilock is
	port(clk, reset: IN STD_LOGIC;
			data_i: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			leds: out STD_LOGIC_VECTOR(7 DOWNTO 0));
			
	end digilock;

architecture Behavioral of digilock is

--keypad
		COMPONENT keypad
	port(
		clk,reset: in std_logic;
		col_line : in std_logic_vector(2 downto 0);
		row_line : out std_logic_vector(3 downto 0));
		END COMPONENT;
	

--led_display
		COMPONENT led_display
	PORT(
		count : IN std_logic_vector(2 downto 0);
		clk : IN std_logic;
		mode : IN std_logic;
		unlock : IN std_logic;
		try : IN std_logic_vector(1 downto 0);
		led : OUT std_logic_vector(7 downto 0));
	END COMPONENT;

--FSM
	COMPONENT FSM
	PORT(
		key_in: IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		num_entered : OUT std_logic_vector(2 downto 0);
		state_out : OUT std_logic_vector(2 downto 0);
		try_out: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		mode_out : OUT std_logic;
		correct : OUT std_logic);
	END COMPONENT;
	
--clk generator
	component clockGenerator
	port(
		sysClk: in std_logic;--50Mhz clock
		msClk : out std_logic;
		secClk: out std_logic);
	end component;
	
	SIGNAL msclk, secClk: STD_LOGIC;
	SIGNAL mode, correct: STD_LOGIC;
	SIGNAL count: std_logic_vector(2 downto 0);
	SIGNAL try: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL state_out: STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal key_in 	: STD_LOGIC_VECTOR(3 downto 0);
	signal row_line: STD_LOGIC_VECTOR(3 downto 0);
	begin
--led_display
	KEY_PAD: entity keypad
		port map(
			row_line => key_in,
			col_line => data_i,			
			reset => reset,
			clk => clk
			);
		
				
		
	LEDdisplay:	entity led_display
		port map	(
			count=>count,
			clk=>secClk,
			mode=>mode, 
			unlock=>correct,
			try=>try, 
			led=>leds
				);
	


		--FSM
	F_s_m: entity FSM
	port map( 
   		key_in => row_line,
			clk => clk,
			reset => reset,
			num_entered => count,
			state_out => state_out,
			try_out => try,
			mode_out => mode, 
			correct => correct
			);
	
	
--clk generator
CLK_gen:	entity clockGenerator
	port map(
			sysclk => clk,
			msclk => msclk,
			secClk => secClk
				);
				
end Behavioral; 