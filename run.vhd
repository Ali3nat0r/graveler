library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity run is
    port(
        clkin     : in std_logic := '0';

        count_out : out std_logic_vector(7 downto 0) := x"00";
        valid_out : out std_logic := '0'
    );
end;

architecture bhv of run is
    constant rolls_per_round : std_logic_vector(7 downto 0) := x"e7";        --       e7h = 231 rolls per round
    constant rounds_to_run   : std_logic_vector(31 downto 0) := x"002FAF08"; -- 2FAF08h = 3,125,000 rounds to run
    constant instances       : integer := 320;

    type t_cu_counts is array (0 to instances - 1) of std_logic_vector(7 downto 0);
    shared variable cu_counts : t_cu_counts;
    shared variable valid : std_logic := '0';
    shared variable count : integer := 0;
    shared variable max : std_logic_vector(7 downto 0) := x"00";

    type t_state is (WAITING, COUNTING, ENDLOOP);
    shared variable state : t_state := WAITING;

begin
CU0 : entity work.cu(bhv)
    generic map(seed => x"27df72b9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(0), valid => valid);

CU1 : entity work.cu(bhv)
    generic map(seed => x"2c40e016", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(1));

CU2 : entity work.cu(bhv)
    generic map(seed => x"3c63e93d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(2));

CU3 : entity work.cu(bhv)
    generic map(seed => x"4fd05feb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(3));

CU4 : entity work.cu(bhv)
    generic map(seed => x"344f13de", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(4));

CU5 : entity work.cu(bhv)
    generic map(seed => x"74bdfb94", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(5));

CU6 : entity work.cu(bhv)
    generic map(seed => x"4d18bdb2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(6));

CU7 : entity work.cu(bhv)
    generic map(seed => x"0a404a33", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(7));

CU8 : entity work.cu(bhv)
    generic map(seed => x"777a23a7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(8));

CU9 : entity work.cu(bhv)
    generic map(seed => x"74137906", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(9));

CU10 : entity work.cu(bhv)
    generic map(seed => x"0510ea0e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(10));

CU11 : entity work.cu(bhv)
    generic map(seed => x"615f9443", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(11));

CU12 : entity work.cu(bhv)
    generic map(seed => x"6b9b1ab1", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(12));

CU13 : entity work.cu(bhv)
    generic map(seed => x"0bee95a2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(13));

CU14 : entity work.cu(bhv)
    generic map(seed => x"06a44925", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(14));

CU15 : entity work.cu(bhv)
    generic map(seed => x"10ec9971", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(15));

CU16 : entity work.cu(bhv)
    generic map(seed => x"73975f96", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(16));

CU17 : entity work.cu(bhv)
    generic map(seed => x"61496023", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(17));

CU18 : entity work.cu(bhv)
    generic map(seed => x"23a45940", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(18));

CU19 : entity work.cu(bhv)
    generic map(seed => x"069f2417", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(19));

CU20 : entity work.cu(bhv)
    generic map(seed => x"1ecc9b5c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(20));

CU21 : entity work.cu(bhv)
    generic map(seed => x"141d07d8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(21));

CU22 : entity work.cu(bhv)
    generic map(seed => x"1133ce8b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(22));

CU23 : entity work.cu(bhv)
    generic map(seed => x"0115ee97", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(23));

CU24 : entity work.cu(bhv)
    generic map(seed => x"4e819fc9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(24));

CU25 : entity work.cu(bhv)
    generic map(seed => x"5689c266", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(25));

CU26 : entity work.cu(bhv)
    generic map(seed => x"14b74c2b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(26));

CU27 : entity work.cu(bhv)
    generic map(seed => x"5d4b8d9d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(27));

CU28 : entity work.cu(bhv)
    generic map(seed => x"2b70332e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(28));

CU29 : entity work.cu(bhv)
    generic map(seed => x"715e9d01", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(29));

CU30 : entity work.cu(bhv)
    generic map(seed => x"180fe8a7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(30));

CU31 : entity work.cu(bhv)
    generic map(seed => x"368470a6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(31));

CU32 : entity work.cu(bhv)
    generic map(seed => x"558b1b4f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(32));

CU33 : entity work.cu(bhv)
    generic map(seed => x"2feef4da", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(33));

CU34 : entity work.cu(bhv)
    generic map(seed => x"1b7257a4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(34));

CU35 : entity work.cu(bhv)
    generic map(seed => x"566faa51", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(35));

CU36 : entity work.cu(bhv)
    generic map(seed => x"064e87f8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(36));

CU37 : entity work.cu(bhv)
    generic map(seed => x"1b06b648", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(37));

CU38 : entity work.cu(bhv)
    generic map(seed => x"65ef762f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(38));

CU39 : entity work.cu(bhv)
    generic map(seed => x"39d73527", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(39));

CU40 : entity work.cu(bhv)
    generic map(seed => x"175b2d6f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(40));

CU41 : entity work.cu(bhv)
    generic map(seed => x"75a6d167", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(41));

CU42 : entity work.cu(bhv)
    generic map(seed => x"3ad5a1b8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(42));

CU43 : entity work.cu(bhv)
    generic map(seed => x"13c9f356", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(43));

CU44 : entity work.cu(bhv)
    generic map(seed => x"74732e05", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(44));

CU45 : entity work.cu(bhv)
    generic map(seed => x"5370a0fc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(45));

CU46 : entity work.cu(bhv)
    generic map(seed => x"2724bca8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(46));

CU47 : entity work.cu(bhv)
    generic map(seed => x"7e1ecb3e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(47));

CU48 : entity work.cu(bhv)
    generic map(seed => x"57666273", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(48));

CU49 : entity work.cu(bhv)
    generic map(seed => x"3692f596", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(49));

CU50 : entity work.cu(bhv)
    generic map(seed => x"3c3feb62", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(50));

CU51 : entity work.cu(bhv)
    generic map(seed => x"2dfeeb53", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(51));

CU52 : entity work.cu(bhv)
    generic map(seed => x"4915684d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(52));

CU53 : entity work.cu(bhv)
    generic map(seed => x"6817bea9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(53));

CU54 : entity work.cu(bhv)
    generic map(seed => x"36684875", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(54));

CU55 : entity work.cu(bhv)
    generic map(seed => x"5739fa3a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(55));

CU56 : entity work.cu(bhv)
    generic map(seed => x"381f8068", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(56));

CU57 : entity work.cu(bhv)
    generic map(seed => x"7ccd39fc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(57));

CU58 : entity work.cu(bhv)
    generic map(seed => x"43e8d03d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(58));

CU59 : entity work.cu(bhv)
    generic map(seed => x"4ed012f3", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(59));

CU60 : entity work.cu(bhv)
    generic map(seed => x"5641f178", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(60));

CU61 : entity work.cu(bhv)
    generic map(seed => x"43f18aa9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(61));

CU62 : entity work.cu(bhv)
    generic map(seed => x"64fea3b5", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(62));

CU63 : entity work.cu(bhv)
    generic map(seed => x"4b5e02b2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(63));

CU64 : entity work.cu(bhv)
    generic map(seed => x"7d24e6f7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(64));

CU65 : entity work.cu(bhv)
    generic map(seed => x"668af7d2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(65));

CU66 : entity work.cu(bhv)
    generic map(seed => x"7f58f40a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(66));

CU67 : entity work.cu(bhv)
    generic map(seed => x"2fafe3be", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(67));

CU68 : entity work.cu(bhv)
    generic map(seed => x"08c27f5b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(68));

CU69 : entity work.cu(bhv)
    generic map(seed => x"5b7a088a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(69));

CU70 : entity work.cu(bhv)
    generic map(seed => x"60db894b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(70));

CU71 : entity work.cu(bhv)
    generic map(seed => x"3e6b3c60", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(71));

CU72 : entity work.cu(bhv)
    generic map(seed => x"302b4bff", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(72));

CU73 : entity work.cu(bhv)
    generic map(seed => x"47bfbc8a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(73));

CU74 : entity work.cu(bhv)
    generic map(seed => x"596f23d8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(74));

CU75 : entity work.cu(bhv)
    generic map(seed => x"42d138d0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(75));

CU76 : entity work.cu(bhv)
    generic map(seed => x"0728abb7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(76));

CU77 : entity work.cu(bhv)
    generic map(seed => x"4d23fdff", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(77));

CU78 : entity work.cu(bhv)
    generic map(seed => x"3652721f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(78));

CU79 : entity work.cu(bhv)
    generic map(seed => x"1e69b678", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(79));

CU80 : entity work.cu(bhv)
    generic map(seed => x"18180ca2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(80));

CU81 : entity work.cu(bhv)
    generic map(seed => x"5e28a808", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(81));

CU82 : entity work.cu(bhv)
    generic map(seed => x"7d57890f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(82));

CU83 : entity work.cu(bhv)
    generic map(seed => x"7622a36d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(83));

CU84 : entity work.cu(bhv)
    generic map(seed => x"26e3d0c9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(84));

CU85 : entity work.cu(bhv)
    generic map(seed => x"6453f927", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(85));

CU86 : entity work.cu(bhv)
    generic map(seed => x"62e39197", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(86));

CU87 : entity work.cu(bhv)
    generic map(seed => x"412c4db0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(87));

CU88 : entity work.cu(bhv)
    generic map(seed => x"7ac65210", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(88));

CU89 : entity work.cu(bhv)
    generic map(seed => x"20646e98", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(89));

CU90 : entity work.cu(bhv)
    generic map(seed => x"1399b015", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(90));

CU91 : entity work.cu(bhv)
    generic map(seed => x"7712de99", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(91));

CU92 : entity work.cu(bhv)
    generic map(seed => x"73760261", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(92));

CU93 : entity work.cu(bhv)
    generic map(seed => x"03df1957", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(93));

CU94 : entity work.cu(bhv)
    generic map(seed => x"445778e4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(94));

CU95 : entity work.cu(bhv)
    generic map(seed => x"55e5fb66", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(95));

CU96 : entity work.cu(bhv)
    generic map(seed => x"4ec5936d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(96));

CU97 : entity work.cu(bhv)
    generic map(seed => x"272ac9c9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(97));

CU98 : entity work.cu(bhv)
    generic map(seed => x"7c9abd6b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(98));

CU99 : entity work.cu(bhv)
    generic map(seed => x"553dfd42", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(99));

CU100 : entity work.cu(bhv)
    generic map(seed => x"5785c80c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(100));

CU101 : entity work.cu(bhv)
    generic map(seed => x"0c9a3089", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(101));

CU102 : entity work.cu(bhv)
    generic map(seed => x"2ec61608", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(102));

CU103 : entity work.cu(bhv)
    generic map(seed => x"63e40638", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(103));

CU104 : entity work.cu(bhv)
    generic map(seed => x"7e4ffcff", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(104));

CU105 : entity work.cu(bhv)
    generic map(seed => x"151c8b34", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(105));

CU106 : entity work.cu(bhv)
    generic map(seed => x"6ed372e1", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(106));

CU107 : entity work.cu(bhv)
    generic map(seed => x"5908a9a7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(107));

CU108 : entity work.cu(bhv)
    generic map(seed => x"6c748e24", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(108));

CU109 : entity work.cu(bhv)
    generic map(seed => x"01f75f3e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(109));

CU110 : entity work.cu(bhv)
    generic map(seed => x"758ea664", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(110));

CU111 : entity work.cu(bhv)
    generic map(seed => x"58b22c3c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(111));

CU112 : entity work.cu(bhv)
    generic map(seed => x"04a50a2b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(112));

CU113 : entity work.cu(bhv)
    generic map(seed => x"45c65170", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(113));

CU114 : entity work.cu(bhv)
    generic map(seed => x"73ce62d8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(114));

CU115 : entity work.cu(bhv)
    generic map(seed => x"135983f5", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(115));

CU116 : entity work.cu(bhv)
    generic map(seed => x"58708777", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(116));

CU117 : entity work.cu(bhv)
    generic map(seed => x"2b1ed947", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(117));

CU118 : entity work.cu(bhv)
    generic map(seed => x"6d0d92a3", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(118));

CU119 : entity work.cu(bhv)
    generic map(seed => x"51f15f6c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(119));

CU120 : entity work.cu(bhv)
    generic map(seed => x"7c238cd6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(120));

CU121 : entity work.cu(bhv)
    generic map(seed => x"5c9b3210", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(121));

CU122 : entity work.cu(bhv)
    generic map(seed => x"4be0d9fb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(122));

CU123 : entity work.cu(bhv)
    generic map(seed => x"12eff928", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(123));

CU124 : entity work.cu(bhv)
    generic map(seed => x"2be9da6d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(124));

CU125 : entity work.cu(bhv)
    generic map(seed => x"4d2f7b87", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(125));

CU126 : entity work.cu(bhv)
    generic map(seed => x"5c9bf109", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(126));

CU127 : entity work.cu(bhv)
    generic map(seed => x"19cc47c9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(127));

CU128 : entity work.cu(bhv)
    generic map(seed => x"3fa01d2d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(128));

CU129 : entity work.cu(bhv)
    generic map(seed => x"4b4978d0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(129));

CU130 : entity work.cu(bhv)
    generic map(seed => x"1f416f9b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(130));

CU131 : entity work.cu(bhv)
    generic map(seed => x"021818d1", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(131));

CU132 : entity work.cu(bhv)
    generic map(seed => x"6c41f92a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(132));

CU133 : entity work.cu(bhv)
    generic map(seed => x"5c7aca36", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(133));

CU134 : entity work.cu(bhv)
    generic map(seed => x"5b4fe67b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(134));

CU135 : entity work.cu(bhv)
    generic map(seed => x"71a8c673", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(135));

CU136 : entity work.cu(bhv)
    generic map(seed => x"44028f7c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(136));

CU137 : entity work.cu(bhv)
    generic map(seed => x"3e9bcaa2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(137));

CU138 : entity work.cu(bhv)
    generic map(seed => x"0feaf13d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(138));

CU139 : entity work.cu(bhv)
    generic map(seed => x"12561fc7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(139));

CU140 : entity work.cu(bhv)
    generic map(seed => x"1bff63ee", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(140));

CU141 : entity work.cu(bhv)
    generic map(seed => x"7d97a49e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(141));

CU142 : entity work.cu(bhv)
    generic map(seed => x"07d2d2e6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(142));

CU143 : entity work.cu(bhv)
    generic map(seed => x"005b06d5", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(143));

CU144 : entity work.cu(bhv)
    generic map(seed => x"43d2fa0d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(144));

CU145 : entity work.cu(bhv)
    generic map(seed => x"13b5a42f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(145));

CU146 : entity work.cu(bhv)
    generic map(seed => x"343d0521", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(146));

CU147 : entity work.cu(bhv)
    generic map(seed => x"05a98664", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(147));

CU148 : entity work.cu(bhv)
    generic map(seed => x"5a808cbe", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(148));

CU149 : entity work.cu(bhv)
    generic map(seed => x"4645caa7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(149));

CU150 : entity work.cu(bhv)
    generic map(seed => x"6b1fad9e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(150));

CU151 : entity work.cu(bhv)
    generic map(seed => x"6789d43c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(151));

CU152 : entity work.cu(bhv)
    generic map(seed => x"45aa30bb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(152));

CU153 : entity work.cu(bhv)
    generic map(seed => x"503bae09", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(153));

CU154 : entity work.cu(bhv)
    generic map(seed => x"7949955a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(154));

CU155 : entity work.cu(bhv)
    generic map(seed => x"079c0205", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(155));

CU156 : entity work.cu(bhv)
    generic map(seed => x"390d80d0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(156));

CU157 : entity work.cu(bhv)
    generic map(seed => x"03946633", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(157));

CU158 : entity work.cu(bhv)
    generic map(seed => x"47a7d56c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(158));

CU159 : entity work.cu(bhv)
    generic map(seed => x"532b5c62", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(159));

CU160 : entity work.cu(bhv)
    generic map(seed => x"179d03cb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(160));

CU161 : entity work.cu(bhv)
    generic map(seed => x"52824dff", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(161));

CU162 : entity work.cu(bhv)
    generic map(seed => x"2ee1aaed", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(162));

CU163 : entity work.cu(bhv)
    generic map(seed => x"578939d6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(163));

CU164 : entity work.cu(bhv)
    generic map(seed => x"2b32b47e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(164));

CU165 : entity work.cu(bhv)
    generic map(seed => x"37d05405", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(165));

CU166 : entity work.cu(bhv)
    generic map(seed => x"05bd8bf7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(166));

CU167 : entity work.cu(bhv)
    generic map(seed => x"00799057", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(167));

CU168 : entity work.cu(bhv)
    generic map(seed => x"473f6208", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(168));

CU169 : entity work.cu(bhv)
    generic map(seed => x"180dd0a9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(169));

CU170 : entity work.cu(bhv)
    generic map(seed => x"5a43ca6a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(170));

CU171 : entity work.cu(bhv)
    generic map(seed => x"44949838", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(171));

CU172 : entity work.cu(bhv)
    generic map(seed => x"59557e14", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(172));

CU173 : entity work.cu(bhv)
    generic map(seed => x"10e8f286", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(173));

CU174 : entity work.cu(bhv)
    generic map(seed => x"4be75492", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(174));

CU175 : entity work.cu(bhv)
    generic map(seed => x"497b8d7f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(175));

CU176 : entity work.cu(bhv)
    generic map(seed => x"05942ddf", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(176));

CU177 : entity work.cu(bhv)
    generic map(seed => x"09dabb3d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(177));

CU178 : entity work.cu(bhv)
    generic map(seed => x"32043e94", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(178));

CU179 : entity work.cu(bhv)
    generic map(seed => x"27394d09", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(179));

CU180 : entity work.cu(bhv)
    generic map(seed => x"0e614872", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(180));

CU181 : entity work.cu(bhv)
    generic map(seed => x"7704325f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(181));

CU182 : entity work.cu(bhv)
    generic map(seed => x"66908bf6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(182));

CU183 : entity work.cu(bhv)
    generic map(seed => x"64f29feb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(183));

CU184 : entity work.cu(bhv)
    generic map(seed => x"0b92dba7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(184));

CU185 : entity work.cu(bhv)
    generic map(seed => x"369e4a17", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(185));

CU186 : entity work.cu(bhv)
    generic map(seed => x"7d57ea28", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(186));

CU187 : entity work.cu(bhv)
    generic map(seed => x"1af7be0a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(187));

CU188 : entity work.cu(bhv)
    generic map(seed => x"1a6d46a4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(188));

CU189 : entity work.cu(bhv)
    generic map(seed => x"790be165", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(189));

CU190 : entity work.cu(bhv)
    generic map(seed => x"29b57cea", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(190));

CU191 : entity work.cu(bhv)
    generic map(seed => x"35a403a9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(191));

CU192 : entity work.cu(bhv)
    generic map(seed => x"6c18bdca", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(192));

CU193 : entity work.cu(bhv)
    generic map(seed => x"0470e8dd", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(193));

CU194 : entity work.cu(bhv)
    generic map(seed => x"56bf59d6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(194));

CU195 : entity work.cu(bhv)
    generic map(seed => x"5da3b0e7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(195));

CU196 : entity work.cu(bhv)
    generic map(seed => x"74bdaaab", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(196));

CU197 : entity work.cu(bhv)
    generic map(seed => x"666d3a96", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(197));

CU198 : entity work.cu(bhv)
    generic map(seed => x"6b57738e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(198));

CU199 : entity work.cu(bhv)
    generic map(seed => x"2862f08f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(199));

CU200 : entity work.cu(bhv)
    generic map(seed => x"1abb0adb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(200));

CU201 : entity work.cu(bhv)
    generic map(seed => x"24173e16", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(201));

CU202 : entity work.cu(bhv)
    generic map(seed => x"3db67fab", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(202));

CU203 : entity work.cu(bhv)
    generic map(seed => x"110051a4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(203));

CU204 : entity work.cu(bhv)
    generic map(seed => x"06c3a24a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(204));

CU205 : entity work.cu(bhv)
    generic map(seed => x"69f6e587", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(205));

CU206 : entity work.cu(bhv)
    generic map(seed => x"5a6e39a9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(206));

CU207 : entity work.cu(bhv)
    generic map(seed => x"20cf6356", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(207));

CU208 : entity work.cu(bhv)
    generic map(seed => x"429db748", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(208));

CU209 : entity work.cu(bhv)
    generic map(seed => x"50ba971b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(209));

CU210 : entity work.cu(bhv)
    generic map(seed => x"7180cf79", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(210));

CU211 : entity work.cu(bhv)
    generic map(seed => x"1d8497ca", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(211));

CU212 : entity work.cu(bhv)
    generic map(seed => x"107a9be0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(212));

CU213 : entity work.cu(bhv)
    generic map(seed => x"4a8e8aa5", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(213));

CU214 : entity work.cu(bhv)
    generic map(seed => x"316a7384", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(214));

CU215 : entity work.cu(bhv)
    generic map(seed => x"2d279236", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(215));

CU216 : entity work.cu(bhv)
    generic map(seed => x"055fb8e7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(216));

CU217 : entity work.cu(bhv)
    generic map(seed => x"20a7a616", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(217));

CU218 : entity work.cu(bhv)
    generic map(seed => x"427c19be", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(218));

CU219 : entity work.cu(bhv)
    generic map(seed => x"6150dc6b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(219));

CU220 : entity work.cu(bhv)
    generic map(seed => x"5b689987", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(220));

CU221 : entity work.cu(bhv)
    generic map(seed => x"3f1d76b8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(221));

CU222 : entity work.cu(bhv)
    generic map(seed => x"7ebf2dbd", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(222));

CU223 : entity work.cu(bhv)
    generic map(seed => x"111c9f73", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(223));

CU224 : entity work.cu(bhv)
    generic map(seed => x"6afce9c6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(224));

CU225 : entity work.cu(bhv)
    generic map(seed => x"1fb924e4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(225));

CU226 : entity work.cu(bhv)
    generic map(seed => x"47539afc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(226));

CU227 : entity work.cu(bhv)
    generic map(seed => x"43bed578", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(227));

CU228 : entity work.cu(bhv)
    generic map(seed => x"5eb4b72e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(228));

CU229 : entity work.cu(bhv)
    generic map(seed => x"72d59cbd", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(229));

CU230 : entity work.cu(bhv)
    generic map(seed => x"45fcf81f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(230));

CU231 : entity work.cu(bhv)
    generic map(seed => x"0a5692d8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(231));

CU232 : entity work.cu(bhv)
    generic map(seed => x"17739034", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(232));

CU233 : entity work.cu(bhv)
    generic map(seed => x"4edfa617", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(233));

CU234 : entity work.cu(bhv)
    generic map(seed => x"30812e93", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(234));

CU235 : entity work.cu(bhv)
    generic map(seed => x"765e0f10", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(235));

CU236 : entity work.cu(bhv)
    generic map(seed => x"745f2aba", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(236));

CU237 : entity work.cu(bhv)
    generic map(seed => x"7d57d6e3", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(237));

CU238 : entity work.cu(bhv)
    generic map(seed => x"0144621b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(238));

CU239 : entity work.cu(bhv)
    generic map(seed => x"51841772", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(239));

CU240 : entity work.cu(bhv)
    generic map(seed => x"581f3bd1", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(240));

CU241 : entity work.cu(bhv)
    generic map(seed => x"64a6c84b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(241));

CU242 : entity work.cu(bhv)
    generic map(seed => x"4c55ab0d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(242));

CU243 : entity work.cu(bhv)
    generic map(seed => x"360edad7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(243));

CU244 : entity work.cu(bhv)
    generic map(seed => x"0453a0e0", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(244));

CU245 : entity work.cu(bhv)
    generic map(seed => x"73fd4161", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(245));

CU246 : entity work.cu(bhv)
    generic map(seed => x"7f62f9d2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(246));

CU247 : entity work.cu(bhv)
    generic map(seed => x"63a61f6d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(247));

CU248 : entity work.cu(bhv)
    generic map(seed => x"7ad20c9f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(248));

CU249 : entity work.cu(bhv)
    generic map(seed => x"3a1fa2c6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(249));

CU250 : entity work.cu(bhv)
    generic map(seed => x"69e295e1", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(250));

CU251 : entity work.cu(bhv)
    generic map(seed => x"3369258a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(251));

CU252 : entity work.cu(bhv)
    generic map(seed => x"146bbbfb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(252));

CU253 : entity work.cu(bhv)
    generic map(seed => x"76a885c5", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(253));

CU254 : entity work.cu(bhv)
    generic map(seed => x"6a94ed1e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(254));

CU255 : entity work.cu(bhv)
    generic map(seed => x"3ea82a65", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(255));

CU256 : entity work.cu(bhv)
    generic map(seed => x"0e168e92", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(256));

CU257 : entity work.cu(bhv)
    generic map(seed => x"007ecc96", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(257));

CU258 : entity work.cu(bhv)
    generic map(seed => x"2a1de326", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(258));

CU259 : entity work.cu(bhv)
    generic map(seed => x"335d954f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(259));

CU260 : entity work.cu(bhv)
    generic map(seed => x"1d7e3dad", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(260));

CU261 : entity work.cu(bhv)
    generic map(seed => x"6c76f013", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(261));

CU262 : entity work.cu(bhv)
    generic map(seed => x"2c93ff39", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(262));

CU263 : entity work.cu(bhv)
    generic map(seed => x"1b077486", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(263));

CU264 : entity work.cu(bhv)
    generic map(seed => x"2d4d2a5b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(264));

CU265 : entity work.cu(bhv)
    generic map(seed => x"4abb72ed", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(265));

CU266 : entity work.cu(bhv)
    generic map(seed => x"037daa2d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(266));

CU267 : entity work.cu(bhv)
    generic map(seed => x"4a596eca", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(267));

CU268 : entity work.cu(bhv)
    generic map(seed => x"7d6a800d", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(268));

CU269 : entity work.cu(bhv)
    generic map(seed => x"40be6113", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(269));

CU270 : entity work.cu(bhv)
    generic map(seed => x"21486270", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(270));

CU271 : entity work.cu(bhv)
    generic map(seed => x"53b83788", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(271));

CU272 : entity work.cu(bhv)
    generic map(seed => x"46dec662", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(272));

CU273 : entity work.cu(bhv)
    generic map(seed => x"51f6906f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(273));

CU274 : entity work.cu(bhv)
    generic map(seed => x"60930dee", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(274));

CU275 : entity work.cu(bhv)
    generic map(seed => x"321b8032", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(275));

CU276 : entity work.cu(bhv)
    generic map(seed => x"6d35abfe", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(276));

CU277 : entity work.cu(bhv)
    generic map(seed => x"0a92c1c8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(277));

CU278 : entity work.cu(bhv)
    generic map(seed => x"0794e59a", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(278));

CU279 : entity work.cu(bhv)
    generic map(seed => x"440dc108", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(279));

CU280 : entity work.cu(bhv)
    generic map(seed => x"2f99e4c2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(280));

CU281 : entity work.cu(bhv)
    generic map(seed => x"1d95dff7", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(281));

CU282 : entity work.cu(bhv)
    generic map(seed => x"0f96c9f9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(282));

CU283 : entity work.cu(bhv)
    generic map(seed => x"543eaf85", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(283));

CU284 : entity work.cu(bhv)
    generic map(seed => x"0ae8f116", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(284));

CU285 : entity work.cu(bhv)
    generic map(seed => x"404aee11", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(285));

CU286 : entity work.cu(bhv)
    generic map(seed => x"60ea7bcd", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(286));

CU287 : entity work.cu(bhv)
    generic map(seed => x"7f5af6bb", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(287));

CU288 : entity work.cu(bhv)
    generic map(seed => x"643f63f2", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(288));

CU289 : entity work.cu(bhv)
    generic map(seed => x"73fd1f07", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(289));

CU290 : entity work.cu(bhv)
    generic map(seed => x"5c13f52e", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(290));

CU291 : entity work.cu(bhv)
    generic map(seed => x"0eba2d78", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(291));

CU292 : entity work.cu(bhv)
    generic map(seed => x"1c62d6fc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(292));

CU293 : entity work.cu(bhv)
    generic map(seed => x"2993686b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(293));

CU294 : entity work.cu(bhv)
    generic map(seed => x"74490039", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(294));

CU295 : entity work.cu(bhv)
    generic map(seed => x"43471ded", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(295));

CU296 : entity work.cu(bhv)
    generic map(seed => x"763c6ccc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(296));

CU297 : entity work.cu(bhv)
    generic map(seed => x"56b7f383", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(297));

CU298 : entity work.cu(bhv)
    generic map(seed => x"4af8812f", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(298));

CU299 : entity work.cu(bhv)
    generic map(seed => x"2542d9a4", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(299));

CU300 : entity work.cu(bhv)
    generic map(seed => x"6f5c85b9", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(300));

CU301 : entity work.cu(bhv)
    generic map(seed => x"74eca296", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(301));

CU302 : entity work.cu(bhv)
    generic map(seed => x"77ff1b87", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(302));

CU303 : entity work.cu(bhv)
    generic map(seed => x"1fe4d605", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(303));

CU304 : entity work.cu(bhv)
    generic map(seed => x"690d8254", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(304));

CU305 : entity work.cu(bhv)
    generic map(seed => x"0ed1dafa", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(305));

CU306 : entity work.cu(bhv)
    generic map(seed => x"24ec2521", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(306));

CU307 : entity work.cu(bhv)
    generic map(seed => x"5c5a27f8", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(307));

CU308 : entity work.cu(bhv)
    generic map(seed => x"793afb95", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(308));

CU309 : entity work.cu(bhv)
    generic map(seed => x"26d4d2fc", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(309));

CU310 : entity work.cu(bhv)
    generic map(seed => x"28b1d6be", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(310));

CU311 : entity work.cu(bhv)
    generic map(seed => x"309bc9b6", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(311));

CU312 : entity work.cu(bhv)
    generic map(seed => x"58772d9c", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(312));

CU313 : entity work.cu(bhv)
    generic map(seed => x"55b27015", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(313));

CU314 : entity work.cu(bhv)
    generic map(seed => x"01ae52af", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(314));

CU315 : entity work.cu(bhv)
    generic map(seed => x"40168a35", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(315));

CU316 : entity work.cu(bhv)
    generic map(seed => x"68b3c197", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(316));

CU317 : entity work.cu(bhv)
    generic map(seed => x"136df1ee", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(317));

CU318 : entity work.cu(bhv)
    generic map(seed => x"6678725b", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(318));

CU319 : entity work.cu(bhv)
    generic map(seed => x"1c652498", rolls_per_round => rolls_per_round, rounds_to_run => rounds_to_run)
    port map(clkin => clkin, count_out => cu_counts(319));

    process(clkin) is
    begin
        if rising_edge(clkin) then
            case state is
                when WAITING =>
                    if valid = '1' then
                        state := COUNTING;
                    end if;
                when COUNTING =>
                    if cu_counts(count) > max then
                        max := cu_counts(count);
                    end if;

                    if count = instances - 1 then
                        count_out <= max;
                        valid_out <= '1';
                        state := ENDLOOP;
                    else
                        count := count + 1;
                    end if;
                when others =>
            end case;
        end if;
    end process;
end;