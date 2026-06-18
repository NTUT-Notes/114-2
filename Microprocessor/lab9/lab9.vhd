library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity for the top-level lab8 module
entity lab8 is
    port (
        CLOCK_50 : in  std_logic;
        SW       : in  std_logic_vector(15 downto 0);
        KEY      : in  std_logic_vector(0 downto 0);
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX2     : out std_logic_vector(6 downto 0);
        HEX3     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0)
    );
end entity lab8;

architecture arch of lab8 is
    -- Constants representing opcodes and states
    constant OP_LOAD : std_logic_vector(3 downto 0) := "0000";
    constant OP_MOVE : std_logic_vector(3 downto 0) := "0001";
	 constant OP_ADD : std_logic_vector(3 downto 0) := "0010";
	 constant OP_AND : std_logic_vector(3 downto 0) := "0011";
	 constant OP_A_SUB_B : std_logic_vector(3 downto 0) := "0011";
	 constant OP_B_SUB_A : std_logic_vector(3 downto 0) := "0011";
	 constant OP_SLT : std_logic_vector(3 downto 0) := "0011";
	 constant OP_DIV : std_logic_vector(3 downto 0) := "0011";

    constant ST_IDLE : std_logic := '0';
    constant ST_EXEC : std_logic := '1';

    -- Registers matching Verilog signals
    signal r0 : std_logic_vector(7 downto 0) := x"00";
    signal r1 : std_logic_vector(7 downto 0) := x"00";
    signal r2 : std_logic_vector(7 downto 0) := x"00";
    signal r3 : std_logic_vector(7 downto 0) := x"00";

    signal state : std_logic := ST_IDLE;

    -- Instruction parsing wires
    signal data_bus : std_logic_vector(7 downto 0);
    signal opcode   : std_logic_vector(3 downto 0);
    signal rs       : std_logic_vector(1 downto 0);
    signal rt       : std_logic_vector(1 downto 0);

    signal rs_value : std_logic_vector(7 downto 0);
    signal rt_value : std_logic_vector(7 downto 0);
    signal key_pressed_pulse : std_logic;
	 
	 signal sub_res  : std_logic_vector(7 downto 0);

    -- Sub-module component declarations
    component debounce_one_pulse is
        port (
            clk           : in  std_logic;
            key_n         : in  std_logic;
            pressed_pulse : out std_logic
        );
    end component;

    component hex7seg is
        port (
            hex : in  std_logic_vector(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    -- Instruction routing/decoding
    data_bus <= SW(7 downto 0);
    opcode   <= SW(11 downto 8);
    rs       <= SW(13 downto 12);
    rt       <= SW(15 downto 14);

    -- Key debounce instance
    key0_debounce : debounce_one_pulse
        port map (
            clk           => CLOCK_50,
            key_n         => KEY(0),
            pressed_pulse => key_pressed_pulse
        );

    -- Sequential process for state machine and register loading/moving
    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            case state is
                when ST_IDLE =>
                    if key_pressed_pulse = '1' then
                        state <= ST_EXEC;
                    end if;

                when ST_EXEC =>
                    case opcode is
                        when OP_LOAD =>
                            case rs is
                                when "00" => r0 <= data_bus;
                                when "01" => r1 <= data_bus;
                                when "10" => r2 <= data_bus;
                                when "11" => r3 <= data_bus;
                                when others => null;
                            end case;

                        when OP_MOVE =>
                            case rs is
                                when "00" => r0 <= rt_value;
                                when "01" => r1 <= rt_value;
                                when "10" => r2 <= rt_value;
                                when "11" => r3 <= rt_value;
                                when others => null;
                            end case;
									 
								when OP_ADD =>
									  case rs is 
									     when "00" => r0 <= rs_value + rt_value;
                                when "01" => r1 <= rs_value + rt_value;
                                when "10" => r2 <= rs_value + rt_value;
                                when "11" => r3 <= rs_value + rt_value;
                                when others => null;
                             end case;
									  
								when OP_AND =>
									  case rs is 
									     when "00" => r0 <= rs_value & rt_value;
                                when "01" => r1 <= rs_value & rt_value;
                                when "10" => r2 <= rs_value & rt_value;
                                when "11" => r3 <= rs_value & rt_value;
                                when others => null;
                             end case;

								when OP_A_SUB_B =>
									  case rs is 
									     when "00" => r0 <= rs_value - rt_value;
                                when "01" => r1 <= rs_value - rt_value;
                                when "10" => r2 <= rs_value - rt_value;
                                when "11" => r3 <= rs_value - rt_value;
                                when others => null;
                             end case;
									  
								when OP_B_SUB_A =>
									  case rs is 
									     when "00" => r0 <= rt_value - rs_value;
                                when "01" => r1 <= rt_value - rs_value;
                                when "10" => r2 <= rt_value - rs_value;
                                when "11" => r3 <= rt_value - rs_value;
                                when others => null;
                             end case;

								when OP_SLT =>
								     sub_res <= std_logic_vector(signed(rs_value) - signed(rt_value));
									  sign <= sub_res(31);
									  
									  less <= sign xor overflow;
									  Result <= (0 => less, others => '0');
									  case rs is 
									     when "00" => r0 <= sub_res <= std_logic_vector(signed(A) - signed(B));;
                                when "01" => r1 <= rt_value - rs_value;
                                when "10" => r2 <= rt_value - rs_value;
                                when "11" => r3 <= rt_value - rs_value;
                                when others => null;
                             end case;
									  
                        when others =>
                            null;
                    end case;
                    state <= ST_IDLE;

                when others =>
                    state <= ST_IDLE;
            end case;
        end if;
    end process;

    -- Combinational process for rs_value and rt_value multiplexers
    process(rs, rt, r0, r1, r2, r3)
    begin
        case rs is
            when "00" => rs_value <= r0;
            when "01" => rs_value <= r1;
            when "10" => rs_value <= r2;
            when "11" => rs_value <= r3;
            when others => rs_value <= (others => '0');
        end case;

        case rt is
            when "00" => rt_value <= r0;
            when "01" => rt_value <= r1;
            when "10" => rt_value <= r2;
            when "11" => rt_value <= r3;
            when others => rt_value <= (others => '0');
        end case;
    end process;

    -- 7-segment display instantiations
    bus_low_digit : hex7seg
        port map (
            hex => data_bus(3 downto 0),
            seg => HEX0
        );

    bus_high_digit : hex7seg
        port map (
            hex => data_bus(7 downto 4),
            seg => HEX1
        );

    rs_low_digit : hex7seg
        port map (
            hex => rs_value(3 downto 0),
            seg => HEX2
        );

    rs_high_digit : hex7seg
        port map (
            hex => rs_value(7 downto 4),
            seg => HEX3
        );

    rt_low_digit : hex7seg
        port map (
            hex => rt_value(3 downto 0),
            seg => HEX4
        );

    rt_high_digit : hex7seg
        port map (
            hex => rt_value(7 downto 4),
            seg => HEX5
        );

end architecture arch;


--------------------------------------------------------------------------------
-- Debounce and One-Pulse generator
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debounce_one_pulse is
    port (
        clk           : in  std_logic;
        key_n         : in  std_logic;
        pressed_pulse : out std_logic
    );
end entity debounce_one_pulse;

architecture arch of debounce_one_pulse is
    constant DEBOUNCE_MAX : unsigned(19 downto 0) := to_unsigned(999999, 20);

    signal key_sync_0        : std_logic := '1';
    signal key_sync_1        : std_logic := '1';
    signal stable_key_n      : std_logic := '1';
    signal prev_stable_key_n : std_logic := '1';
    signal debounce_count    : unsigned(19 downto 0) := (others => '0');
    signal pressed_pulse_reg : std_logic := '0';
begin
    pressed_pulse <= pressed_pulse_reg;

    process(clk)
    begin
        if rising_edge(clk) then
            key_sync_0 <= key_n;
            key_sync_1 <= key_sync_0;
            pressed_pulse_reg <= '0';

            if key_sync_1 = stable_key_n then
                debounce_count <= (others => '0');
            elsif debounce_count = DEBOUNCE_MAX then
                stable_key_n <= key_sync_1;
                debounce_count <= (others => '0');
            else
                debounce_count <= debounce_count + 1;
            end if;

            prev_stable_key_n <= stable_key_n;
            if prev_stable_key_n = '1' and stable_key_n = '0' then
                pressed_pulse_reg <= '1';
            end if;
        end if;
    end process;
end architecture arch;


--------------------------------------------------------------------------------
-- 7-segment display decoder (hex to 7-segment active-low)
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex7seg is
    port (
        hex : in  std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0)
    );
end entity hex7seg;

architecture arch of hex7seg is
begin
    process(hex)
    begin
        case hex is
            when x"0" => seg <= "1000000";
            when x"1" => seg <= "1111001";
            when x"2" => seg <= "0100100";
            when x"3" => seg <= "0110000";
            when x"4" => seg <= "0011001";
            when x"5" => seg <= "0010010";
            when x"6" => seg <= "0000010";
            when x"7" => seg <= "1111000";
            when x"8" => seg <= "0000000";
            when x"9" => seg <= "0010000";
            when x"a" => seg <= "0001000";
            when x"b" => seg <= "0000011";
            when x"c" => seg <= "1000110";
            when x"d" => seg <= "0100001";
            when x"e" => seg <= "0000110";
            when x"f" => seg <= "0001110";
            when others => seg <= "1111111";
        end case;
    end process;
end architecture arch;
