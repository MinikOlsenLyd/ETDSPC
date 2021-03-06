-- ============================================================================
-- Copyright (c) 2013 by Terasic Technologies Inc.
-- ============================================================================
--
-- Permission:
--
--   Terasic grants permission to use and modify this code for use
--   in synthesis for all Terasic Development Boards and Altera Development 
--   Kits made by Terasic.  Other use of this code, including the selling 
--   ,duplication, or modification of any portion is strictly prohibited.
--
-- Disclaimer:
--
--   This VHDL/Verilog or C/C++ source code is intended as a design reference
--   which illustrates how these types of functions can be implemented.
--   It is the user's responsibility to verify their design for
--   consistency and functionality through the use of formal
--   verification methods.  Terasic provides no warranty regarding the use 
--   or functionality of this code.
--
-- ============================================================================
--           
--  Terasic Technologies Inc
--  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
--  
--  
--                     web: http:--www.terasic.com/  
--                     email: support@terasic.com
--
-- ============================================================================
--Date:  Mon Jun 17 20:35:29 2013
-- ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity de1soc_audio_no_hps_top is
  port (
    --ADC_CS_N       : inout   std_logic;
    --ADC_DIN        : out  std_logic;
    --ADC_DOUT       : in   std_logic;
    --ADC_SCLK       : out  std_logic;
    
    AUD_ADCDAT     : in   std_logic;
    AUD_ADCLRCK    : inout   std_logic;
    AUD_BCLK       : inout   std_logic;
    AUD_DACDAT     : out  std_logic;
    AUD_DACLRCK    : inout   std_logic;
    AUD_XCK        : out  std_logic;
    
    CLOCK2_50      : in   std_logic;
    
    CLOCK3_50      : in   std_logic;
    
    CLOCK4_50      : in   std_logic;
    
    CLOCK_50       : in   std_logic;
    
    --DRAM_ADDR      : out  std_logic_vector(12 downto 0);
    --DRAM_BA        : out  std_logic_vector(1 downto 0);
    --DRAM_CAS_N     : out  std_logic;
    --DRAM_CKE       : out  std_logic;
    --DRAM_CLK       : out  std_logic;
    --DRAM_CS_N      : out  std_logic;
    --DRAM_DQ        : inout   std_logic_vector(15 downto 0);
    --DRAM_LDQM      : out  std_logic;
    --DRAM_RAS_N     : out  std_logic;
    --DRAM_UDQM      : out  std_logic;
    --DRAM_WE_N      : out  std_logic;
    
    --FAN_CTRL       : out  std_logic;
    
    FPGA_I2C_SCLK  : out  std_logic;
    FPGA_I2C_SDAT  : inout   std_logic;
    
    GPIO_0         : inout   std_logic_vector(35 downto 0);
    GPIO_1         : inout   std_logic_vector(35 downto 0);

    --HEX0           : out  std_logic_vector(6 downto 0);
    --HEX1           : out  std_logic_vector(6 downto 0);
    --HEX2           : out  std_logic_vector(6 downto 0);
    --HEX3           : out  std_logic_vector(6 downto 0);
    --HEX4           : out  std_logic_vector(6 downto 0);
    --HEX5           : out  std_logic_vector(6 downto 0);

    -- HPS_CONV_USB_N : inout   std_logic;
    -- HPS_DDR3_ADDR  : out  std_logic_vector(14 downto 0);
    -- HPS_DDR3_BA    : out  std_logic_vector(2 downto 0);
    -- HPS_DDR3_CAS_N : out  std_logic;
    -- HPS_DDR3_CKE   : out  std_logic;
    -- HPS_DDR3_CK_N  : out  std_logic;
    -- HPS_DDR3_CK_P  : out  std_logic;
    -- HPS_DDR3_CS_N  : out  std_logic;
    -- HPS_DDR3_DM    : out  std_logic_vector(3 downto 0);
    -- HPS_DDR3_DQ    : inout   std_logic_vector(31 downto 0);
    -- HPS_DDR3_DQS_N : inout   std_logic_vector(3 downto 0);
    -- HPS_DDR3_DQS_P : inout   std_logic_vector(3 downto 0);
    -- HPS_DDR3_ODT   : out  std_logic;
    -- HPS_DDR3_RAS_N : out  std_logic;
    -- HPS_DDR3_RESET_N:out   std_logic;
    -- HPS_DDR3_RZQ   : in   std_logic;
    -- HPS_DDR3_WE_N   :out  std_logic;
    -- HPS_ENET_GTX_CLK : out   std_logic;
    -- HPS_ENET_INT_N  :inout   std_logic;
    -- HPS_ENET_MDC    :out  std_logic;
    -- HPS_ENET_MDIO   :inout   std_logic;
    -- HPS_ENET_RX_CLK :in   std_logic;
    -- HPS_ENET_RX_DATA:in    std_logic_vector(3 downto 0);
    -- HPS_ENET_RX_DV  :in   std_logic;
    -- HPS_ENET_TX_DATA:out   std_logic_vector(3 downto 0);
    -- HPS_ENET_TX_EN  :out  std_logic;
    -- HPS_FLASH_DATA  :inout   std_logic_vector(3 downto 0);
    -- HPS_FLASH_DCLK  :out  std_logic;
    -- HPS_FLASH_NCSO  :out  std_logic;
    -- HPS_GSENSOR_INT :inout   std_logic;
    -- HPS_I2C1_SCLK   :inout   std_logic;
    -- HPS_I2C1_SDAT   :inout   std_logic;
    -- HPS_I2C2_SCLK   :inout   std_logic;
    -- HPS_I2C2_SDAT   :inout   std_logic;
    -- HPS_I2C_CONTROL :inout   std_logic;
    -- HPS_KEY         :inout   std_logic;
    -- HPS_LED         :inout   std_logic;
    -- HPS_LTC_GPIO    :inout   std_logic;
    -- HPS_SD_CLK      :out  std_logic;
    -- HPS_SD_CMD      :inout   std_logic;
    -- HPS_SD_DATA     :inout   std_logic_vector(3 downto 0);
    -- HPS_SPIM_CLK    :out  std_logic;
    -- HPS_SPIM_MISO   :in   std_logic;
    -- HPS_SPIM_MOSI   :out  std_logic;
    -- HPS_SPIM_SS     :inout   std_logic;
    -- HPS_UART_RX     :in   std_logic;
    -- HPS_UART_TX     :out  std_logic;
    -- HPS_USB_CLKOUT  :in   std_logic;
    -- HPS_USB_DATA    :inout   std_logic_vector(7 downto 0);
    -- HPS_USB_DIR     :in   std_logic;
    -- HPS_USB_NXT     :in   std_logic;
    -- HPS_USB_STP     :out  std_logic;
    
    --IRDA_RXD        :in   std_logic;
    --IRDA_TXD        :out  std_logic;
    
    KEY             :in   std_logic_vector(3 downto 0);
    
    LEDR            :out std_logic_vector(9 downto 0); 
    
    --PS2_CLK         :inout   std_logic;
    --PS2_CLK2        :inout   std_logic;
    --PS2_DAT         :inout   std_logic;
    --PS2_DAT2        :inout   std_logic;
    
    SW              :in   std_logic_vector(9 downto 0);
       
    --VGA_B           :out  std_logic_vector(7 downto 0);
    --VGA_BLANK_N     :out  std_logic;
    --VGA_CLK         :out  std_logic;
    --VGA_G           :out  std_logic_vector(7 downto 0);
    --VGA_HS          :out  std_logic;
    --VGA_R           :out  std_logic_vector(7 downto 0);
    --VGA_SYNC_N      :out  std_logic;
    --VGA_VS	       :out  std_logic;

    TD_CLK27        :in   std_logic;
    TD_DATA         :in   std_logic_vector(7 downto 0);
    TD_HS           :in   std_logic;
    TD_RESET_N      :out  std_logic;
    TD_VS           :in   std_logic
	
   );

