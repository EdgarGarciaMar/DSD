library ieee;
use ieee.std_logic_1164.all;
entity contador is
  port(
      clk,clr:in std_logic;
	  c:in std_logic;
	  q:inout std_logic_vector(2 downto 0)
	  );
end entity;

architecture arquitectura_contador of contador is
signal d:std_logic_vector(2 downto 0);
begin
   combinacional: process(c, q)
   begin
    d(2) <= (c and q(2)) or (q(2) and not(q(1))) or (q(2) and not(q(0))) or (not(c) and not(q(2)) and q(1) and q(0));
    d(1) <= (q(1) and not q(0)) or (c and q(1)) or (not(c) and not(q(1)) and q(0));
    d(0) <= (c and q(0)) or (not(c) and not(q(0)));
   end process combinacional;

   process(clk, clr)
   begin
    if(clr='1') then
        q<="000";
    elsif(clk'event and clk='1')then
        q<=d;
    end if;
   end process; 
end arquitectura_contador;