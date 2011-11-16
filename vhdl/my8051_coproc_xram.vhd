library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity my8051_coproc_xram is
port(
   idata:in std_logic_vector(7 downto 0);
   odata:out std_logic_vector(7 downto 0);
   address:in std_logic_vector(15 downto 0);
   wr:in std_logic;
   RST : in std_logic;
   CLK : in std_logic

);
end my8051_coproc_xram;


--signal declaration
architecture RTL of my8051_coproc_xram is
begin
   -- VHDL view of ipblock
end RTL;
