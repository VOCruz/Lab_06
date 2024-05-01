library ieee;
use ieee.std_logic_1164.all;

entity Mux_4x1 is
	port(E3, E2, E1, E0 :  in std_logic;
		     k1, k0 :  in std_logic;
			  S : out std_logic
	);
end Mux_4x1;

architecture logic of Mux_4x1 is

begin

	S <= (E3 and     k1  and     k0 ) or 
	     (E2 and     k1  and not(k0)) or 
	     (E1 and not(k1) and     k0 ) or 
	     (E0 and not(k1) and not(k0));

end logic;