end de1soc_audio_no_hps_top;

architecture behaviour of de1soc_audio_no_hps_top is

signal aud_clk_12M : std_logic;
signal aud_clk_48K : std_logic;
signal aud_reset : std_logic;
signal sys_reset : std_logic;
signal sys_clk_50M : std_logic;

-- ST Interface
signal   ast_clk_48K          : std_logic;
signal   ast_reset_n          : std_logic;
signal   ast_from_adc_data    : std_logic_vector(23 downto 0);
signal   ast_from_adc_ready   : std_logic;
signal   ast_from_adc_valid   : std_logic;
signal   ast_from_adc_error   : std_logic_vector(1 downto 0);
signal   ast_to_dac_data  : std_logic_vector(23 downto 0);
signal   ast_to_dac_ready : std_logic;
signal   ast_to_dac_valid : std_logic;
signal   ast_to_dac_error : std_logic_vector(1 downto 0);

component iis2st is
  port (
    ast_clk_48K      : in  std_logic;   
    ast_reset_n      : in  std_logic;
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic                     := '0';  
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    ast_source_data  : out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic                     := '0';
    ast_source_error : out std_logic_vector(1 downto 0)  := (others => '0');
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic                     := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic
    );
end component iis2st;

begin

   -- Component to Init Audio Codec and generate clock
   comp_audio_clk_config : entity work.audio_clk_config
      port map (
                sys_clk_50M  => sys_clk_50M,
                sys_reset    => sys_reset,
                aud_clk_12M  => aud_clk_12M,
                aud_reset    => aud_reset,
                aud_i2c_sdat => FPGA_I2C_SDAT,
                aud_i2c_sclk => FPGA_I2C_SCLK
   );

   
    comp_iis2st : entity work.iis2st(rtl) --iis2st(rtl)
      port map (
                ast_clk_48K      => ast_clk_48K,
                ast_reset_n      => ast_reset_n,
                ast_sink_data    => ast_to_dac_data,
                ast_sink_ready   => ast_to_dac_ready,
                ast_sink_valid   => ast_to_dac_valid,
                ast_sink_error   => ast_to_dac_error,
                ast_source_data  => ast_from_adc_data,
                ast_source_ready => ast_from_adc_ready,
                ast_source_valid => ast_from_adc_valid,
                ast_source_error => ast_from_adc_error,
                bitclk           => AUD_BCLK,
                adcdat           => AUD_ADCDAT,
                dacdat           => AUD_DACDAT,
                adclrck          => AUD_ADCLRCK,
                daclrck          => AUD_DACLRCK
   );

  -- ST-Bus Loopback
  ast_to_dac_data <= ast_from_adc_data;
  ast_to_dac_ready <= ast_from_adc_ready;
  ast_to_dac_valid <= ast_from_adc_valid;
  ast_to_dac_error <= ast_from_adc_error;
   
  -- Leds for debugging  
  ledr <= "000" & AUD_BCLK & AUD_ADCLRCK & aud_reset & KEY;

  -- Mapping of clock and reset
  sys_clk_50M <= CLOCK_50;
  ast_clk_48K <= AUD_ADCLRCK;   -- ST-bus clock is driven by the Codec
  ast_reset_n <= KEY(0);        -- AST Reset is active low
  sys_reset <= not KEY(0);      -- SYS reset is active High!

  
----------------------------------------------------------
-- AUDIO Interface 
--
-- Default configuration when using auto initialize:
-- AUD_XCK : Clk source, Output to Codec, 12.288MHz
-- AUD_BCLK: Bit clk, Input from Codec, 12.288MHz
-- AUD_ADCLRCK: ADC sync, Input from Codec, 48KHz
-- AUD_DACLRCK: DAC Sync, Input from Codec, 48KHz
-- ADCDAT: ADC I2S Data, Output from codec
-- DACDAT: DAC I2S Data, Input to codec
----------------------------------------------------------

  -- Clock codec at 12.288 MHz
  AUD_XCK <= aud_clk_12M;

  -- Loopback ADC data to DAC
  --AUD_DACDAT <= AUD_ADCDAT;
 
end behaviour;