library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port(
		pre, clr, clk, d: in std_logic;
		q,nq: inout std_logic
	);
end entity;

architecture a_flipflop of flipflop is


begin
	
	ffd: process(clk, clr, pre)
	begin
		if(clr = '0')then
			q<='0';
            nq<='0';
		elsif(clk'event and clk='1')then   
				if(pre = '1')then
	 	    		q<='1';
                    nq<='0';
				else
					q<=d;
                   nq<=not d;
				end if;
			end if;

	end process ffd;
end a_flipflop;
