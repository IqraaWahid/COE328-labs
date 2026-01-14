LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY asu IS
    PORT (
        Cin  : IN  STD_LOGIC; -- Cin = 0 (Add); Cin = 1 (Subtract)
        A, B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- (Inputs that'll be added/subtracted)
        S    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- (Sum/Difference)
        Sign, Cout, Overflow : OUT STD_LOGIC -- outputs
    );
END asu;

ARCHITECTURE Behavior OF asu IS
    SIGNAL B_complimented : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Sum   : STD_LOGIC_VECTOR(4 DOWNTO 0); -- sum/difference
    SIGNAL S_int : STD_LOGIC_VECTOR(3 DOWNTO 0); -- internal version of S
BEGIN
    -- Inverts B only when Cin = 1 (for subtraction)
    B_complimented <= B XOR (Cin & Cin & Cin & Cin);

    -- Storing sum
    Sum <= ('0' & A) + ('0' & B_complimented) + Cin;

    S_int <= Sum(3 DOWNTO 0); -- sum/difference are the first four bits of 'Sum'
    S <= S_int;
    Cout  <= Sum(4); -- fourth bit of 'Sum' is Cout

    Sign <= S_int(3); -- Sign is equal to the fourth bit of sum//difference
    Overflow<= Sum(4) XOR Sum(3) XOR A(3) XOR B_complimented(3); -- detecting overflow
END Behavior;