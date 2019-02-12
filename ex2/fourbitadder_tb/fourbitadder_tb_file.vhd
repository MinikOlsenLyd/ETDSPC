library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;
use work.io_utils.all;

entity fourbitadder_tb_file is
    GENERIC (
	   file_len:INTEGER            := 16;
       file_in: string             := "data_in.txt";
       file_out: string            := "data_out.txt");
end entity fourbitadder_tb_file;

-------------------------------------------------
-- File IO Test Bench
-------------------------------------------------
architecture arch_tb_file of fourbitadder_tb_file is

-- Signal declarations
-- Given initial values for simulation
signal   a   : std_logic_vector(3 downto 0) := "0000";
signal   b   : std_logic_vector(3 downto 0) := "0000";
signal   sum : std_logic_vector(3 downto 0) := "0000";
signal   sim_done : std_logic := '0';

--! Component declaration for fourbitadder
component fourbitadder is
  port (
	a   : in std_logic_vector(3 downto 0)  := "0000";
	b   : in std_logic_vector(3 downto 0)  := "0000";
	sum : out std_logic_vector(3 downto 0) := "0000"
  );
end component;
begin

   --! Port map declaration for fourbitadder
   comp_fourbitadder : fourbitadder
      port map (
                a   => a,
                b   => b,
                sum => sum
   );

-------------------------------------------------------------------------------
-- Stimuli process
-- Iterates through data from file
-------------------------------------------------------------------------------   
  genVideoSTData : process -- Time driven process
    variable datacount : integer range 0 to file_len;
     -- files
    variable line: LINE;
    variable data: integer;
    variable val: signed(31 downto 0);
    file datainfile: TEXT open read_mode is file_in;
 begin

	sim_done <= '0';
	a <= "0000";
	b <= "0001";
	wait for 10 ns;
	    
    while not endfile(datainfile) loop
		readline(datainfile, line); -- read next text line from file
		--read(line, data, 16); -- convert hex (16) numbers to integer value
		read(line, data, 10); -- convert decimal (10) numbers to integer value
		b <= b(2 downto 0) & b(3) ;
		a <= std_logic_vector(to_unsigned(data, 4));
		wait for 10 ns;  
    end loop;

	sim_done <= '1';
	wait;    
  end process;

   
-------------------------------------------------------------------------------
-- Monitor process
-- Does nothing but wait
-------------------------------------------------------------------------------
  monitor : process
    variable line: LINE;
    variable data: integer;
    file dataoutfile: TEXT open write_mode is file_out;
  begin
  
    while sim_done = '0' loop
		wait on sum;
		data := TO_INTEGER(unsigned(sum));
		write(line, data, right, 0, decimal); -- convert to decimal numbers
		-- Frame pixels stored in file
		writeline(dataoutfile, line); -- read next text line from file
    end loop;
    
    wait;
  end process;   	
   
end architecture arch_tb_file;


