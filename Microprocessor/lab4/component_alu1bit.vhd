Library ieee;
Use ieee.std_logic_1164.all;
Use work.package_lab4.all;

Entity alu1bit Is
	Port(
		a, b      : In  std_logic;
		ctrl         : In  std_logic_vector (3 downto 0);
		cin       : In  std_logic;
		cout      : Out std_logic;
		result    : Out std_logic;
		adderRes  : Out std_logic;
		setLt     : In  std_logic;
		overflow  : Out std_logic
	);
End alu1bit;

Architecture Behavior Of alu1bit Is 
	signal aNeg, bNeg : std_logic;
	signal andResult, orResult, addResult : std_logic;
	signal coutAlu    : std_logic;
Begin
	aInvert: mux2to1 port map ( ((not a) & a), ctrl (3 downto 3), aNeg);
	bInvert: mux2to1 port map ( ((not b) & b), ctrl (2 downto 2), bNeg);
	
	andResult <= aNeg and bNeg;
	orResult  <= aNeg or  bNeg;
	adder: fulladd port map (cin, aNeg, bNeg, addResult, coutAlu);
	
	cout <= coutAlu and ctrl(1) and (not ctrl(0));
	
	adderRes <= addResult;
	
	finalSel: mux4to1 port map ( (setLt & addResult & orResult & andResult), ctrl (1 downto 0), result);
	
	overflow <= cin xor coutAlu;
End Behavior;