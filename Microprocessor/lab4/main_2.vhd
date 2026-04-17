Library ieee;
Use ieee.std_logic_1164.all;
Use work.package_lab4.all;

Entity main_2 Is
	Port(
		a, b    : In  std_logic_vector (6 downto 0);
		ctrl    : In  std_logic_vector (3 downto 0);
		s0, s1  : Out  std_logic_vector (6 downto 0);
		cout    : Out std_logic;
		overflow: Out std_logic;
		negative : Out std_logic
	);
End main_2;

Architecture Behavior of main_2 Is
	signal segIn : std_logic_vector ( 7 downto 0 );
	signal segOut: std_logic_vector ( 13 downto 0 );
	
	signal result : std_logic_vector( 6 downto 0);
	signal subone : std_logic_vector( 6 downto 0);
	signal abs_sum : std_logic_vector( 6 downto 0);

Begin	
	alu: alu7bit port map (a, b, ctrl, '0', cout, result, overflow);
	
	sub1: alu7bit port map (result, "0000001", "0110", '0', open, subone, open);
	
	with result(6) select
		abs_sum <= not subone when '1',
					result when Others;
	
	negative <= not result(6);
	segIn <= '0' & abs_sum;
	
	SEG: For i in 0 to 1 Generate
		segs: segment7 port map (
			segIn ( (i+1)*4-1 downto i*4 ),
			segOut ( (i+1)*7-1 downto i*7 )
		);
	End Generate;
	
	s0 <= segOut (6 downto 0);
	s1 <= segOut (13 downto 7);
	
End Behavior;