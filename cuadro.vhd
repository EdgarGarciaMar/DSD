library ieee;
use ieee.std_logic_1164.all;
entity pract is
	port(A,B,C,D,ref,sel:in std_logic_vector(1 downto 0);
		display: out std_logic_vector(6 downto 0)
			);
		end entity;

ARCHITECTURE A_pract of pract is
signal z:std_logic_vector(1 downto 0);
signal aux:std_logic_vector(2 downto 0);
CONSTANT mayor:std_logic_vector(6 downto 0):="0000111";
CONSTANT menor:std_logic_vector(6 downto 0):="0110001";
CONSTANT igual:std_logic_vector(6 downto 0):="0110111";
begin
	with sel select
	z<= A when "00",
		B when "01",
		C when "10",
		D when OTHERS;

comp: PROCESS(z,ref)
begin
if (z>ref)then
aux<="100";
	elsif(z<ref)then
	aux<="010";
else
	aux<="001";
	end if;
	end PROCESS comp;

DECO:PROCESS(aux)
	begin
	case aux is
		when"100"=>display<=mayor;
		when"001"=>display<=menor;
		when OTHERS=>display<=igual;
		end case;
end PROCESS DECO;
end A_pract;
	
