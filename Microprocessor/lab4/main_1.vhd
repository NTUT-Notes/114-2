Library ieee;
Use ieee.std_logic_1164.all;
Use work.package_lab4.all;

Entity main_1 Is
	Port(
		a, b    : In  std_logic_vector (6 downto 0);
		ctrl    : In  std_logic_vector (3 downto 0);
		s, cout : Out std_logic
	);
End main_1;

Architecture Behavior of main_1 Is
	signal msbResult : std_logic;
	
Begin
	alu0: alu1bit port map (a(0), b(0), ctrl, ctrl(2), cout, s, msbResult, msbResult, open);
	
End Behavior;