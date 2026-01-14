library ieee;
use ieee.std_logic_1164.all;

entity dec4to16 is
    port (
        w  : in  std_logic_vector(3 downto 0);   -- student_id or current_state
        En : in  std_logic;
        OP  : out std_logic_vector(15 downto 0)  -- this is OP
    );
end dec4to16;

architecture Behaviour of dec4to16 is
begin
    process(w, En)
    begin
        if En = '1' then
            case w is
                when "0000" => OP <= "0000000000000001";  -- ADD
                when "0001" => OP <= "0000000000000010";  -- SUB
                when "0010" => OP <= "0000000000000100";  -- NOT A
                when "0011" => OP <= "0000000000001000";  -- NAND
                when "0100" => OP <= "0000000000010000";  -- NOR
                when "0101" => OP <= "0000000000100000";  -- AND
                when "0110" => OP <= "0000000001000000";  -- OR
                when "0111" => OP <= "0000000010000000";  -- XOR
                when "1000" => OP <= "0000000100000000";  -- XNOR
                when others => OP <= (others => '0');
            end case;
        else
            OP <= (others => '0');
        end if;
    end process;
end architecture;