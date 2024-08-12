library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
    port(
        clkin : in std_logic := '0';

        out0  : out std_logic_vector(7 downto 0) := x"ff";
        out1  : out std_logic_vector(7 downto 0) := x"ff";
        out2  : out std_logic_vector(7 downto 0) := x"ff"
    );
end;

architecture bhv of top is
    signal clk_wire : std_logic;
    signal count_wire : std_logic_vector(7 downto 0);
begin
    pll : entity work.pll(SYN)
        port map(inclk0 => clkin, c0 => clk_wire);
    run : entity work.run(bhv)
        port map(clkin => clk_wire, count_out => count_wire);
    bin27seg : entity work.bin27seg(bhv)
        port map(input => count_wire, out0 => out0, out1 => out1, out2 => out2);
end;