-- ALU3 modify this (havent checked)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
    port(
        Clock      : in  std_logic;
        reset      : in  std_logic;
        A, B       : in  unsigned(7 downto 0);     -- 8-bit A and B
        opcode     : in  unsigned(15 downto 0);    -- from Part 1 (not used in j)
        student_id : in  unsigned(3 downto 0);     -- FSM output
        result_code: out unsigned(3 downto 0)      -- 1111 = 'y', 0000 = 'n'
    );
end ALU3;

architecture Behavior of ALU3 is
    -- Split B into upper/lower 4-bit digits
    signal B_digit1, B_digit2 : unsigned(3 downto 0);
begin
    B_digit1 <= B(7 downto 4);   -- upper 4 bits of B
    B_digit2 <= B(3 downto 0);   -- lower 4 bits of B

    process(Clock, reset)
    begin
        if reset = '0' then
            -- default = 'n'
            result_code <= "0000";

        elsif rising_edge(Clock) then
            -- Problem 3(j) function:
            -- 'y' if either digit of B equals student_id, else 'n'
            if (B_digit1 = student_id) or (B_digit2 = student_id) then
                result_code <= "1111";   -- means 'y'
            else
                result_code <= "0000";   -- means 'n'
            end if;
        end if;
    end process;
end Behavior;