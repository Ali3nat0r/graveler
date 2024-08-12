library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cu is
    generic(
        seed            : std_logic_vector(31 downto 0) := x"12345678";
        rolls_per_round : std_logic_vector(7 downto 0) := x"07";
        rounds_to_run   : std_logic_vector(31 downto 0) := x"00000007"
    );

    port(
        clkin     : in std_logic := '0';

        count_out : out std_logic_vector(7 downto 0) := x"00";
        valid     : out std_logic := '0'
    );
end;

architecture bhv of cu is
    type t_state is (INIT0, INIT1, MAIN0, MAIN1, MAIN2, ENDLOOP);
    shared variable state : t_state := INIT0;
    shared variable rng_state : std_logic_vector(31 downto 0);
    shared variable x : std_logic_vector(31 downto 0) := x"00000000";
    shared variable count : std_logic_vector(7 downto 0) := x"00";
    shared variable max : std_logic_vector(7 downto 0) := x"00";
    shared variable loop_a : std_logic_vector(7 downto 0) := x"00";
    shared variable loop_b : std_logic_vector(31 downto 0) := x"00000000";
begin
    process(clkin) is
    begin
        if rising_edge(clkin) then
            case state is
                -- Initialise rng state from seed
                when INIT0 =>
                    rng_state := seed;
                    x := seed;

                    state := MAIN0;
                
                -- Main loop
                when MAIN0 =>
                    x := x xor std_logic_vector(shift_left(unsigned(rng_state), 13));

                    state := MAIN1;
                when MAIN1 =>
                    x := x xor std_logic_vector(shift_right(unsigned(x), 17));

                    state := MAIN2;
                when MAIN2 =>
                    x := x xor std_logic_vector(shift_left(unsigned(x), 5));
                    rng_state := x;

                    if x(31 downto 30) = "00" then
                        count := count + 1;
                    end if;

                    if loop_a = rolls_per_round then
                        if count > max then
                            max := count;
                        end if;

                        loop_a := x"00";
                        if loop_b = rounds_to_run then
                            count_out <= max;
                            valid <= '1';
                            state := ENDLOOP;
                        else
                            loop_b := loop_b + 1;
                            state := MAIN0;
                        end if;
                        count := x"00";
                    else
                        loop_a := loop_a + 1;
                        state := MAIN0;
                    end if;
                when others =>
            end case;
        end if;
    end process;
end;