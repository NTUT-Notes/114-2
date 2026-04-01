Library ieee;
Use ieee.std_logic_1164.all;

Use work.lab3_package.fulladd;

Entity fulladder4 Is
  Port(
		 cin  : In  std_logic;
       x, y : In  std_logic_vector (3 downto 0); 
       s    : Out std_logic_vector (3 downto 0); 
       cout : Out std_logic;
		 overflow : Out std_logic);
End fulladder4;

Architecture logicfunc Of fulladder4 Is
  signal cout0, cout1, cout2, cout3 : std_logic;

Begin
  stage0: fulladd port map(cin,   x(0), y(0), s(0), cout0);
  stage1: fulladd port map(cout0, x(1), y(1), s(1), cout1);
  stage2: fulladd port map(cout1, x(2), y(2), s(2), cout2);
  stage3: fulladd port map(cout2, x(3), y(3), s(3), cout3);
  
  cout <= cout3;
  
  overflow <= cout3 xor cout2;

End logicfunc;