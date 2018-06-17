LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;

entity full_component is
	PORT (
		clock					: IN STD_LOGIC ;
		inst_mem_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		inst_mem_wren		: IN STD_LOGIC;
		custom_pc_addres  : IN STD_LOGIC_vector(31 DOWNTO 0);
		PC_MUX_SWITCH		: IN STD_LOGIC;
		component_out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end entity;

architecture full_component_arch of full_component is
	COMPONENT mem_instrucoes
		PORT (
			address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			clock : IN STD_LOGIC;
			data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			wren : IN STD_LOGIC
		);
	END COMPONENT;

	
	COMPONENT pc_adder
		PORT (
			address			:	in std_logic_vector(31 downto 0);
			next_address	:	out std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux_2_inputs
		PORT (
			a_input		: in std_logic_vector(31 downto 0);
			b_input		: in std_logic_vector(31 downto 0);
			switch		: in std_logic;
			out_input	: out std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT pc_register
		PORT (
			data			: in std_logic_vector(31 downto 0);
			register_data		: out std_logic_vector(31 downto 0);
			clock : in std_LOGIC
		);
	END COMPONENT;
	
	-- declare register
	signal pc_out : std_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";

	signal adder_to_pc : std_logic_vector(31 downto 0);
	signal mux_to_pc : std_logic_vector(31 downto 0);
begin
	i1 : mem_instrucoes
	PORT MAP (
		address 	=> pc_out(9 downto 2),
		clock 	=> clock,
		data 		=> inst_mem_data,
		wren 		=> inst_mem_wren,
		q			=> component_out
	);
	
	i2: pc_adder
	PORT MAP (
		address			=> pc_out,
		next_address	=> adder_to_pc
	);
	
	i3: pc_register
	PORT MAP (
		data => mux_to_pc,
		register_data	=> pc_out,
		clock => clock
	);
	
	i4: mux_2_inputs
	PORT MAP (
		a_input 	 => adder_to_pc,
		b_input 	 => custom_pc_addres,
		switch 	 => pc_mux_SWITCH,
		out_input => mux_to_pc
	);

	init: process (clock) is
	begin
		if(clock = '1' and clock'event) then
		end if;
	end process;
end architecture;