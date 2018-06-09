library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity breg is
	generic (WSIZE : natural := 32);
	port (
		clock, write_enable, reset	: in  std_logic;
		register_input_1				: in  std_logic_vector(4 downto 0);
		register_input_2				: in  std_logic_vector(4 downto 0);
		register_write					: in  std_logic_vector(4 downto 0);
		write_data						: in  std_logic_vector(WSIZE - 1 downto 0);
		register_output_1				: out  std_logic_vector(WSIZE - 1 downto 0);
		register_output_2				: out std_logic_vector(WSIZE - 1 downto 0)
	);
end entity;

architecture breg_architecture of breg is
-- declaração de "variável"
	type breg_array is array(31 downto 0) of std_logic_vector(31 downto 0);
	signal registers  : breg_array := (others => (others => '0'));
begin

	init: process (clock, registers, register_input_1, register_input_2)
	begin
		if(clock = '1' and clock'event) then -- faz o processo se a borda é positiva 
			if (write_enable = '1') then -- escrever se o enable for positivo
				if (register_write = "00000") then -- escreve 0 no $zero caso tentem escrever nele
					registers(to_integer(unsigned(register_write))) <= "00000000000000000000000000000000";
				else
					registers(to_integer(unsigned(register_write))) <= write_data; -- escreve dado no registrador selecionado
				end if;
			end if;
			
			if (reset = '1') then -- se reset for positivo, então zera os registradores
				for i in registers' range loop
					registers(i) <= "00000000000000000000000000000000";
				end loop;
			end if;
			
			register_output_1 <= registers(to_integer(unsigned(register_input_1))); -- output retorna o valor do primeiro regitrador selecionado
			register_output_2 <= registers(to_integer(unsigned(register_input_2))); -- output retorna o valor do segundo regitrador selecionado
		end if;
	end process;

end architecture;