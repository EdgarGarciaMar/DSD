library ieee;
use ieee.std_logic_1164.all;

Entity flipflop is

port(
    clr,clk,pre,d: in std_logic;
	q,nq:inout std_logic);
end Entity;

architecture a_flipflop of flipflop is
begin


ffd: process(clk, clr, pre)
	begin
		if(clr = '1')then
			q<='0';
            nq<='1';
		elsif(clk'event and clk='0')then   
				if(pre = '0')then
	 	    		q<='1';
                    nq<='0';
				else
					q<=d;
                   nq<=not d;
				end if;
			end if;

	end process ffd;
end a_flipflop;

