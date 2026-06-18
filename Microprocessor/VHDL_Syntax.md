# 同作指定敘述（Concurrent assignment statement ）
## 重點補充
- 超九補六 Adjust = Carry-out + z3z2 + z3z1

## Entity 語法
```vhdl
Entity fulladd Is
  Port(x, : In  std_logic;
       s, : Out std_logic);
End fulladd;
```

## Architecture 語法

```vhdl
Architecture logic Of fulladd Is

  signal sum : std_logic_vector (7 downto 0);

Begin

  adder: fulladder8 port map(...);

End logicfunc;
```

## For 生成語句
```vhdl
ALU: For i in 0 to 6 Generate

    lsb_alu: if i = 0 Generate

      alus: alu1bit_name port map (...);

    End Generate lsb_alu;

    alus: alu1bit port map (...);

End Generate;
```

## Packge 語法
```vhdl
Package lab3_package Is

  Component fulladd

    Port(x, : In  std_logic;

         s, :Out std_logic

    );

  End Component;

End lab3_package;
```

## With-Select 語法
```vhdl
With s(0) Select 

  f <= w(0) when '0',

  w(1) when Others;
```

## 常用套件庫
```vhdl
Library ieee;
Use ieee.std_logic_1164.All;
Use ieee.std_logic_unsigned.All;
```

## 共陽極七段顯示器
```vhdl
With s Select␍
  s0 <= "1000000" when "0000", -- 0␍
        "1111001" when "0001", -- 1␍
        "0100100" when "0010", -- 2␍
        "0110000" when "0011", -- 3␍
        "0011001" when "0100", -- 4␍
        "0010010" when "0101", -- 5␍
        "0000010" when "0110", -- 6␍
        "1111000" when "0111", -- 7␍
        "0000000" when "1000", -- 8␍
        "0010000" when "1001", -- 9␍
        "0001000" when "1010", -- A␍
        "0000011" when "1011", -- b␍
        "1000110" when "1100", -- C␍
        "0100001" when "1101", -- d␍
        "0000110" when "1110", -- E␍
        "0001110" when "1111", -- F␍
        "1111111" when others;␍
```

## When-Else 語法
```vhdl
S <= Z When x > 9 Else 
     Y When x > 10 Else 
     Z When x > 11 Else 
     ‘0’;

```

## Component 語法
```vhdl
Package lab3_package Is
 
  Component fulladd
    Port(cin, x, y :In  std_logic;
         s, cout   :Out std_logic
 );
  End Component;
 
End lab3_package;

```

# 循序指定敘述 (Process)
## Process 語法
```vhdl
Process(a, b, sel)
  begin
    if (sel = '0') then
      y <= a;
    elsif ( num > 10 ) then
      y <= 0;
    else
      y <= b;
    end if;
end Process;

```

## ALU 實作
```vhdl
Process(a, b, ctrl, sub) Begin
  Case ctrl Is
    When "0000" => 
      s <= a and b;
    When "0001" =>
      s <= a or b;
    When "0010" =>
      s <= a + b;
    When "0110" =>
      s <= a + (not b) + "0000001";
    When "0111" =>
      s <= "000000" & sub (6 downto 6);
    When "1100" =>
      s <= a nor b;
    When Others =>
      s <= "-------";
  End Case;
End Process;
```
