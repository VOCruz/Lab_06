library ieee;
use ieee.std_logic_1164.all;

entity Lab_06 is
	port(SW3, SW2, SW1, SW0, KEY0 :  in std_logic;
				clock :  in std_logic;
			Linha, Coluna : out std_logic_vector(7 downto 0)
	);
end Lab_06;

architecture logic of Lab_06 is

component Selecao is
	port(SW3, SW2, SW1, SW0:  in std_logic;
		 C3, C2, C1, C0: out std_logic
	);
end component;

component Reg_L is
	port(C3, C0, KEY0 :  in std_logic;
		    clock :  in std_logic;
		    Linha : out std_logic_vector(7 downto 0)
	);
end component;

component Reg_C is
	port(C2, C1, KEY0 :  in std_logic;
		    clock :  in std_logic;
		   Coluna : out std_logic_vector(7 downto 0)
	);
end component;

component ck_div is
	port(ck_in :  in std_logic;
	    ck_out : out std_logic
	);
end component;

signal Ch3, Ch2, Ch1, Ch0, ck : std_logic;

begin

	C_D : ck_div port map(clock, ck);

	S : Selecao port map(SW3, SW2, SW1, SW0, Ch3, Ch2, Ch1, Ch0);

	RL : Reg_L port map(Ch3, Ch0, KEY0, ck, Linha);

	RC : Reg_C port map(Ch2, Ch1, KEY0, ck, Coluna);

end logic;









