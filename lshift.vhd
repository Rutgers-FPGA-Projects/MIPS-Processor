Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.std_logic_arith.all;
Use IEEE.std_logic_unsigned.all;

Entity lshift is
	port(	a: in std_logic_vector(31 downto 0);
			n: in std_logic_vector(4 downto 0);
			y: out std_logic_vector(31 downto 0));
End;

Architecture behave of lshift is
Begin
	process(a,n) 
		variable b:integer range 31 downto 0;
		variable aa,yy:bit_vector(31 downto 0);
	begin
		aa:= to_bitvector(a);
		b := conv_integer(n);
		yy:= aa sll b;
		y <= to_stdlogicvector(yy);
	end process;
end;