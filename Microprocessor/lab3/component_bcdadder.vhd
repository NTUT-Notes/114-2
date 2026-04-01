Library ieee;
Use ieee.std_logic_1164.all;

Use work.lab3_package.fulladder4;

Entity bcdadder Is
  Port(
		 cin  : In  std_logic;
       x, y : In  std_logic_vector (3 downto 0); 
       s    : Out std_logic_vector (3 downto 0); 
       cout : Out std_logic;
		 overflow : Out std_logic);
End bcdadder;

Architecture logicfunc Of bcdadder Is
  signal cout0 : std_logic;
  signal over9 : std_logic;
  
  signal s0, s1: std_logic_vector (3 downto 0); 

Begin
  stage0: fulladder4 port map(cin, x,  y,      s0, cout0);
  stage1: fulladder4 port map('0', s0, ('0' & over9 & over9 & '0'), s1, open );
  
  over9 <= cout0 or ( s0(3) and s0(2) ) or ( s0(3) and s0(1) );
  
  cout <= over9;
  s <= s1;
  
  overflow <= '0';

End logicfunc;