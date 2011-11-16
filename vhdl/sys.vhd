library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity sys is
port(
   RST : in std_logic;
   CLK : in std_logic

);
end sys;


--signal declaration
architecture RTL of sys is
signal cnt:std_logic_vector(7 downto 0);
signal ramidata:std_logic_vector(7 downto 0);
signal ramodata:std_logic_vector(7 downto 0);
signal ramadr:std_logic_vector(15 downto 0);
signal wr:std_logic;
signal t_out:std_logic_vector(1023 downto 0);
signal shift_en:std_logic;
signal shift_dir:std_logic;
signal d:std_logic_vector(7 downto 0);
signal d_wire:std_logic_vector(7 downto 0);
signal mem_adr:std_logic_vector(9 downto 0);
signal mem_adr_wire:std_logic_vector(9 downto 0);
signal rcnt:std_logic_vector(7 downto 0);
signal rcnt_wire:std_logic_vector(7 downto 0);
signal upc:std_logic_vector(9 downto 0);
signal upc_wire:std_logic_vector(9 downto 0);
signal rcmd:std_logic_vector(7 downto 0);
signal rcmd_wire:std_logic_vector(7 downto 0);
signal sign:std_logic;
signal sign_wire:std_logic;
signal reg_p:std_logic_vector(1023 downto 0);
signal reg_p_wire:std_logic_vector(1023 downto 0);
signal reg_u:std_logic_vector(1023 downto 0);
signal reg_u_wire:std_logic_vector(1023 downto 0);
signal reg_v:std_logic_vector(1023 downto 0);
signal reg_v_wire:std_logic_vector(1023 downto 0);
signal R:std_logic_vector(1025 downto 0);
signal R_wire:std_logic_vector(1025 downto 0);
signal S:std_logic_vector(1025 downto 0);
signal S_wire:std_logic_vector(1025 downto 0);
signal counter:std_logic_vector(10 downto 0);
signal counter_wire:std_logic_vector(10 downto 0);
signal Q:std_logic_vector(1023 downto 0);
signal Q_wire:std_logic_vector(1023 downto 0);
signal power:std_logic_vector(15 downto 0);
signal power_wire:std_logic_vector(15 downto 0);
signal int_res:std_logic_vector(1025 downto 0);
signal res:std_logic_vector(1025 downto 0);
signal prod:std_logic_vector(1025 downto 0);
signal x:std_logic_vector(1025 downto 0);
signal y:std_logic_vector(1025 downto 0);
signal p_in:std_logic_vector(1023 downto 0);
signal int_k:std_logic;
signal sig_0:std_logic_vector(1025 downto 0);
signal sig_1:std_logic_vector(1025 downto 0);
signal sig_2:std_logic_vector(1023 downto 0);
signal sig_3:std_logic_vector(1023 downto 0);
signal sig_4:std_logic_vector(1023 downto 0);
signal sig_5:std_logic_vector(10 downto 0);
signal sig_24:std_logic_vector(9 downto 0);
signal sig_27:std_logic_vector(1031 downto 0);
signal sig_28:std_logic_vector(1031 downto 0);
signal sig_31:std_logic_vector(1031 downto 0);
signal sig_32:std_logic_vector(1031 downto 0);
signal sig_35:std_logic_vector(1031 downto 0);
signal sig_36:std_logic_vector(1031 downto 0);
signal sig_37:std_logic_vector(1033 downto 0);
signal sig_38:std_logic_vector(1031 downto 0);
signal sig_41:std_logic_vector(9 downto 0);
signal sig_48:std_logic;
signal sig_51:std_logic;
signal sig_54:std_logic;
signal sig_57:std_logic;
signal sig_60:std_logic;
signal sig_63:std_logic;
signal sig_66:std_logic;
signal sig_69:std_logic;
signal sig_72:std_logic;
signal sig_75:std_logic;
signal sig_78:std_logic;
signal sig_81:std_logic;
signal sig_84:std_logic;
signal sig_87:std_logic;
signal sig_90:std_logic;
signal sig_93:std_logic;
signal sig_96:std_logic;
signal sig_99:std_logic;
signal sig_102:std_logic;
signal sig_105:std_logic;
signal sig_108:std_logic;
signal sig_111:std_logic;
signal sig_114:std_logic;
signal sig_117:std_logic;
signal sig_120:std_logic;
signal sig_123:std_logic;
signal sig_126:std_logic;
signal sig_127:std_logic;
signal sig_128:std_logic;
signal sig_129:std_logic;
signal sig_130:std_logic;
signal sig_131:std_logic;
signal sig_132:std_logic;
signal sig_133:std_logic;
signal sig_134:std_logic;
signal sig_135:std_logic;
signal sig_136:std_logic;
signal sig_139:std_logic;
signal sig_142:std_logic;
signal sig_145:std_logic;
signal sig_148:std_logic;
signal sig_151:std_logic;
signal sig_154:std_logic;
signal sig_7:std_logic;
signal sig_9:std_logic_vector(9 downto 0);
signal sig_11:std_logic;
signal sig_13:std_logic_vector(9 downto 0);
signal sig_15:std_logic;
signal sig_17:std_logic_vector(7 downto 0);
signal sig_19:std_logic_vector(8 downto 0);
signal sig_21:std_logic_vector(8 downto 0);
signal sig_23:std_logic_vector(8 downto 0);
signal sig_26:std_logic;
signal sig_30:std_logic;
signal sig_34:std_logic;
signal sig_40:std_logic_vector(9 downto 0);
signal sig_43:std_logic;
signal sig_45:std_logic;
signal sig_47:std_logic;
signal sig_50:std_logic_vector(1 downto 0);
signal sig_53:std_logic;
signal sig_56:std_logic;
signal sig_59:std_logic_vector(1 downto 0);
signal sig_62:std_logic_vector(1 downto 0);
signal sig_65:std_logic_vector(7 downto 0);
signal sig_68:std_logic_vector(6 downto 0);
signal sig_71:std_logic_vector(6 downto 0);
signal sig_74:std_logic_vector(6 downto 0);
signal sig_77:std_logic_vector(6 downto 0);
signal sig_80:std_logic_vector(6 downto 0);
signal sig_83:std_logic_vector(6 downto 0);
signal sig_86:std_logic_vector(6 downto 0);
signal sig_89:std_logic_vector(6 downto 0);
signal sig_92:std_logic_vector(6 downto 0);
signal sig_95:std_logic_vector(6 downto 0);
signal sig_98:std_logic_vector(6 downto 0);
signal sig_101:std_logic_vector(6 downto 0);
signal sig_104:std_logic_vector(7 downto 0);
signal sig_107:std_logic_vector(8 downto 0);
signal sig_110:std_logic_vector(7 downto 0);
signal sig_113:std_logic_vector(8 downto 0);
signal sig_116:std_logic_vector(8 downto 0);
signal sig_119:std_logic_vector(7 downto 0);
signal sig_122:std_logic_vector(8 downto 0);
signal sig_125:std_logic_vector(8 downto 0);
signal sig_138:std_logic_vector(7 downto 0);
signal sig_141:std_logic_vector(8 downto 0);
signal sig_144:std_logic_vector(8 downto 0);
signal sig_147:std_logic_vector(7 downto 0);
signal sig_150:std_logic_vector(8 downto 0);
signal sig_153:std_logic_vector(8 downto 0);


