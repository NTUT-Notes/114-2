Library ieee;
Use ieee.std_logic_1164.all;
Use work.package_lab4.all;

Entity alu7bit Is
	Port(
		a, b      : In  std_logic_vector (6 downto 0);
		ctrl      : In  std_logic_vector (3 downto 0);
		cin       : In  std_logic;
		cout      : Out std_logic;
		result    : Out std_logic_vector (6 downto 0);
		overflow  : Out std_logic
	);
End alu7bit;

Architecture Behavior of alu7bit Is
	signal msbResult : std_logic;
	signal carry : std_logic_vector ( 7 downto 0 );

Begin	
	ALU: For i in 0 to 6 Generate
		lsb_alu: if i = 0 Generate
			alus: alu1bit port map (a(i), b(i), ctrl, ctrl(2), carry(0), result(i), open, msbResult, open);
		End Generate lsb_alu;
		
		msb_alu: if i = 6 Generate
			alus: alu1bit port map (a(i), b(i), ctrl, carry(5), carry(6), result(i), msbResult, '0', overflow);
		End Generate msb_alu;
		
		middle_alu: if (i > 0) and (i < 6) Generate
			alus: alu1bit port map (a(i), b(i), ctrl, carry(i-1), carry(i), result(i), open, '0', open);
		End Generate middle_alu;
		
	End Generate;
	
	cout <= carry(6);

End Behavior;