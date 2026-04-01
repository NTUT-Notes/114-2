Library ieee;
Use ieee.std_logic_1164.all;

Package lab2_package Is

  Component fulladd
    Port(cin, x, y :In  std_logic;
         s, cout   :Out std_logic
	);
  End Component;
  
  Component segment7
    Port (
      data_in : in std_logic_vector(3 downto 0);
      data_out : out std_logic_vector(6 downto 0)
    );
  End Component;
  
  Component fulladder8
    Port(
		cin  : In  std_logic;
      x, y : In  std_logic_vector (7 downto 0); 
      s    : Out std_logic_vector (7 downto 0); 
      cout : Out std_logic;
      overflow : Out std_logic
	 );
  End Component;
  
End lab2_package;