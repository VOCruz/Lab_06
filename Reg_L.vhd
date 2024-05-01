library ieee;
use ieee.std_logic_1164.all;

entity Reg_L is
	port(C3, C0, KEY0 :  in std_logic;
		    clock :  in std_logic;
		    Linha : out std_logic_vector(7 downto 0)
	);
end Reg_L;

architecture logic of Reg_L is
	
component FF_D is
	port(ck, clr, set, d :  in std_logic;
			   q : out std_logic
	);
end component;

component Mux_4x1 is
	port(E3, E2, E1, E0 :  in std_logic;
		     k1, k0 :  in std_logic;
			  S : out std_logic
	);
end component;

signal D, Q : std_logic_vector(7 downto 0);
signal set  : std_logic := '1';
signal set_clr : std_logic;

begin

	set_clr <= (set and KEY0) or (not(set) and not(KEY0));

	M7 : Mux_4x1 port map(Q(7), Q(6), Q(0), Q(7), C3, C0, D(7));
	F7 : FF_D port map(clock, KEY0, set_clr, D(7), Q(7));

	M6 : Mux_4x1 port map(Q(6), Q(5), Q(7), Q(6), C3, C0, D(6));
	F6 : FF_D port map(clock, KEY0, set, D(6), Q(6));

	M5 : Mux_4x1 port map(Q(5), Q(4), Q(6), Q(5), C3, C0, D(5));
	F5 : FF_D port map(clock, KEY0, set, D(5), Q(5));

	M4 : Mux_4x1 port map(Q(4), Q(3), Q(5), Q(4), C3, C0, D(4));
	F4 : FF_D port map(clock, KEY0, set, D(4), Q(4));

	M3 : Mux_4x1 port map(Q(3), Q(2), Q(4), Q(3), C3, C0, D(3));
	F3 : FF_D port map(clock, KEY0, set, D(3), Q(3));

	M2 : Mux_4x1 port map(Q(2), Q(1), Q(3), Q(2), C3, C0, D(2));
	F2 : FF_D port map(clock, KEY0, set, D(2), Q(2));

	M1 : Mux_4x1 port map(Q(1), Q(0), Q(2), Q(1), C3, C0, D(1));
	F1 : FF_D port map(clock, KEY0, set, D(1), Q(1));

	M0 : Mux_4x1 port map(Q(0), Q(7), Q(1), Q(0), C3, C0, D(0));
	F0 : FF_D port map(clock, KEY0, set, D(0), Q(0));

	Linha <= Q;

end logic;









