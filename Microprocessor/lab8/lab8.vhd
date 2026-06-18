library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab8 is
    port(
        -- Data input: SW[7:0]
        Data     : in  STD_LOGIC_VECTOR(7 downto 0);
        -- Instruction code: SW[15:8]
        -- SW[11:8]  = opcode(3 downto 0)
        -- SW[13:12] = RS(1 downto 0)
        -- SW[15:14] = RT(1 downto 0)
        opcode   : in  STD_LOGIC_VECTOR(3 downto 0);
        RS       : in  STD_LOGIC_VECTOR(1 downto 0);
        RT       : in  STD_LOGIC_VECTOR(1 downto 0);
        -- Clock: KEY[0]
        Clock    : in  STD_LOGIC;
        -- Seven-segment displays for Bus (HEX1, HEX0)
        HEX0     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1     : out STD_LOGIC_VECTOR(6 downto 0);
        -- Seven-segment displays for Rs (HEX3, HEX2)
        HEX2     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3     : out STD_LOGIC_VECTOR(6 downto 0);
        -- Seven-segment displays for Rt (HEX5, HEX4)
        HEX4     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX5     : out STD_LOGIC_VECTOR(6 downto 0)
    );
end lab8;

architecture Behavioral of lab8 is

    -- Four 8-bit registers
    signal R0, R1, R2, R3 : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

    -- Values currently pointed to by RS and RT
    signal rs_val, rt_val : STD_LOGIC_VECTOR(7 downto 0);

    -- Seven-segment decoder function
    -- Converts a 4-bit hex value to 7-segment display (active low)
    function hex_to_7seg(hex : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case hex is
            when "0000" => return "1000000"; -- 0
            when "0001" => return "1111001"; -- 1
            when "0010" => return "0100100"; -- 2
            when "0011" => return "0110000"; -- 3
            when "0100" => return "0011001"; -- 4
            when "0101" => return "0010010"; -- 5
            when "0110" => return "0000010"; -- 6
            when "0111" => return "1111000"; -- 7
            when "1000" => return "0000000"; -- 8
            when "1001" => return "0010000"; -- 9
            when "1010" => return "0001000"; -- A
            when "1011" => return "0000011"; -- b
            when "1100" => return "1000110"; -- C
            when "1101" => return "0100001"; -- d
            when "1110" => return "0000110"; -- E
            when "1111" => return "0001110"; -- F
            when others => return "1111111"; -- blank
        end case;
    end function;

begin

    -- MUX: select register value based on RS
    process(RS, R0, R1, R2, R3)
    begin
        case RS is
            when "00"   => rs_val <= R0;
            when "01"   => rs_val <= R1;
            when "10"   => rs_val <= R2;
            when "11"   => rs_val <= R3;
            when others => rs_val <= "00000000";
        end case;
    end process;

    -- MUX: select register value based on RT
    process(RT, R0, R1, R2, R3)
    begin
        case RT is
            when "00"   => rt_val <= R0;
            when "01"   => rt_val <= R1;
            when "10"   => rt_val <= R2;
            when "11"   => rt_val <= R3;
            when others => rt_val <= "00000000";
        end case;
    end process;

    -- FSM / Instruction execution on clock edge
    -- KEY[0] is active low on DE2-115, so we use falling_edge
    process(Clock)
    begin
        if falling_edge(Clock) then
            case opcode is
                -- Load: Rs <- Data
                when "0000" =>
                    case RS is
                        when "00"   => R0 <= Data;
                        when "01"   => R1 <= Data;
                        when "10"   => R2 <= Data;
                        when "11"   => R3 <= Data;
                        when others => null;
                    end case;
                -- Move: Rs <- Rt
                when "0001" =>
                    case RS is
                        when "00"   => R0 <= rt_val;
                        when "01"   => R1 <= rt_val;
                        when "10"   => R2 <= rt_val;
                        when "11"   => R3 <= rt_val;
                        when others => null;
                    end case;
                when others =>
                    null;
            end case;
        end if;
    end process;

    -- Seven-segment display outputs
    -- Bus display (HEX1 = high nibble, HEX0 = low nibble)
    HEX0 <= hex_to_7seg(Data(3 downto 0));
    HEX1 <= hex_to_7seg(Data(7 downto 4));

    -- Rs display (HEX3 = high nibble, HEX2 = low nibble)
    HEX2 <= hex_to_7seg(rs_val(3 downto 0));
    HEX3 <= hex_to_7seg(rs_val(7 downto 4));

    -- Rt display (HEX5 = high nibble, HEX4 = low nibble)
    HEX4 <= hex_to_7seg(rt_val(3 downto 0));
    HEX5 <= hex_to_7seg(rt_val(7 downto 4));

end Behavioral;
