library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity shifter is
port(
   input:in std_logic_vector(1025 downto 0);
   en:in std_logic;
   dir:in std_logic;
   output:out std_logic_vector(1025 downto 0)
);
end shifter;


--signal declaration
architecture RTL of shifter is
signal shifted:std_logic_vector(1025 downto 0);
signal sig_0:std_logic_vector(1026 downto 0);
signal sig_1:std_logic_vector(1025 downto 0);
signal sig_2:std_logic_vector(1026 downto 0);
signal sig_3:std_logic_vector(1025 downto 0);
signal output_int:std_logic_vector(1025 downto 0);


begin


--combinational logics
dpCMB: process (shifted,sig_0,sig_1,sig_2,sig_3,output_int,input,en,dir)
   begin
      shifted <= (others=>'0');
      sig_0 <= (others=>'0');
      sig_1 <= (others=>'0');
      sig_2 <= (others=>'0');
      sig_3 <= (others=>'0');
      output_int <= (others=>'0');
      output <= (others=>'0');

      sig_0 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(input),1027),conv_unsigned(1,1027)),1027);
      sig_1 <= conv_std_logic_vector(shr(unsigned(input),conv_unsigned(1,1026)),1026);
      if (dir = '1') then
         sig_2 <= sig_0;
      else
         sig_2 <= conv_std_logic_vector(unsigned(sig_1),1027);
      end if;
      shifted <= sig_2(1025 downto 0);
      if (en = '1') then
         sig_3 <= shifted;
      else
         sig_3 <= input;
      end if;
      output <= output_int;
      output_int <= sig_3;
   end process dpCMB;
end RTL;
