library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ula_package.all;

entity ula is
	port (
		A: 		in std_logic_vector(31 downto 0);
		B: 		in std_logic_vector(31 downto 0);
		ULA_OP: 	in ULA_OPERATION;
		ula_out: out std_logic_vector(31 downto 0)
	);
end entity;

architecture ula_architeture of ula is
	signal resultado32 : std_logic_vector(31 downto 0);
begin
	ula_out <= resultado32;	
	
	init: process (A, B, ULA_OP)
	begin
		case ULA_OP	is
			when ADD => resultado32 <= std_logic_vector(unsigned(A) + unsigned(B));
			when others => resultado32 <= std_logic_vector(unsigned(A) + unsigned(B));
		end case;
	end process;

end architecture; 