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

signal output_i1 : std_logic_vector(512 downto 0);
signal output_i2 : std_logic_vector(512 downto 0);

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

	output_i1 <= ("0" & inx(511 downto 0)) + ("0" & iny_i(511 downto 0)) + c_i;
	output_i2 <= ("0" & inx(1023 downto 512)) + ("0" & iny_i(1023 downto 512)) + output_i1(512);
	
	output(1024 downto 512) <= output_i2;
	output( 511 downto   0) <= output_i1(511 downto 0);
   end process dpCMB;
end RTL;
