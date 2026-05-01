Library ieee;
Use ieee.std_logic_1164.All;
Use ieee.std_logic_signed.All;

Entity main Is 
  Port(
    a, b   : In  std_logic_vector (6 downto 0);
	 ctrl   : In  std_logic_vector (3 downto 0);
	 s0, s1 : Out std_logic_vector (6 downto 0);
	 cout   : Out std_logic
  );
End main;

Architecture logic Of main Is
	signal absVal : std_logic_vector (6 downto 0);
	signal sub : std_logic_vector (6 downto 0);
	signal s   : std_logic_vector (6 downto 0);
Begin

	sub <= a + (not b) + "0000001";
	
	Process(a, b, ctrl, sub) Begin
		Case ctrl Is
			When "0000" => 
				s <= a and b;
			When "0001" =>
				s <= a or b;
			When "0010" =>
				s <= a + b;
			When "0110" =>
				s <= a + (not b) + "0000001";
			When "0111" =>
				s <= "000000" & sub (6 downto 6);
			When "1100" =>
				s <= a nor b;
			When Others =>
				s <= "-------";
		End Case;
	End Process;	
	
	With s (3 downto 0) Select
		s0 <= "1000000" when "0000", -- 0
           "1111001" when "0001", -- 1
           "0100100" when "0010", -- 2
           "0110000" when "0011", -- 3
           "0011001" when "0100", -- 4
           "0010010" when "0101", -- 5
           "0000010" when "0110", -- 6
           "1111000" when "0111", -- 7
           "0000000" when "1000", -- 8
           "0010000" when "1001", -- 9
           "0001000" when "1010", -- A
           "0000011" when "1011", -- b (小寫，以區分 8)
           "1000110" when "1100", -- C
           "0100001" when "1101", -- d (小寫，以區分 0)
           "0000110" when "1110", -- E
           "0001110" when "1111", -- F
           "1111111" when others;
	
	With "0" & s (6 downto 4) Select
		s1 <= "1000000" when "0000", -- 0
           "1111001" when "0001", -- 1
           "0100100" when "0010", -- 2
           "0110000" when "0011", -- 3
           "0011001" when "0100", -- 4
           "0010010" when "0101", -- 5
           "0000010" when "0110", -- 6
           "1111000" when "0111", -- 7
           "0000000" when "1000", -- 8
           "0010000" when "1001", -- 9
           "0001000" when "1010", -- A
           "0000011" when "1011", -- b (小寫，以區分 8)
           "1000110" when "1100", -- C
           "0100001" when "1101", -- d (小寫，以區分 0)
           "0000110" when "1110", -- E
           "0001110" when "1111", -- F
           "1111111" when others;

End Architecture;