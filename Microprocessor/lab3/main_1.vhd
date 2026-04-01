Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.lab3_package.all;

Entity main_1 Is
  Port(
    x, y   : In  std_logic_vector (7 downto 0); 
    s0, s1 : Out std_logic_vector (6 downto 0)
  );
End main_1;

Architecture logicfunc Of main_1 Is
  signal sum  : std_logic_vector (7 downto 0);
  signal cout : std_logic;

Begin
  bcd0: bcdadder port map('0' , x (3 downto 0), y (3 downto 0), sum(3 downto 0), cout, open);
  bcd1: bcdadder port map(cout, x (7 downto 4), y (7 downto 4), sum(7 downto 4), open, open);
  
  seg0: segment7 port map(sum (3 downto 0), s0);
  seg1: segment7 port map(sum (7 downto 4), s1);
  
End logicfunc;