Library ieee;
Use ieee.std_logic_1164.all;

Entity fulladd Is
  Port(cin, x, y :In  std_logic;
		 s, cout   :Out std_logic
  );
End fulladd;

Architecture logicfunc Of fulladd Is

Begin
  s    <= x xor y xor cin;
  cout <= (x and y) or (cin and x) or (cin and y);
End logicfunc;