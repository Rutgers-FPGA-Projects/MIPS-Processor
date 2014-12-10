Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.std_logic_arith.all;
Use IEEE.std_logic_unsigned.all;

Entity ALU is
	generic (N: integer := 32);
	port(	a,b:		in  std_logic_vector(N-1 downto 0);
			shamt:		in  std_logic_vector(4 downto 0);
			alucontrol:	in  std_logic_vector(3 downto 0);
			result:		out std_logic_vector(N-1 downto 0);
			zero:		out std_logic);
End;
Architecture behave of ALU is
Signal NB,SUB,SLT,YY,SL:std_logic_vector(N-1 downto 0);
Component lshift
port(	a: in std_logic_vector(31 downto 0);
		n: in std_logic_vector(4 downto 0);
		y: out std_logic_vector(31 downto 0));
End component;
Begin
	--signal
	NB  <= not b;
	SUB <= a - b;
	SLT <= conv_std_logic_vector(0,N) + SUB(N-1);
	U1: lshift port map (b,shamt,SL);
	--result
	YY <= a and b  when alucontrol="0000" else
	      a or  b  when alucontrol="0001" else
	      a  +  b  when alucontrol="0010" else
	      a and NB when alucontrol="1000" else
	      a or  NB when alucontrol="1001" else
	      SUB      when alucontrol="1010" else
	      SLT	   when alucontrol="1011" else
	      SL       when alucontrol="0100" else
	 	  conv_std_logic_vector(0,N);
	result <= YY;
	--zero
	process(YY) begin
		if YY=0 then 
			zero <= '1';
		else
			zero <= '0';
		end if;
	end process;
End;
	