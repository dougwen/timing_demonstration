--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Tue Feb 22 17:42:59 2022
--Host        : WENSTDS1-WL3 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity toplevel is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    
    UART_1_0_rxd : in STD_LOGIC;
    UART_1_0_txd : out STD_LOGIC;
    
    sw : in std_logic_vector(3 downto 0);
    btn : in std_logic_vector(3 downto 0);
    leds : out std_logic_Vector(3 downto 0);
    clk_in : in std_logic
  );
end toplevel;

architecture STRUCTURE of toplevel is
   component design_1 is
  port (
    FCLK_RESET0_N_0 : out STD_LOGIC;
    FCLK_CLK0_0 : out STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    UART_1_0_txd : out STD_LOGIC;
    UART_1_0_rxd : in STD_LOGIC
  );
  end component design_1;

component clkdivider is
    generic (divideby : natural := 2);
    Port ( clk : in std_logic;
           reset : in std_logic;
           pulseout : out std_logic);
end component;
  

  type statetype is (idle,state0,state1,state2,state3);    
  signal cs : statetype; 
  signal clk125_ps : std_logic;
  signal  clk125_pin : std_logic;
  signal advance_pulse : std_Logic;
  
begin

-- plop down the ps7 just to get a clock honestly and so we can have a boot.bin
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      UART_1_0_rxd => UART_1_0_rxd,
      UART_1_0_txd => UART_1_0_txd,
      FCLK_RESET0_N_0 => open,
      FCLK_CLK0_0 => clk125_ps
    );

 fsm: process(clk125_ps)
    begin
        if sw(0) <= '0' then
            cs <= idle;
        elsif rising_edge(clk125_ps) then
            case cs is
                when idle =>
                    if btn = "0001" or (advance_pulse='1' and sw(1)='1') then cs <= state0; end if;
                when state0 =>
                    if btn = "0010" or (advance_pulse='1' and sw(1)='1') then cs <= state1; end if;
                 when state1 =>
                    if btn = "0100" or (advance_pulse='1' and sw(1)='1') then cs <= state2; end if;
                 when state2 =>
                    if btn = "1000" or (advance_pulse='1' and sw(1)='1') then cs <= state3; end if;
                 when state3 =>
                    if btn = "0001" or (advance_pulse='1' and sw(1)='1') then cs <= state0; end if;
             end case;
         end if;
    end process fsm;

-- advance 4x per second to speed things along
makeadvance: clkdivider generic map (divideby => 15000000) 
    port map (clk => clk125_pin, reset=> '0', pulseout => advance_pulse);

clk125_pin <= clk_in;

leds(0) <= '1' when cs = state0 else '0';
leds(1) <= '1' when cs = state1 else '0';
leds(2) <= '1' when cs = state2 else '0';
leds(3) <= '1' when cs = state3 else '0';


end STRUCTURE;
