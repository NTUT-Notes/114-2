Library ieee;
Use ieee.std_logic_1164.all;

Use work.lab2_package.fulladd;

Entity fulladder8 Is
  Port(
		 cin  : In  std_logic;
       x, y : In  std_logic_vector (7 downto 0); 
       s    : Out std_logic_vector (7 downto 0); 
       cout : Out std_logic;
		 overflow : Out std_logic);
End fulladder8;

Architecture logicfunc Of fulladder8 Is
  signal cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7 : std_logic;

Begin
  stage0: fulladd port map(cin,   x(0), y(0), s(0), cout0);
  stage1: fulladd port map(cout0, x(1), y(1), s(1), cout1);
  stage2: fulladd port map(cout1, x(2), y(2), s(2), cout2);
  stage3: fulladd port map(cout2, x(3), y(3), s(3), cout3);
  stage4: fulladd port map(cout3, x(4), y(4), s(4), cout4);
  stage5: fulladd port map(cout4, x(5), y(5), s(5), cout5);
  stage6: fulladd port map(cout5, x(6), y(6), s(6), cout6);
  stage7: fulladd port map(cout6, x(7), y(7), s(7), cout7);
  
  cout <= cout7;
  
  overflow <= cout7 xor cout6;

End logicfunc;