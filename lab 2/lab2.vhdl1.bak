LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab2_vhdl1 IS
PORT (
  x1, x2, x3, x4 : IN  STD_LOGIC;
  o              : OUT STD_LOGIC
);
end lab2_vhdl1;

ARCHITECTURE Behavior OF lab2_vhdl1 IS
BEGIN
  -- F = (x1'x3')((x4x2)(x2x3)')'((x4'x1')(x1x3x4')')'
  o <= ( (not x1) and (not x3) )                             -- (x1' x3')
       and not( (x4 and x2) and (not (x2 and x3)) )          -- ((x4x2)(x2x3)')'
       and not( ( (not x4) and (not x1) )                    -- ((x4'x1')
               and ( not ( x1 and x3 and (not x4) ) ) );     --  (x1x3x4')')'
END Behavior;
