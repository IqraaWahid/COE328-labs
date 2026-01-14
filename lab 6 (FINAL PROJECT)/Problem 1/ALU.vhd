library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port( Clock : in std_logic;  -- input clock signal
          A,B : in unsigned(7 downto 0); -- 8-bit inputs from latches A and B
          --student_id : in unsigned(3 downto 0); -- 4-bit student id from FSM
          OP : in unsigned(15 downto 0); -- 16-bit selector for Operation from Decoder
			 Reset : in std_logic;  -- input reset signal
          neg : out std_logic; -- is the result negative? Set=1bit output 
          R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Result Output
          R2 : out unsigned(3 downto 0)); -- higher 4-bits of 8-bit Result Output
end ALU;

architecture calculation of ALU is
-- temporary signal declarations.
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
    signal Reg4 : unsigned(0 to 7);

begin
    Reg1 <= A; -- temporarily store A in Reg1 local variable
    Reg2 <= B; -- temporarily store B in Reg2 local variable

process(Clock, OP)
begin
	if(rising_edge(Clock)) THEN -- Do the calculation @ positive edge of clock cycle.
        case OP is
				-- Function #1: A + B
            WHEN "0000000000000001" => 
                -- Do Addition for Reg1 and Reg2
					 Result <= Reg1 + Reg2;
					 neg <= '0';
					 
				-- Function #2: A - B
            WHEN "0000000000000010" => 
                -- Do Subtraction
					 if(Reg1>= Reg2) THEN
						neg <= '0';
						Result <= Reg1-Reg2;
					 else
						neg <= '1';
						Result <= Reg2 - Reg1;
					 end if;
					 
				-- Function #3: Inverse of A
            WHEN "0000000000000100" => 
                -- Do Inverse
					 Result <= not Reg1;
					 neg <= '0';

			   -- Function #4: A NAND B
            WHEN "0000000000001000" => 
                -- Do Boolean NAND
					 Result <= not(Reg1 and Reg2);
					 neg <= '0';
					 
				-- Function #5: A NOR B
            WHEN "0000000000010000" => 
                -- Do Boolean NOR
					 Result <= not(Reg1 or Reg2);
					 neg <= '0';

				-- Function #6: A AND B
            WHEN "0000000000100000" => 
                -- Do Boolean AND
					 Result <= Reg1 and Reg2;
					 neg <= '0';

			   -- Function #7: A XOR B
            WHEN "0000000001000000" => 
                -- Do Boolean XOR
					 Result <= Reg1 xor Reg2;
					 neg <= '0';

				-- Function #8: A OR B
            WHEN "0000000010000000" => 
                -- Do Boolean OR
					 Result <= Reg1 or Reg2;
					 neg <= '0';

				-- Function #9: A XNOR B
            WHEN "0000000100000000" => 
                -- Do Boolean XNOR
					 Result <= not (Reg1 xor Reg2);
					 neg <= '0';

            WHEN OTHERS =>
                -- Don't care, do nothing
					 Result <= (others => '0');  -- default: no operation -- Don't care, do nothing
        end case;
	end if;
end process;

    R1 <= Result(3 downto 0);   -- Since the output seven segments can 
    R2 <= Result(7 downto 4);   -- only 4-bits, split the 8-bit to two 4-bits.

end calculation;