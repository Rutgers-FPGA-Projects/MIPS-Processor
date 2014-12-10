library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

entity mux4 is	--four-input multiplexer 
	generic (width: integer); 
	port (d0, d1 ,d2 ,d3: in  STD_LOGIC_VECTOR(width-1 downto 0); 
	s: in  STD_LOGIC_VECTOR(1 downto 0);
	y: out STD_LOGIC_VECTOR(width-1 downto 0));
end;

architecture behave of mux4 is 
begin
	y <= d0 when s = "00" else 
		 d1	when s = "01" else
		 d2 when s = "10" else
		 d3; 
end;