library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port(
		pre, clr, clk, d, t: in std_logic;
		sr, jk, sel: in std_logic_vector(1 downto 0);
		q, nq: inout std_logic
	);
end entity;

architecture a_flipflop of flipflop is
signal aux_qd, aux_qsr, aux_qjk, aux_qt: std_logic;
signal z: std_logic;
begin
	
	ffd: process(clk, clr, pre) -- tipo d
	begin
		if(clr = '0')then
			aux_qd<='0';
		elsif(clk'event and clk='1')then   
				if(pre = '1')then
	 	    		aux_qd<='1';
				else
					aux_qd<=d;
				end if;
		end if;
	end process ffd;

	ffsr: process(clk, clr, pre)-- tipo sr
	begin
		if(clr = '0')then
			aux_qsr<='0';
		elsif(clk'event and clk='1')then   
				if(pre = '1')then
	 	    		aux_qsr<='1';
				else
					aux_qsr<=(sr(1)or(sr(0)and aux_qsr));
				end if;
		end if;

	end process ffsr;

	ffjk: process(clk, clr, pre) -- tipo jk
	begin
		if(clr = '0')then
			aux_qjk<='0';
		elsif(clk'event and clk='1')then   
				if(pre = '1')then
	 	    		aux_qjk<='1';
				else
					aux_qjk<=((not(jk(0))and aux_qjk) or (jk(1)and not(aux_qjk)));
				end if;
		end if;

	end process ffjk;


	fft: process(clk, clr, pre) -- tipo t
	begin
		if(clr = '0')then
			aux_qt<='0';
		elsif(clk'event and clk='1')then   
				if(pre = '1')then
	 	    		aux_qt<='1';
				else
					aux_qt<=((not(t)and aux_qt)or(t and not(aux_qt)));
				end if;
		end if;

	end process fft;


	with sel select
	z <=aux_qd when "00",
		aux_qsr when "01",
		aux_qjk when "10",
		aux_qt when others;

	q<=z;
	nq<=not(z);
end a_flipflop;