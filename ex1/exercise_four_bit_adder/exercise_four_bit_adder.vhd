-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;

entity exercise_four_bit_adder is
	port(SW   : in  std_logic_vector(7 downto 0);
		 LEDR : out std_logic_vector(4 downto 0)); 
end exercise_four_bit_adder;

architecture structural of exercise_four_bit_adder is
 begin

   comp_half_adder : entity work.half_adder
      port map (
                a => SW(0), 
					 b => SW(1),
                sum => LEDR(0), 
					 carry =>LEDR(1)
   );
 	
	end structural;