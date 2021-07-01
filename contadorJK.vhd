library ieee;
use ieee.std_logic_1164.all;
entity contadorjk is
  port(
      clk,clr:in std_logic;
	  c:in std_logic;
	  q:inout std_logic_vector(2 downto 0)
	  );
end entity;

architecture arquitectura_contador of contadorjk is
signal j,k:std_logic_vector(2 downto 0);
begin
   combinacional: process(c, q)
   begin
    j(2) <= (not(c) and q(1) and q(0));
    j(1) <= (not(c) and q(0));
    j(0) <=  not(c);
	k(2) <= (not(c) and q(1) and q(0));
    k(1) <= (not(c) and q(0));
    k(0) <=  not(c);
   end process combinacional;

   process(clk, clr)
   begin
    if(clr='1') then
        q<="000";
    elsif(clk'event and clk='1')then
        q<= ((not(k)and q) or (j and not(q)));
    end if;
   end process;    
end arquitectura_contador;