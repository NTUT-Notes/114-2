Library ieee;
Use ieee.std_logic_1164.all;
Use work.package_lab4.all;

Entity mux4to1 Is 
	Port(
		w : In  std_logic_vector (3 downto 0);
      s : In  std_logic_vector (1 downto 0);
	   f : Out std_logic
	);
End mux4to1;
	
Architecture Behavior Of mux4to1 Is 
	signal f0, f1 : std_logic;
	
Begin
	m0: mux2to1 port map (w (1 downto 0), s (0 downto 0), f0);
	m1: mux2to1 port map (w (3 downto 2), s (0 downto 0), f1);
	m2: mux2to1 port map ((f1 & f0),      s (1 downto 1), f);

End Behavior;