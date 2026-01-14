library ieee; 
use ieee.std_logic_1164.all;
entity machine is
	port 
	(	clk		: in std_logic;
		data_in	: in std_logic;
		reset 	: in std_logic;
		student_id : out std_logic_vector(3 downto 0);
		current_state: out std_logic_vector(3 downto 0));
end entity;

architecture fsm of machine is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
	signal yfsm : state_type;
	begin
		process (clk, reset)
		begin
			if (reset = '1') then
				yfsm <= s0;
				
			elsif (clk'Event and clk = '1') then
				CASE yfsm IS 
						WHEN s0 => yfsm <= s1; 
						WHEN s1 => yfsm <= s2; 
						WHEN s2 => yfsm <= s3; 
						WHEN s3 => yfsm <= s4; 
						WHEN s4 => yfsm <= s5;
						WHEN s5 => yfsm <= s6; 
						WHEN s6 => yfsm <= s7; 
						WHEN s7 => yfsm <= s8; 
						WHEN s8 => yfsm <= s0; 
						WHEN OTHERS => yfsm <= s0; 
				END CASE;
			END IF;
		END PROCESS;
		
		PROCESS(yfsm, data_in) -- COMMENT: THIS PROCESS STATEMENT IS FOR OUTPUT FOR MEALY FSM 12.
		BEGIN 
				case yfsm is
					when s0 => current_state <= "0000"; student_id <= "0101"; --5 
					when s1 => current_state <= "0001"; student_id <= "0000"; --0 
					when s2 => current_state <= "0010";  student_id <= "0001"; --1  
					when s3 => current_state <= "0011";  student_id <= "0010"; --2  
					when s4 => current_state <= "0100";  student_id <= "1000"; --8  
					when s5 => current_state <= "0101";  student_id <= "0111";--7  
					when s6 => current_state <= "0110";  student_id <= "0100";--4 
					when s7 => current_state <= "0111";  student_id <= "0001"; --1  
					when s8 => current_state <= "1000";  student_id <= "0000"; --0  
					when others => current_state <= "0000"; student_id <= "1111";  
				end case;
		end process;
end fsm;