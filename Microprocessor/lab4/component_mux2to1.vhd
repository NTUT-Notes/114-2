Library ieee;
Use ieee.std_logic_1164.all;

Entity mux2to1 Is
  Port(
    w : In  std_logic_vector (1 downto 0);
    s : In  std_logic_vector (0 downto 0);
	 f : Out std_logic
  );
End mux2to1;

Architecture Behavior Of mux2to1 Is 
Begin
	With s(0) Select 
		f <= w(0) when '0', w(1) when Others;
End Behavior;