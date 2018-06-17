LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;                                

entity pc_adder is
	port (
		address			:	in std_logic_vector(31 downto 0);
		next_address	:	out std_logic_vector(31 downto 0)
	);
end entity;

architecture pc_adder_arch of pc_adder is
begin
	init: process (address)
	begin
		next_address <= std_logic_vector(unsigned(address) + to_unsigned(4, 32));
	end process;
end architecture;