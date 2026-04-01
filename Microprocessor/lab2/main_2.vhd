Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.lab2_package.all;

-- overflow pin here refer to the negative indicator

Entity main_2 Is
  Port(
    x, y   : In  std_logic_vector (7 downto 0); 
    s0, s1 : Out std_logic_vector (6 downto 0); 
    negative : Out std_logic
  );
End main_2;

Architecture logicfunc Of main_2 Is
  signal ogn_sum   : std_logic_vector (7 downto 0);
  signal sub_sum   : std_logic_vector (7 downto 0);
  signal abs_sum   : std_logic_vector (7 downto 0);

  signal cout : std_logic;

Begin
  adder: fulladder8 port map('1', x, not y, ogn_sum, cout, open);
  sub_one: fulladder8 port map('1', ogn_sum, not "00000001", sub_sum, open, open);

  abs_sum <= ( ( not (cout & cout & cout & cout & cout & cout & cout & cout) ) and (not sub_sum) ) or ( ( (cout & cout & cout & cout & cout & cout & cout & cout)) and ogn_sum );

  seg0: segment7 port map(abs_sum (7 downto 4), s1);
  seg1: segment7 port map(abs_sum (3 downto 0), s0);
  
  negative <= cout;

End logicfunc;
