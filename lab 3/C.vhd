LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY C IS
    PORT (
            S : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- input from ASU (S)
            L : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- output
END C;

ARCHITECTURE Behaviour OF C IS
BEGIN
    PROCESS (S) -- process triggered by the input vector S[3,0] output of ASU
    BEGIN --assigning the simplified Boolean expressions to L(3), L(2), L(1), L(0), inside the archietecture process
       -- L3 = s2 s1' s0'
		 L(3) <= ( S(2) and (not S(1)) and (not S(0)) );

		 -- L2 = (s0' s1' s2' s3') + (s2 s1' s0) + (s2 s1 s0')
		 L(2) <= ( (not S(0)) and (not S(1)) and (not S(2)) and (not S(3)) )
					or ( S(2) and (not S(1)) and S(0) )
					or ( S(2) and S(1) and (not S(0)) );

		 -- L1 = (s2 s1' s0) + (s2' s1 s0)
		 L(1) <= ( S(2) and (not S(1)) and S(0) )
					or ( (not S(2)) and S(1) and S(0) );

		 -- L0 = (s3' s2' s0') + (s2 s0)
		 L(0) <= ( (not S(3)) and (not S(2)) and (not S(0)) )
					or ( S(2) and S(0) );
    END PROCESS;
END Behaviour;