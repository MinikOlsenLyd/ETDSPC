library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--library unisim;
--use unisim.vcomponents.all;

entity fourbitadder is
  port (
	a : in std_logic_vector(3 downto 0) := "0000";
	b : in std_logic_vector(3 downto 0) := "0000";
	sum : out std_logic_vector(3 downto 0) := "0000"
  );
end entity;

architecture arch of fourbitadder is
begin
	sum <= std_logic_vector(unsigned(a) + unsigned(b));

end architecture;