--component map declaration
component add_sub
port(
   inx:in std_logic_vector(1025 downto 0);
   iny:in std_logic_vector(1025 downto 0);
   kind:in std_logic;
   output:out std_logic_vector(1025 downto 0));
end component;
component my8051_coproc
port(
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component my8051_coproc_control
port(
   data:out std_logic_vector(7 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component my8051_coproc_xram
port(
   idata:in std_logic_vector(7 downto 0);
   odata:out std_logic_vector(7 downto 0);
   address:in std_logic_vector(15 downto 0);
   wr:in std_logic;
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component shifter
port(
   input:in std_logic_vector(1025 downto 0);
   en:in std_logic;
   dir:in std_logic;
   output:out std_logic_vector(1025 downto 0));
end component;
type STATE_TYPE is (s_init,s_fetch_1,s_fetch_2,s_fetchdecode,s_init_loadP,s_loadU_1,s_loadU_2,s_loadU_3,s_loadV_1,s_loadV_2,s_loadV_3,s_monpro_0,s_monpro_1,s_monpro_2,s_monpro_3,s_monpro_4,s_monpro_congruentQ,s_inv_0,s_inv_cmpvgteu,s_inv_1,s_inv_21,s_inv_22,s_inv_31,s_inv_32,s_inv_41,s_inv_42,s_inv_5,s_inv_6,s_inv_gtep,s_inv_7,s_inv_8,s_inv_9,s_finished,s_write_res,s_write_res1,s_write_res2,s_write_res3,s_write_res4,s_write_res5);
signal STATE:STATE_TYPE;
type CONTROL is (alwaysidle_datapathinit_regsno_read
, alwaysinit_upcset_not_doneidle_datapath
, alwaysidle_datapathno_read
, alwaysidle_datapathread_cmdincr_upc
, alwaysidle_datapathset_done
, alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro
, alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro_sq
, alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc
, alwaysidle_datapathinit_mem_adr_0read_cmdincr_upccopy_p_to_ucopy_u_to_v
, alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc
, alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc
, alwaysidle_datapathdisplay_resultread_cmdincr_upc
, alwaysincr_mem_adrread_data_to_pidle_datapath
, alwaysincr_mem_adrread_data_to_uidle_datapath
, alwaysincr_mem_adrread_data_to_vidle_datapath
, alwaysidle_datapathcount_initdisplay_inputno_read
, alwaysp_mulsel_prodsel_addno_shiftassign_Rsel_x_rcountno_read
, alwayssel_y_0sel_addshift_rightassign_Rsel_x_rno_readq_reg_update
, alwayssel_y_Msel_addshift_rightassign_Rsel_x_rno_readq_reg_update
, alwayssel_x_rsel_y_Msel_subget_signno_shiftno_read
, alwayssel_subsel_y_Mno_shiftassign_Rsel_x_rno_read
, alwaysidle_datapathno_readdisplay_q
, alwayssel_x_qsel_y_0sel_subno_shiftno_readinit_mem_adr_80
, alwaysinit_inverseidle_datapathno_read
, alwayssel_x_vsel_y_usel_subget_signno_shiftno_read
, alwayssel_x_0sel_y_0sel_subno_shiftno_read
, alwayssel_x_usel_y_0sel_subshift_rightassign_uno_read
, alwayssel_x_vsel_y_0sel_subshift_rightassign_vno_read
, alwayssel_x_vsel_y_usel_subshift_rightassign_vno_read
, alwayssel_x_usel_y_vsel_subshift_rightassign_uno_read
, alwayssel_x_ssel_y_0sel_subshift_leftassign_sno_read
, alwayssel_x_rsel_y_0sel_subshift_leftassign_rno_read
, alwayssel_x_rsel_y_ssel_addno_shiftassign_rno_read
, alwayssel_x_ssel_y_rsel_addno_shiftassign_sno_read
, alwayssel_x_powersel_y_1sel_addno_shiftassign_powerno_read
, alwayssel_x_rsel_y_pregsel_subno_shiftassign_rno_read
, alwayssel_x_pregsel_y_rsel_subno_shiftassign_rno_read
, alwayssel_x_rsel_y_0sel_subshift_rightassign_rno_read
, alwayssel_x_rsel_y_pregsel_addshift_rightassign_rno_read
, alwayssel_x_powersel_y_1sel_subno_shiftassign_powerno_read
, alwaysidle_datapathno_readcopy_R_to_u
, alwaysidle_datapathincr_mem_adrwrite_data
, alwaysidle_datapathincr_mem_adrwrite_data_from_q
);
signal cmd : CONTROL;


begin


--portmap
label_add_sub : add_sub port map (
      inx => x,
      iny => y,
      kind => int_k,
      output => int_res   );
label_my8051_coproc : my8051_coproc port map (
      RST => RST,
      CLK => CLK
   );
label_my8051_coproc_control : my8051_coproc_control port map (
      data => cnt,
      RST => RST,
      CLK => CLK
   );
label_my8051_coproc_xram : my8051_coproc_xram port map (
      idata => ramidata,
      odata => ramodata,
      address => ramadr,
      wr => wr,
      RST => RST,
      CLK => CLK
   );
label_shifter : shifter port map (
      input => int_res,
      en => shift_en,
      dir => shift_dir,
      output => res   );
--register updates
dpREG: process (CLK,RST)
   begin
      if (RST = '1') then
         d <= (others=>'0');
         mem_adr <= (others=>'0');
         rcnt <= (others=>'0');
         upc <= (others=>'0');
         rcmd <= (others=>'0');
         sign <= '0';
         reg_p <= (others=>'0');
         reg_u <= (others=>'0');
         reg_v <= (others=>'0');
         R <= (others=>'0');
         S <= (others=>'0');
         counter <= (others=>'0');
         Q <= (others=>'0');
         power <= (others=>'0');
      elsif CLK' event and CLK = '1' then
         d <= d_wire;
         mem_adr <= mem_adr_wire;
         rcnt <= rcnt_wire;
         upc <= upc_wire;
         rcmd <= rcmd_wire;
         sign <= sign_wire;
         reg_p <= reg_p_wire;
         reg_u <= reg_u_wire;
         reg_v <= reg_v_wire;
         R <= R_wire;
         S <= S_wire;
         counter <= counter_wire;
         Q <= Q_wire;
         power <= power_wire;

      end if;
   end process dpREG;


--combinational logics
dpCMB: process (cnt,ramidata,ramodata,ramadr,wr,t_out,shift_en,shift_dir,d,mem_adr
,rcnt,upc,rcmd,sign,reg_p,reg_u,reg_v,R,S,counter
,Q,power,int_res,res,prod,x,y,p_in,int_k,sig_0
,sig_1,sig_2,sig_3,sig_4,sig_5,sig_24,sig_27,sig_28,sig_31,sig_32
,sig_35,sig_36,sig_37,sig_38,sig_41,cmd,STATE)
   begin
      ramidata <= (others=>'0');
      ramadr <= (others=>'0');
      wr <= '0';
      t_out <= (others=>'0');
      shift_en <= '0';
      shift_dir <= '0';
      d_wire <= d;
      mem_adr_wire <= mem_adr;
      rcnt_wire <= rcnt;
      upc_wire <= upc;
      rcmd_wire <= rcmd;
      sign_wire <= sign;
      reg_p_wire <= reg_p;
      reg_u_wire <= reg_u;
      reg_v_wire <= reg_v;
      R_wire <= R;
      S_wire <= S;
      counter_wire <= counter;
      Q_wire <= Q;
      power_wire <= power;
      prod <= (others=>'0');
      x <= (others=>'0');
      y <= (others=>'0');
      p_in <= (others=>'0');
      int_k <= '0';
      sig_0 <= (others=>'0');
      sig_1 <= (others=>'0');
      sig_2 <= (others=>'0');
      sig_3 <= (others=>'0');
      sig_4 <= (others=>'0');
      sig_5 <= (others=>'0');
      sig_24 <= (others=>'0');
      sig_27 <= (others=>'0');
      sig_28 <= (others=>'0');
      sig_31 <= (others=>'0');
      sig_32 <= (others=>'0');
      sig_35 <= (others=>'0');
      sig_36 <= (others=>'0');
      sig_37 <= (others=>'0');
      sig_38 <= (others=>'0');
      sig_41 <= (others=>'0');
      sig_7 <= '1';
      sig_9 <= "1100000000";
      sig_11 <= '0';
      sig_13 <= "1100000000";
      sig_15 <= '0';
      sig_17 <= "10000000";
      sig_19 <= "100000000";
      sig_21 <= "110000000";
      sig_23 <= "110000000";
      sig_26 <= '0';
      sig_30 <= '0';
      sig_34 <= '0';
      sig_40 <= "1010000000";
      sig_43 <= '0';
      sig_45 <= '0';
      sig_47 <= '1';
      sig_50 <= "10";
      sig_53 <= '0';
      sig_56 <= '1';
      sig_59 <= "10";
      sig_62 <= "11";
      sig_65 <= "10011001";
      sig_68 <= "1000000";
      sig_71 <= "1000001";
      sig_74 <= "1000010";
      sig_77 <= "1000100";
      sig_80 <= "1000101";
      sig_83 <= "1000110";
      sig_86 <= "1010000";
      sig_89 <= "1010001";
      sig_92 <= "1010010";
      sig_95 <= "1100000";
      sig_98 <= "1100001";
      sig_101 <= "1100010";
      sig_104 <= "11111111";
      sig_107 <= "110000000";
      sig_110 <= "10000000";
      sig_113 <= "100000000";
      sig_116 <= "110000000";
      sig_119 <= "10000000";
      sig_122 <= "100000000";
      sig_125 <= "110000000";
      sig_138 <= "10000000";
      sig_141 <= "100000000";
      sig_144 <= "110000000";
      sig_147 <= "10000000";
      sig_150 <= "100000000";
      sig_153 <= "110000000";



      case cmd is
         when alwaysidle_datapathinit_regsno_read =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            reg_u_wire <= conv_std_logic_vector(0,1024);
            reg_v_wire <= conv_std_logic_vector(0,1024);
            reg_p_wire <= conv_std_logic_vector(0,1024);
            R_wire <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwaysinit_upcset_not_doneidle_datapath =>
            rcnt_wire <= cnt;
            upc_wire <= sig_40;
            ramidata <= logic_zero_ext(sig_11,8);
            ramadr <= conv_std_logic_vector(unsigned(sig_13),16);
            wr <= '1';
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
         when alwaysidle_datapathno_read =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwaysidle_datapathread_cmdincr_upc =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
         when alwaysidle_datapathset_done =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_7,8);
            ramadr <= conv_std_logic_vector(unsigned(sig_9),16);
            wr <= '1';
         when alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= logic_zero_ext(sig_15,10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
            R_wire <= conv_std_logic_vector(0,1026);
            Q_wire <= conv_std_logic_vector(0,1024);
            S_wire <= conv_std_logic_vector(unsigned(reg_v),1026);
         when alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro_sq =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= logic_zero_ext(sig_15,10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
            R_wire <= conv_std_logic_vector(0,1026);
            Q_wire <= conv_std_logic_vector(0,1024);
            S_wire <= conv_std_logic_vector(unsigned(reg_u),1026);
         when alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= conv_std_logic_vector(unsigned(sig_19),10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
         when alwaysidle_datapathinit_mem_adr_0read_cmdincr_upccopy_p_to_ucopy_u_to_v =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= logic_zero_ext(sig_15,10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
            reg_u_wire <= reg_p;
            reg_v_wire <= reg_u;
         when alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= logic_zero_ext(sig_15,10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
         when alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            mem_adr_wire <= conv_std_logic_vector(unsigned(sig_17),10);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
         when alwaysidle_datapathdisplay_resultread_cmdincr_upc =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= conv_std_logic_vector(0,8);
            ramadr <= conv_std_logic_vector(unsigned(upc),16);
            wr <= '0';
            rcmd_wire <= ramodata;
            sig_41 <= unsigned(upc) + unsigned(conv_std_logic_vector(1,10));
            upc_wire <= sig_41;
         when alwaysincr_mem_adrread_data_to_pidle_datapath =>
            rcnt_wire <= cnt;
            sig_24 <= unsigned(mem_adr) + unsigned(conv_std_logic_vector(1,10));
            mem_adr_wire <= sig_24;
            ramidata <= logic_zero_ext(sig_34,8);
            ramadr <= conv_std_logic_vector(unsigned(mem_adr),16);
            wr <= '0';
            sig_35 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(reg_p),1032),conv_unsigned(8,1032)),1032);
            sig_36 <= sig_35 or conv_std_logic_vector(unsigned(ramodata),1032);
            reg_p_wire <= sig_36(1023 downto 0);
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
         when alwaysincr_mem_adrread_data_to_uidle_datapath =>
            rcnt_wire <= cnt;
            sig_24 <= unsigned(mem_adr) + unsigned(conv_std_logic_vector(1,10));
            mem_adr_wire <= sig_24;
            ramidata <= logic_zero_ext(sig_26,8);
            ramadr <= conv_std_logic_vector(unsigned(mem_adr),16);
            wr <= '0';
            sig_27 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(reg_u),1032),conv_unsigned(8,1032)),1032);
            sig_28 <= sig_27 or conv_std_logic_vector(unsigned(ramodata),1032);
            reg_u_wire <= sig_28(1023 downto 0);
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
         when alwaysincr_mem_adrread_data_to_vidle_datapath =>
            rcnt_wire <= cnt;
            sig_24 <= unsigned(mem_adr) + unsigned(conv_std_logic_vector(1,10));
            mem_adr_wire <= sig_24;
            ramidata <= logic_zero_ext(sig_30,8);
            ramadr <= conv_std_logic_vector(unsigned(mem_adr),16);
            wr <= '0';
            sig_31 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(reg_v),1032),conv_unsigned(8,1032)),1032);
            sig_32 <= sig_31 or conv_std_logic_vector(unsigned(ramodata),1032);
            reg_v_wire <= sig_32(1023 downto 0);
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
         when alwaysidle_datapathcount_initdisplay_inputno_read =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            counter_wire <= conv_std_logic_vector(1024,11);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwaysp_mulsel_prodsel_addno_shiftassign_Rsel_x_rcountno_read =>
            rcnt_wire <= cnt;
            if (S(0) = '1') then
               sig_0 <= conv_std_logic_vector(unsigned(reg_u),1026);
            else
               sig_0 <= conv_std_logic_vector(0,1026);
            end if;
            prod <= sig_0;
            sig_1 <= conv_std_logic_vector(shr(unsigned(S),conv_unsigned(1,1026)),1026);
            S_wire <= sig_1;
            y <= prod;
            int_k <= '1';
            shift_en <= '0';
            shift_dir <= '0';
            R_wire <= res;
            x <= R;
            sig_5 <= unsigned(counter) - unsigned(conv_std_logic_vector(1,11));
            counter_wire <= sig_5;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_y_0sel_addshift_rightassign_Rsel_x_rno_readq_reg_update =>
            rcnt_wire <= cnt;
            y <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            shift_en <= '1';
            shift_dir <= '0';
            R_wire <= res;
            x <= R;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
            sig_2 <= conv_std_logic_vector(shl(unsigned(logic_zero_ext(R(0),1024)),conv_unsigned(1023,1024)),1024);
            sig_3 <= conv_std_logic_vector(shr(unsigned(Q),conv_unsigned(1,1024)),1024);
            sig_4 <= sig_2 or sig_3;
            Q_wire <= sig_4;
         when alwayssel_y_Msel_addshift_rightassign_Rsel_x_rno_readq_reg_update =>
            rcnt_wire <= cnt;
            y <= conv_std_logic_vector(unsigned(reg_p),1026);
            int_k <= '1';
            shift_en <= '1';
            shift_dir <= '0';
            R_wire <= res;
            x <= R;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
            sig_2 <= conv_std_logic_vector(shl(unsigned(logic_zero_ext(R(0),1024)),conv_unsigned(1023,1024)),1024);
            sig_3 <= conv_std_logic_vector(shr(unsigned(Q),conv_unsigned(1,1024)),1024);
            sig_4 <= sig_2 or sig_3;
            Q_wire <= sig_4;
         when alwayssel_x_rsel_y_Msel_subget_signno_shiftno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= conv_std_logic_vector(unsigned(reg_p),1026);
            int_k <= '0';
            sign_wire <= int_res(1025);
            shift_en <= '0';
            shift_dir <= '0';
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_subsel_y_Mno_shiftassign_Rsel_x_rno_read =>
            rcnt_wire <= cnt;
            int_k <= '0';
            y <= conv_std_logic_vector(unsigned(reg_p),1026);
            shift_en <= '0';
            shift_dir <= '0';
            R_wire <= res;
            x <= R;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwaysidle_datapathno_readdisplay_q =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_qsel_y_0sel_subno_shiftno_readinit_mem_adr_80 =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(Q),1026);
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '0';
            shift_dir <= '0';
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
            mem_adr_wire <= conv_std_logic_vector(unsigned(sig_17),10);
         when alwaysinit_inverseidle_datapathno_read =>
            rcnt_wire <= cnt;
            S_wire <= conv_std_logic_vector(1,1026);
            R_wire <= conv_std_logic_vector(0,1026);
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_vsel_y_usel_subget_signno_shiftno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_v),1026);
            y <= conv_std_logic_vector(unsigned(reg_u),1026);
            int_k <= '0';
            sign_wire <= int_res(1025);
            shift_en <= '0';
            shift_dir <= '0';
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_0sel_y_0sel_subno_shiftno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(0,1026);
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '0';
            shift_dir <= '0';
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_usel_y_0sel_subshift_rightassign_uno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_u),1026);
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '0';
            reg_u_wire <= res(1023 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_vsel_y_0sel_subshift_rightassign_vno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_v),1026);
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '0';
            reg_v_wire <= res(1023 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_vsel_y_usel_subshift_rightassign_vno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_v),1026);
            y <= conv_std_logic_vector(unsigned(reg_u),1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '0';
            reg_v_wire <= res(1023 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_usel_y_vsel_subshift_rightassign_uno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_u),1026);
            y <= conv_std_logic_vector(unsigned(reg_v),1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '0';
            reg_u_wire <= res(1023 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_ssel_y_0sel_subshift_leftassign_sno_read =>
            rcnt_wire <= cnt;
            x <= S;
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '1';
            S_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_rsel_y_0sel_subshift_leftassign_rno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '1';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_rsel_y_ssel_addno_shiftassign_rno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= S;
            int_k <= '1';
            shift_en <= '0';
            shift_dir <= '0';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_ssel_y_rsel_addno_shiftassign_sno_read =>
            rcnt_wire <= cnt;
            x <= S;
            y <= R;
            int_k <= '1';
            shift_en <= '0';
            shift_dir <= '0';
            S_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_powersel_y_1sel_addno_shiftassign_powerno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(power),1026);
            y <= conv_std_logic_vector(1,1026);
            int_k <= '1';
            shift_en <= '0';
            shift_dir <= '0';
            power_wire <= res(15 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_rsel_y_pregsel_subno_shiftassign_rno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= conv_std_logic_vector(unsigned(reg_p),1026);
            int_k <= '0';
            shift_en <= '0';
            shift_dir <= '0';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_pregsel_y_rsel_subno_shiftassign_rno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(reg_p),1026);
            y <= R;
            int_k <= '0';
            shift_en <= '0';
            shift_dir <= '0';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_rsel_y_0sel_subshift_rightassign_rno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= conv_std_logic_vector(0,1026);
            int_k <= '0';
            shift_en <= '1';
            shift_dir <= '0';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_rsel_y_pregsel_addshift_rightassign_rno_read =>
            rcnt_wire <= cnt;
            x <= R;
            y <= conv_std_logic_vector(unsigned(reg_p),1026);
            int_k <= '1';
            shift_en <= '1';
            shift_dir <= '0';
            R_wire <= res;
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwayssel_x_powersel_y_1sel_subno_shiftassign_powerno_read =>
            rcnt_wire <= cnt;
            x <= conv_std_logic_vector(unsigned(power),1026);
            y <= conv_std_logic_vector(1,1026);
            int_k <= '0';
            shift_en <= '0';
            shift_dir <= '0';
            power_wire <= res(15 downto 0);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
         when alwaysidle_datapathno_readcopy_R_to_u =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            ramidata <= logic_zero_ext(sig_43,8);
            ramadr <= logic_zero_ext(sig_45,16);
            wr <= '0';
            reg_u_wire <= R(1023 downto 0);
         when alwaysidle_datapathincr_mem_adrwrite_data =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            sig_24 <= unsigned(mem_adr) + unsigned(conv_std_logic_vector(1,10));
            mem_adr_wire <= sig_24;
            ramidata <= R(1023 downto 1016);
            ramadr <= conv_std_logic_vector(unsigned(mem_adr),16);
            wr <= '1';
            sig_37 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(R),1034),conv_unsigned(8,1034)),1034);
            R_wire <= sig_37(1025 downto 0);
         when alwaysidle_datapathincr_mem_adrwrite_data_from_q =>
            rcnt_wire <= cnt;
            shift_en <= '0';
            shift_dir <= '0';
            prod <= conv_std_logic_vector(0,1026);
            int_k <= '1';
            y <= conv_std_logic_vector(0,1026);
            x <= conv_std_logic_vector(0,1026);
            sig_24 <= unsigned(mem_adr) + unsigned(conv_std_logic_vector(1,10));
            mem_adr_wire <= sig_24;
            ramidata <= Q(1023 downto 1016);
            ramadr <= conv_std_logic_vector(unsigned(mem_adr),16);
            wr <= '1';
            sig_38 <= conv_std_logic_vector(shl(conv_unsigned(unsigned(Q),1032),conv_unsigned(8,1032)),1032);
            Q_wire <= sig_38(1023 downto 0);
         when others=>
      end case;
   end process dpCMB;


