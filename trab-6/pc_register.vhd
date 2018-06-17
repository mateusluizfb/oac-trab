LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity pc_register is
	port (
		data 				: in std_logic_vector(31 downto 0);
		register_data	: out std_logic_vector(31 downto 0);
		clock				: in std_logic
	);
end entity;

architecture pc_register_arch of pc_register is
begin
	init: process (data, clock) is
	begin
		if(clock = '1' and clock'event) then
			register_data <= data;
		end if;
	end process; 
end architecture;