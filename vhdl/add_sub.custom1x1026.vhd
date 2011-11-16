library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity add_sub is
port(
   inx:in std_logic_vector(1025 downto 0);
   iny:in std_logic_vector(1025 downto 0);
   kind:in std_logic;
   output:out std_logic_vector(1025 downto 0)
);
end add_sub;


--signal declaration
architecture RTL of add_sub is
signal iny_i : std_logic_vector(1025 downto 0);
signal c_i   : std_logic;

begin


--combinational logics
dpCMB: process (inx,iny,kind)
   begin
	case kind is
	  when '0'    => iny_i <= not iny; 
	                 c_i <= '1';
	  when others => iny_i <= iny;
	                 c_i <= '0';
	end case;

	output <= inx + iny_i + c_i;
   end process dpCMB;
end RTL;
