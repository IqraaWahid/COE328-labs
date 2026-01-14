-- check the code (modify it)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sseg_yn is
    port(
        bcd_code : in  std_logic_vector(3 downto 0);   -- 0000='n', 1111='y'
        segments : out std_logic_vector(6 downto 0)    -- (a,b,c,d,e,f,g), active-low (0:on)
    );
end sseg_yn;

architecture Behavior of sseg_yn is
begin
    process(bcd_code)
    begin
        -- 0000 => 'n'  (e, g, c ON)
        if bcd_code = "0000" then
            segments <= "1101010";   -- a b c d e f g

        -- 1111 => 'y'  (a,e OFF; others ON)
        elsif bcd_code = "1111" then
            segments <= "1000100";   -- a b c d e f g

        -- unused -> blank
        else
            segments <= "1111111";   -- all OFF (active-low)
        end if;
    end process;
end Behavior;
