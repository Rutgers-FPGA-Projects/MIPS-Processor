library IEEE; 
use IEEE.STD_LOGIC_1164.all; use STD.TEXTIO.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; use IEEE.STD_LOGIC_ARITH.all; 

entity dmem is
	port (clk, we: in  STD_LOGIC; 
		  a, wd:   in  STD_LOGIC_VECTOR (31 downto 0); 
		  rd:      out STD_LOGIC_VECTOR (31 downto 0)); 
end;

architecture behave of dmem is
	type ramtype is array (63 downto 0) of std_logic_vector
							  (31 downto 0);
	shared variable mem: ramtype;
begin 
	process(clk,we) begin
		if rising_edge(clk) then 
			if (we = '1') then mem (CONV_INTEGER (a(7 downto 2))) := wd; 
			end if; 
		end if;  
	end process;
	rd <= mem (CONV_INTEGER (a (7 downto 2))); 
end;