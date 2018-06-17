LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;

entity mux_2_inputs is
	port (
		a_input		: in std_logic_vector(31 downto 0);
		b_input		: in std_logic_vector(31 downto 0);
		switch		: in std_logic;
		out_input	: out std_logic_vector(31 downto 0)
	);
end entity;

architecture mux_2_inputs_arch of mux_2_inputs is
begin
	init: process(a_input, b_input, switch) is
	begin
		case switch is
			when '0' 	=> out_input <= a_input;
			when '1' 	=> out_input <= b_input;
			when others => out_input <= a_input;
		end case;
	end process;
end architecture;