--controller reg
fsmREG: process (CLK,RST)
   begin
      if (RST = '1') then
         STATE <= s_init;
      elsif CLK' event and CLK = '1' then
         STATE <= STATE;
         case STATE is
            when s_init => 
                    STATE <= s_fetch_1;
            when s_fetch_1 => 
               if (sig_48 = '1') then
                       STATE <= s_fetch_2;
               else
                       STATE <= s_fetch_1;
               end if;
            when s_fetch_2 => 
               if (sig_51 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_fetch_2;
               end if;
            when s_fetchdecode => 
               if (sig_54 = '1') then
                       STATE <= s_fetch_1;
               else
                  if (sig_57 = '1') then
                          STATE <= s_monpro_0;
                  else
                     if (sig_60 = '1') then
                             STATE <= s_monpro_0;
                     else
                        if (sig_63 = '1') then
                                STATE <= s_init_loadP;
                        else
                           if (sig_66 = '1') then
                                   STATE <= s_inv_0;
                           else
                              if (sig_69 = '1') then
                                      STATE <= s_loadU_1;
                              else
                                 if (sig_72 = '1') then
                                         STATE <= s_loadU_2;
                                 else
                                    if (sig_75 = '1') then
                                            STATE <= s_loadU_3;
                                    else
                                       if (sig_78 = '1') then
                                               STATE <= s_loadV_1;
                                       else
                                          if (sig_81 = '1') then
                                                  STATE <= s_loadV_2;
                                          else
                                             if (sig_84 = '1') then
                                                     STATE <= s_loadV_3;
                                             else
                                                if (sig_87 = '1') then
                                                        STATE <= s_write_res;
                                                else
                                                   if (sig_90 = '1') then
                                                           STATE <= s_write_res1;
                                                   else
                                                      if (sig_93 = '1') then
                                                              STATE <= s_write_res2;
                                                      else
                                                         if (sig_96 = '1') then
                                                                 STATE <= s_write_res3;
                                                         else
                                                            if (sig_99 = '1') then
                                                                    STATE <= s_write_res4;
                                                            else
                                                               if (sig_102 = '1') then
                                                                       STATE <= s_write_res5;
                                                               else
                                                                  if (sig_105 = '1') then
                                                                          STATE <= s_fetchdecode;
                                                                  else
                                                                          STATE <= s_fetchdecode;
                                                                  end if;
                                                               end if;
                                                            end if;
                                                         end if;
                                                      end if;
                                                   end if;
                                                end if;
                                             end if;
                                          end if;
                                       end if;
                                    end if;
                                 end if;
                              end if;
                           end if;
                        end if;
                     end if;
                  end if;
               end if;
            when s_init_loadP => 
               if (sig_108 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_init_loadP;
               end if;
            when s_loadU_1 => 
               if (sig_111 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadU_1;
               end if;
            when s_loadU_2 => 
               if (sig_114 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadU_2;
               end if;
            when s_loadU_3 => 
               if (sig_117 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadU_3;
               end if;
            when s_loadV_1 => 
               if (sig_120 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadV_1;
               end if;
            when s_loadV_2 => 
               if (sig_123 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadV_2;
               end if;
            when s_loadV_3 => 
               if (sig_126 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_loadV_3;
               end if;
            when s_monpro_0 => 
                    STATE <= s_monpro_1;
            when s_monpro_1 => 
               if (sig_127 = '1') then
                       STATE <= s_monpro_3;
               else
                       STATE <= s_monpro_2;
               end if;
            when s_monpro_2 => 
               if (sig_128 = '1') then
                       STATE <= s_monpro_1;
               else
                       STATE <= s_monpro_1;
               end if;
            when s_monpro_3 => 
                    STATE <= s_monpro_4;
            when s_monpro_4 => 
               if (sig_129 = '1') then
                       STATE <= s_monpro_congruentQ;
               else
                       STATE <= s_finished;
               end if;
            when s_monpro_congruentQ => 
                    STATE <= s_write_res4;
            when s_inv_0 => 
                    STATE <= s_inv_cmpvgteu;
            when s_inv_cmpvgteu => 
                    STATE <= s_inv_1;
            when s_inv_1 => 
               if (sig_130 = '1') then
                       STATE <= s_inv_6;
               else
                  if (sig_131 = '1') then
                          STATE <= s_inv_21;
                  else
                     if (sig_132 = '1') then
                             STATE <= s_inv_22;
                     else
                        if (sig_133 = '1') then
                                STATE <= s_inv_41;
                        else
                                STATE <= s_inv_31;
                        end if;
                     end if;
                  end if;
               end if;
            when s_inv_21 => 
                    STATE <= s_inv_5;
            when s_inv_22 => 
                    STATE <= s_inv_5;
            when s_inv_31 => 
                    STATE <= s_inv_32;
            when s_inv_32 => 
                    STATE <= s_inv_5;
            when s_inv_41 => 
                    STATE <= s_inv_42;
            when s_inv_42 => 
                    STATE <= s_inv_5;
            when s_inv_5 => 
                    STATE <= s_inv_cmpvgteu;
            when s_inv_6 => 
                    STATE <= s_inv_gtep;
            when s_inv_gtep => 
               if (sig_134 = '1') then
                       STATE <= s_inv_7;
               else
                       STATE <= s_inv_7;
               end if;
            when s_inv_7 => 
                    STATE <= s_inv_8;
            when s_inv_8 => 
               if (sig_135 = '1') then
                       STATE <= s_finished;
               else
                  if (sig_136 = '1') then
                          STATE <= s_inv_9;
                  else
                          STATE <= s_inv_9;
                  end if;
               end if;
            when s_inv_9 => 
                    STATE <= s_inv_8;
            when s_finished => 
                    STATE <= s_fetchdecode;
            when s_write_res => 
               if (sig_139 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_write_res;
               end if;
            when s_write_res1 => 
               if (sig_142 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_write_res1;
               end if;
            when s_write_res2 => 
               if (sig_145 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_write_res2;
               end if;
            when s_write_res3 => 
               if (sig_148 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_write_res3;
               end if;
            when s_write_res4 => 
               if (sig_151 = '1') then
                       STATE <= s_finished;
               else
                       STATE <= s_write_res4;
               end if;
            when s_write_res5 => 
               if (sig_154 = '1') then
                       STATE <= s_fetchdecode;
               else
                       STATE <= s_write_res5;
               end if;
            when others=>
         end case;
      end if;
   end process fsmREG;


--controller cmb
fsmCMB: process (cnt,ramidata,ramodata,ramadr,wr,t_out,shift_en,shift_dir,d,mem_adr
,rcnt,upc,rcmd,sign,reg_p,reg_u,reg_v,R,S,counter
,Q,power,int_res,res,prod,x,y,p_in,int_k,sig_0
,sig_1,sig_2,sig_3,sig_4,sig_5,sig_24,sig_27,sig_28,sig_31,sig_32
,sig_35,sig_36,sig_37,sig_38,sig_41,sig_48,sig_51,sig_54,sig_57,sig_60
,sig_63,sig_66,sig_69,sig_72,sig_75,sig_78,sig_81,sig_84,sig_87,sig_90
,sig_93,sig_96,sig_99,sig_102,sig_105,sig_108,sig_111,sig_114,sig_117,sig_120
,sig_123,sig_126,sig_127,sig_128,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134
,sig_135,sig_136,sig_139,sig_142,sig_145,sig_148,sig_151,sig_154,cmd,STATE)
   begin
   sig_48 <= '0';
   sig_51 <= '0';
   sig_54 <= '0';
   sig_57 <= '0';
   sig_60 <= '0';
   sig_63 <= '0';
   sig_66 <= '0';
   sig_69 <= '0';
   sig_72 <= '0';
   sig_75 <= '0';
   sig_78 <= '0';
   sig_81 <= '0';
   sig_84 <= '0';
   sig_87 <= '0';
   sig_90 <= '0';
   sig_93 <= '0';
   sig_96 <= '0';
   sig_99 <= '0';
   sig_102 <= '0';
   sig_105 <= '0';
   sig_108 <= '0';
   sig_111 <= '0';
   sig_114 <= '0';
   sig_117 <= '0';
   sig_120 <= '0';
   sig_123 <= '0';
   sig_126 <= '0';
   sig_127 <= '0';
   sig_128 <= '0';
   sig_129 <= '0';
   sig_130 <= '0';
   sig_131 <= '0';
   sig_132 <= '0';
   sig_133 <= '0';
   sig_134 <= '0';
   sig_135 <= '0';
   sig_136 <= '0';
   sig_139 <= '0';
   sig_142 <= '0';
   sig_145 <= '0';
   sig_148 <= '0';
   sig_151 <= '0';
   sig_154 <= '0';
   if (unsigned(rcnt) = unsigned(sig_47)) then
      sig_48 <= '1';
   else
      sig_48 <= '0';
   end if;
   if (unsigned(rcnt) = unsigned(sig_50)) then
      sig_51 <= '1';
   else
      sig_51 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_53)) then
      sig_54 <= '1';
   else
      sig_54 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_56)) then
      sig_57 <= '1';
   else
      sig_57 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_59)) then
      sig_60 <= '1';
   else
      sig_60 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_62)) then
      sig_63 <= '1';
   else
      sig_63 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_65)) then
      sig_66 <= '1';
   else
      sig_66 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_68)) then
      sig_69 <= '1';
   else
      sig_69 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_71)) then
      sig_72 <= '1';
   else
      sig_72 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_74)) then
      sig_75 <= '1';
   else
      sig_75 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_77)) then
      sig_78 <= '1';
   else
      sig_78 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_80)) then
      sig_81 <= '1';
   else
      sig_81 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_83)) then
      sig_84 <= '1';
   else
      sig_84 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_86)) then
      sig_87 <= '1';
   else
      sig_87 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_89)) then
      sig_90 <= '1';
   else
      sig_90 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_92)) then
      sig_93 <= '1';
   else
      sig_93 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_95)) then
      sig_96 <= '1';
   else
      sig_96 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_98)) then
      sig_99 <= '1';
   else
      sig_99 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_101)) then
      sig_102 <= '1';
   else
      sig_102 <= '0';
   end if;
   if (unsigned(rcmd) = unsigned(sig_104)) then
      sig_105 <= '1';
   else
      sig_105 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_107)) then
      sig_108 <= '1';
   else
      sig_108 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_110)) then
      sig_111 <= '1';
   else
      sig_111 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_113)) then
      sig_114 <= '1';
   else
      sig_114 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_116)) then
      sig_117 <= '1';
   else
      sig_117 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_119)) then
      sig_120 <= '1';
   else
      sig_120 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_122)) then
      sig_123 <= '1';
   else
      sig_123 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_125)) then
      sig_126 <= '1';
   else
      sig_126 <= '0';
   end if;
   if (unsigned(counter) = 0) then
      sig_127 <= '1';
   else
      sig_127 <= '0';
   end if;
   if (R(0) = '0') then
      sig_128 <= '1';
   else
      sig_128 <= '0';
   end if;
   if (sign = '0') then
      sig_129 <= '1';
   else
      sig_129 <= '0';
   end if;
   if (unsigned(reg_v) = 0) then
      sig_130 <= '1';
   else
      sig_130 <= '0';
   end if;
   sig_131 <=  not reg_u(0);
   sig_132 <=  not reg_v(0);
   if (sign = '0') then
      sig_133 <= '1';
   else
      sig_133 <= '0';
   end if;
   if (sign = '0') then
      sig_134 <= '1';
   else
      sig_134 <= '0';
   end if;
   if (unsigned(power) = 1024) then
      sig_135 <= '1';
   else
      sig_135 <= '0';
   end if;
   sig_136 <=  not R(0);
   if (unsigned(mem_adr) = unsigned(sig_138)) then
      sig_139 <= '1';
   else
      sig_139 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_141)) then
      sig_142 <= '1';
   else
      sig_142 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_144)) then
      sig_145 <= '1';
   else
      sig_145 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_147)) then
      sig_148 <= '1';
   else
      sig_148 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_150)) then
      sig_151 <= '1';
   else
      sig_151 <= '0';
   end if;
   if (unsigned(mem_adr) = unsigned(sig_153)) then
      sig_154 <= '1';
   else
      sig_154 <= '0';
   end if;
   cmd <= alwaysidle_datapathinit_regsno_read;
   case STATE is
      when s_init => 
              cmd <= alwaysidle_datapathinit_regsno_read;
      when s_fetch_1 => 
         if (sig_48 = '1') then
                 cmd <= alwaysinit_upcset_not_doneidle_datapath;
         else
                 cmd <= alwaysidle_datapathno_read;
         end if;
      when s_fetch_2 => 
         if (sig_51 = '1') then
                 cmd <= alwaysidle_datapathread_cmdincr_upc;
         else
                 cmd <= alwaysidle_datapathno_read;
         end if;
      when s_fetchdecode => 
         if (sig_54 = '1') then
                 cmd <= alwaysidle_datapathset_done;
         else
            if (sig_57 = '1') then
                    cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro;
            else
               if (sig_60 = '1') then
                       cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upcinit_monpro_sq;
               else
                  if (sig_63 = '1') then
                          cmd <= alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc;
                  else
                     if (sig_66 = '1') then
                             cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upccopy_p_to_ucopy_u_to_v;
                     else
                        if (sig_69 = '1') then
                                cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc;
                        else
                           if (sig_72 = '1') then
                                   cmd <= alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc;
                           else
                              if (sig_75 = '1') then
                                      cmd <= alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc;
                              else
                                 if (sig_78 = '1') then
                                         cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc;
                                 else
                                    if (sig_81 = '1') then
                                            cmd <= alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc;
                                    else
                                       if (sig_84 = '1') then
                                               cmd <= alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc;
                                       else
                                          if (sig_87 = '1') then
                                                  cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc;
                                          else
                                             if (sig_90 = '1') then
                                                     cmd <= alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc;
                                             else
                                                if (sig_93 = '1') then
                                                        cmd <= alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc;
                                                else
                                                   if (sig_96 = '1') then
                                                           cmd <= alwaysidle_datapathinit_mem_adr_0read_cmdincr_upc;
                                                   else
                                                      if (sig_99 = '1') then
                                                              cmd <= alwaysidle_datapathinit_mem_adr_80read_cmdincr_upc;
                                                      else
                                                         if (sig_102 = '1') then
                                                                 cmd <= alwaysidle_datapathinit_mem_adr_100read_cmdincr_upc;
                                                         else
                                                            if (sig_105 = '1') then
                                                                    cmd <= alwaysidle_datapathdisplay_resultread_cmdincr_upc;
                                                            else
                                                                    cmd <= alwaysidle_datapathno_read;
                                                            end if;
                                                         end if;
                                                      end if;
                                                   end if;
                                                end if;
                                             end if;
                                          end if;
                                       end if;
                                    end if;
                                 end if;
                              end if;
                           end if;
                        end if;
                     end if;
                  end if;
               end if;
            end if;
         end if;
      when s_init_loadP => 
         if (sig_108 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_pidle_datapath;
         end if;
      when s_loadU_1 => 
         if (sig_111 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_uidle_datapath;
         end if;
      when s_loadU_2 => 
         if (sig_114 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_uidle_datapath;
         end if;
      when s_loadU_3 => 
         if (sig_117 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_uidle_datapath;
         end if;
      when s_loadV_1 => 
         if (sig_120 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_vidle_datapath;
         end if;
      when s_loadV_2 => 
         if (sig_123 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_vidle_datapath;
         end if;
      when s_loadV_3 => 
         if (sig_126 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysincr_mem_adrread_data_to_vidle_datapath;
         end if;
      when s_monpro_0 => 
              cmd <= alwaysidle_datapathcount_initdisplay_inputno_read;
      when s_monpro_1 => 
         if (sig_127 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysp_mulsel_prodsel_addno_shiftassign_Rsel_x_rcountno_read;
         end if;
      when s_monpro_2 => 
         if (sig_128 = '1') then
                 cmd <= alwayssel_y_0sel_addshift_rightassign_Rsel_x_rno_readq_reg_update;
         else
                 cmd <= alwayssel_y_Msel_addshift_rightassign_Rsel_x_rno_readq_reg_update;
         end if;
      when s_monpro_3 => 
              cmd <= alwayssel_x_rsel_y_Msel_subget_signno_shiftno_read;
      when s_monpro_4 => 
         if (sig_129 = '1') then
                 cmd <= alwayssel_subsel_y_Mno_shiftassign_Rsel_x_rno_read;
         else
                 cmd <= alwaysidle_datapathno_readdisplay_q;
         end if;
      when s_monpro_congruentQ => 
              cmd <= alwayssel_x_qsel_y_0sel_subno_shiftno_readinit_mem_adr_80;
      when s_inv_0 => 
              cmd <= alwaysinit_inverseidle_datapathno_read;
      when s_inv_cmpvgteu => 
              cmd <= alwayssel_x_vsel_y_usel_subget_signno_shiftno_read;
      when s_inv_1 => 
         if (sig_130 = '1') then
                 cmd <= alwayssel_x_0sel_y_0sel_subno_shiftno_read;
         else
            if (sig_131 = '1') then
                    cmd <= alwayssel_x_usel_y_0sel_subshift_rightassign_uno_read;
            else
               if (sig_132 = '1') then
                       cmd <= alwayssel_x_vsel_y_0sel_subshift_rightassign_vno_read;
               else
                  if (sig_133 = '1') then
                          cmd <= alwayssel_x_vsel_y_usel_subshift_rightassign_vno_read;
                  else
                          cmd <= alwayssel_x_usel_y_vsel_subshift_rightassign_uno_read;
                  end if;
               end if;
            end if;
         end if;
      when s_inv_21 => 
              cmd <= alwayssel_x_ssel_y_0sel_subshift_leftassign_sno_read;
      when s_inv_22 => 
              cmd <= alwayssel_x_rsel_y_0sel_subshift_leftassign_rno_read;
      when s_inv_31 => 
              cmd <= alwayssel_x_rsel_y_ssel_addno_shiftassign_rno_read;
      when s_inv_32 => 
              cmd <= alwayssel_x_ssel_y_0sel_subshift_leftassign_sno_read;
      when s_inv_41 => 
              cmd <= alwayssel_x_ssel_y_rsel_addno_shiftassign_sno_read;
      when s_inv_42 => 
              cmd <= alwayssel_x_rsel_y_0sel_subshift_leftassign_rno_read;
      when s_inv_5 => 
              cmd <= alwayssel_x_powersel_y_1sel_addno_shiftassign_powerno_read;
      when s_inv_6 => 
              cmd <= alwayssel_x_rsel_y_Msel_subget_signno_shiftno_read;
      when s_inv_gtep => 
         if (sig_134 = '1') then
                 cmd <= alwayssel_x_rsel_y_pregsel_subno_shiftassign_rno_read;
         else
                 cmd <= alwayssel_x_0sel_y_0sel_subno_shiftno_read;
         end if;
      when s_inv_7 => 
              cmd <= alwayssel_x_pregsel_y_rsel_subno_shiftassign_rno_read;
      when s_inv_8 => 
         if (sig_135 = '1') then
                 cmd <= alwayssel_x_0sel_y_0sel_subno_shiftno_read;
         else
            if (sig_136 = '1') then
                    cmd <= alwayssel_x_rsel_y_0sel_subshift_rightassign_rno_read;
            else
                    cmd <= alwayssel_x_rsel_y_pregsel_addshift_rightassign_rno_read;
            end if;
         end if;
      when s_inv_9 => 
              cmd <= alwayssel_x_powersel_y_1sel_subno_shiftassign_powerno_read;
      when s_finished => 
              cmd <= alwaysidle_datapathno_readcopy_R_to_u;
      when s_write_res => 
         if (sig_139 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data;
         end if;
      when s_write_res1 => 
         if (sig_142 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data;
         end if;
      when s_write_res2 => 
         if (sig_145 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data;
         end if;
      when s_write_res3 => 
         if (sig_148 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data_from_q;
         end if;
      when s_write_res4 => 
         if (sig_151 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data_from_q;
         end if;
      when s_write_res5 => 
         if (sig_154 = '1') then
                 cmd <= alwaysidle_datapathno_read;
         else
                 cmd <= alwaysidle_datapathincr_mem_adrwrite_data_from_q;
         end if;
      when others=>
      end case;
end process fsmCMB;
end RTL;
