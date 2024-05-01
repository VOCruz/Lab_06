library ieee;
use ieee.std_logic_1164.all;

entity Selecao is
	port(SW3, SW2, SW1, SW0:  in std_logic;
		 C3, C2, C1, C0: out std_logic
	);
end Selecao;
	
architecture logic of Selecao is

begin

	C3 <= (    SW3  and not(SW2) and not(SW1) and not(SW0));
	C2 <= (not(SW3) and     SW2  and not(SW1) and not(SW0));
	C1 <= (not(SW3) and not(SW2) and     SW1  and not(SW0));
	C0 <= (not(SW3) and not(SW2) and not(SW1) and     SW0 );
	
end logic;









