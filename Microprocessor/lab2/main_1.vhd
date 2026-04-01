Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.lab2_package.all;

Entity main_1 Is
  Port(
    x, y   : In  std_logic_vector (7 downto 0); 
    s0, s1 : Out std_logic_vector (6 downto 0); 
    overflow : Out std_logic
  );
End main_1;

Architecture logicfunc Of main_1 Is
  signal sum       : std_logic_vector (7 downto 0);
  signal cout : std_logic;

Begin
  adder: fulladder8 port map('0', x, y, sum, cout, open);

  seg1: segment7 port map(sum (7 downto 4), s1);
  seg0: segment7 port map(sum (3 downto 0), s0);
  
  overflow <= cout;
  

End logicfunc;