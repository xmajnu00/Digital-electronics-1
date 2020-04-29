library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM is
	port(clk, reset: in STD_LOGIC;
		key_in: in STD_LOGIC_VECTOR(3 DOWNTO 0);
		num_entered: out STD_LOGIC_VECTOR(2 DOWNTO 0);
		state_out: out STD_LOGIC_VECTOR(2 DOWNTO 0);
		try_out: out STD_LOGIC_VECTOR(1 DOWNTO 0);
		mode_out, correct: out STD_LOGIC);
	end FSM;
architecture Behavioral of FSM is
		SIGNAL k0, k1, k2, k3: STD_LOGIC_VECTOR(1 DOWNTO 0);
		SIGNAL mode: STD_LOGIC;
		SIGNAL try: STD_LOGIC_VECTOR(1 DOWNTO 0);
		SIGNAL count: STD_LOGIC_VECTOR(2 DOWNTO 0);

	type STATE_TYPE is (usr_store, usr_wait4release, admin_store, admin_wait4release,good); 
		attribute ENUM_ENCODING: STRING;
		attribute ENUM_ENCODING of STATE_TYPE:type is "000 001 010 011 100";
		signal state: STATE_TYPE;
		
		CONSTANT usr_key: STD_LOGIC_VECTOR(7 DOWNTO 0):= "11100100";-- enter user key as desired in reverse order. 4ht3rd2nd1st
		CONSTANT admin_key: STD_LOGIC_VECTOR(7 DOWNTO 0):= "00011011";
	
	begin
		process(state,clk, key_in, reset, count, try, mode, k0,k1,k2,k3)
		variable temp: STD_LOGIC_VECTOR(1 DOWNTO 0);
		begin
			if(reset='1') then
				state<=usr_store;
				correct<='0';
				count<="000";
				try<="00";
				mode<='0';
			else
				if(clk'EVENT AND clk='1') then
					case state is
						when usr_store=> 
							if(key_in(0) ='1') then
								temp:="00";
								count<=count+1;
								state<=usr_wait4release;
							elsif(key_in(2) ='1') then
								temp:="01";
								count<=count+1;
								state<=usr_wait4release;
							elsif(key_in(2) ='1') then
								temp:="10";
								count<=count+1;
								state<=usr_wait4release;
							elsif(key_in(3)='1') then
								temp:="11";
								count<=count+1;
								state<=usr_wait4release;
							else
								count<=count;
								temp:=temp;
								state<=state;
							end if;
			
							if(count="000") then
								k0<=temp;
							elsif(count="001") then
								k1<=temp; 
							elsif(count="010") then
								k2<=temp;
							elsif(count="011") then
								k3<=temp;
							end if;
						when usr_wait4release=>
							if(key_in(0)='0' AND key_in(1)='0' AND key_in(2)='0' AND key_in(3)='0') then
								if(count="100") then --all entered
									if(usr_key=(k3 & k2 & k1 & k0)) then --correct key
										state<=good;
									else --wrong try
										if(try="10") then
											mode<='1';
											state<=admin_store;
											count<="000";
										else
											try<=try+1;
											state<=usr_store;
											count<="000";
										end if;
									end if;
								else
									state<=usr_store;
								end if;
						end if;

						when admin_store=>
							if(key_in(0) ='1') then
								temp:="00";
								count<=count+1;
								state<=admin_wait4release;
							elsif(key_in(1)='1') then
								temp:="01";
								count<=count+1;
								state<=admin_wait4release;
							elsif(key_in(2)='1') then
								temp:="10";
								count<=count+1;
								state<=admin_wait4release;
							elsif(key_in(3)='1') then 
								temp:="11";
								count<=count+1;
								state<=admin_wait4release;
							else
								count<=count;
								temp:=temp;
								state<=state;
							end if;

							if(count="000") then
								k0<=temp;
							elsif(count="001") then
								k1<=temp;
							elsif(count="010") then
								k2<=temp;
							elsif(count="011") then
								k3<=temp;
							end if;

						when admin_wait4release=>
							if(key_in(0)='0' AND key_in(1)='0' AND key_in(2)='0' AND key_in(3)='0') then
								if(count="100") then --all entered
									if(admin_key=(k3 & k2 & k1 & k0)) then -- correct key
										state<=usr_store;
										count<="000";
										mode<='0';
										try<="00";
									else --wrong try
										count<="000";
										state<=admin_store;
									end if;
								else
									state<=admin_store;
								end if;
							end if;
						when good=> correct<='1';
							state<=good;
						when OTHERS=> state<=usr_store;
					end case;
				end if;
			end if;
	end process; 
	
	mode_out<=mode;
	num_entered<=count;
	try_out<=try;
	process(state)
	begin
		case state is
			when usr_store=> state_out<="000";
			when usr_wait4release=> state_out<="001";
			when admin_store =>state_out<="010";
			when admin_wait4release=> state_out<="011";
			when good=> state_out<="101";
			when others=> state_out<="111";
		end case;
	end process;
end Behavioral; 