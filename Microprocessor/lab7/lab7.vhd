LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab7 IS
    PORT (
        Reset  : IN  STD_LOGIC;
        Clock  : IN  STD_LOGIC;
        Divisor, Dividend : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  Quotient OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		  Remainder : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END lab7;

ARCHITECTURE behavior OF lab7 IS
    TYPE State_type IS (Start, S1, S2a, S2b, S3, S4);
    SIGNAL current_state : State_type;
    SIGNAL next_state    : State_type;
	 SIGNAL w;
	 
	 signal RemainderTMP STD_LOGIC_VECTOR(15 DOWNTO 0);
	 
BEGIN
    w <= 
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '1' THEN
            current_state <= Start;
        ELSIF rising_edge(Clock) THEN
            current_state <= next_state;
        END IF;
    END PROCESS;

    PROCESS (current_state, w)
    BEGIN
        CASE current_state IS
            WHEN Start =>
                IF w = '1' THEN
                    next_state <= S1;
                ELSE
                    next_state <= Start;
                END IF;

            WHEN S1 =>
                IF w = '0' THEN
                    next_state <= S2a;
                ELSE
                    next_state <= S2b;
                END IF;

            WHEN S2a =>
                next_state <= S3;

            WHEN S2b =>
                next_state <= S3;

            WHEN S3 =>
                IF w = '1' THEN
                    next_state <= S4;
                ELSE
                    next_state <= S1;
                END IF;

            WHEN S4 =>
                next_state <= S4;
        END CASE;
    END PROCESS;

    PROCESS (current_state)
    BEGIN
	     IF rising_edge(Clock) THEN
		      CASE current_state IS
					WHEN Start =>
						 RemainderTMP <= "0000000" & Dividend & "0";

					WHEN S1 =>
						 RemainderTMP <= RemainderTMP - Divisor;

					WHEN S2a =>
						 next_state <= S3;

					WHEN S2b =>
						 next_state <= S3;

					WHEN S3 =>
						 IF w = '1' THEN
							  next_state <= S4;
						 ELSE
							  next_state <= S1;
						 END IF;

					WHEN S4 =>
						 next_state <= S4;
			  END CASE;
		  END IF;
    END PROCESS;
	 
	 
END behavior;