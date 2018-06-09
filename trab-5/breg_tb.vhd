-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "06/09/2018 12:45:56"
                                                            
-- Vhdl Test Bench template for design  :  breg
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;      

ENTITY breg_tb IS
END breg_tb;
ARCHITECTURE breg_arch OF breg_tb IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL register_input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL register_input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL register_output_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL register_output_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL register_write : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL write_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL write_enable : STD_LOGIC;
COMPONENT breg
	PORT (
		clock : IN STD_LOGIC;
		register_input_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		register_input_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		register_output_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		register_output_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		register_write : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		reset : IN STD_LOGIC;
		write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		write_enable : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : breg
	PORT MAP (
	-- list connections between master ports and signals
		clock => clock,
		register_input_1 => register_input_1,
		register_input_2 => register_input_2,
		register_output_1 => register_output_1,
		register_output_2 => register_output_2,
		register_write => register_write,
		reset => reset,
		write_data => write_data,
		write_enable => write_enable
	);
init : PROCESS                                               
-- variable declarations
BEGIN
		clock 		 <= '0';
		write_enable <= '1'; -- habilitar escrita
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(1, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(1, 5)); -- armazenar 1 no registrador 1
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(2, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(2, 5)); -- armazenar 2 no registrador 2
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(3, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(3, 5)); -- armazenar 3 no registrador 3
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(4, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(4, 5)); -- armazenar 4 no registrador 4
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(5, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(5, 5)); -- armazenar 5 no registrador 5
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(6, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(6, 5)); -- armazenar 6 no registrador 6
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(7, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(7, 5)); -- armazenar 7 no registrador 7
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(8, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(8, 5)); -- armazenar 8 no registrador 8
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(9, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(9, 5)); -- armazenar 9 no registrador 9
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(10, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(10, 5)); -- armazenar 10 no registrador 10
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
		clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(11, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(11, 5)); -- armazenar 11 no registrador 11
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(12, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(12, 5)); -- armazenar 12 no registrador 12
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(13, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(13, 5)); -- armazenar 13 no registrador 13
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(14, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(14, 5)); -- armazenar 14 no registrador 14
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(15, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(15, 5)); -- armazenar 15 no registrador 15
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(16, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(16, 5)); -- armazenar 16 no registrador 16
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(17, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(17, 5)); -- armazenar 17 no registrador 17
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(18, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(18, 5)); -- armazenar 18 no registrador 18
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(19, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(19, 5)); -- armazenar 19 no registrador 19
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(20, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(20, 5)); -- armazenar 20 no registrador 20
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(21, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(21, 5)); -- armazenar 21 no registrador 21
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(22, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(22, 5)); -- armazenar 22 no registrador 22
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(23, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(23, 5)); -- armazenar 23 no registrador 23
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(24, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(24, 5)); -- armazenar 24 no registrador 24
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(25, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(25, 5)); -- armazenar 25 no registrador 25
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(26, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(26, 5)); -- armazenar 26 no registrador 26
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(27, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(27, 5)); -- armazenar 27 no registrador 27
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(28, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(28, 5)); -- armazenar 28 no registrador 28
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(29, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(29, 5)); -- armazenar 29 no registrador 29
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(30, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(30, 5)); -- armazenar 30 no registrador 30
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
	clock 		 <= '0';
		write_data		<= std_LOGIC_VECTOR(to_unsigned(31, 32));
		register_write <= std_LOGIC_VECTOR(to_unsigned(31, 5)); -- armazenar 31 no registrador 31
		wait for 10 ps;
	clock 		 <= '1';
		wait for 10 ps;
		
	write_enable	<= '0'; -- escrita destivada
	register_write <= std_LOGIC_VECTOR(to_unsigned(0, 5)); -- registrador de escrita em 0
	write_data		<= std_LOGIC_VECTOR(to_unsigned(0, 32)); -- valro de escrita em 0
		
	for i in 1 to 10 loop -- realizar a leitura de todos os registradores, em todas as combinações possíveis: leitura em r1 (1 ao 10)
		clock <= '0';
			wait for 10 ps;
		clock <= '1';
			register_input_1 <= std_logic_vector(to_unsigned(i, 5));
			wait for 10 ps;
			assert (i = to_integer(unsigned(register_output_1))); -- comparar valor da saída do registrador 1 com o valor esperado
	end loop;
		
	for i in 11 to 20 loop -- realizar a leitura de todos os registradores, em todas as combinações possíveis: leitura em r2 (11 ao 20)
		clock <= '0';
			wait for 10 ps;
		clock <= '1';
			register_input_2 <= std_logic_vector(to_unsigned(i, 5));
			wait for 10 ps;
			assert (i = to_integer(unsigned(register_output_2))); -- comparar valor da saída do registrador 2 com o valor esperado
	end loop;
		
	for i in 21 to 31 loop -- realizar a leitura de todos os registradores, em todas as combinações possíveis: leitura simultânea em ambos (21 ao 31)
		clock <= '0';
			wait for 10 ps;
		clock <= '1';
			register_input_1 <= std_logic_vector(to_unsigned(i, 5));
			register_input_2 <= std_logic_vector(to_unsigned(i, 5));
			wait for 10 ps;
			assert (i = to_integer(unsigned(register_output_1))); -- comparar valor da saída do registrador 1 com o valor esperado
			assert (i = to_integer(unsigned(register_output_2))); -- comparar valor da saída do registrador 2 com o valor esperado
	end loop;
	
	clock <= '0'; -- testar se o resgistrador $zero tem valor 0
		wait for 10 ps;
	clock <= '1';
		register_input_1 <= std_logic_vector(to_unsigned(0, 5));
		register_input_2 <= std_logic_vector(to_unsigned(0, 5));
		wait for 10 ps;
		assert (0 = to_integer(unsigned(register_output_1))); 
		assert (0 = to_integer(unsigned(register_output_2)));
		
	clock <= '0'; -- $zero continua 0 caso tente atribuir algo
		write_enable	<= '1';
		register_write <= std_LOGIC_VECTOR(to_unsigned(0, 5)); 
		write_data		<= std_LOGIC_VECTOR(to_unsigned(5, 32)); 
		wait for 10 ps;
	clock <= '1';
		register_input_1 <= std_logic_vector(to_unsigned(0, 5));
		register_input_2 <= std_logic_vector(to_unsigned(0, 5));
		wait for 10 ps;
		assert (0 = to_integer(unsigned(register_output_1))); 
		assert (0 = to_integer(unsigned(register_output_2)));
		
	clock <= '0'; -- escrita e leitura no mesmo ciclo
		write_enable	<= '1';
		register_write <= std_LOGIC_VECTOR(to_unsigned(1, 5)); 
		write_data		<= std_LOGIC_VECTOR(to_unsigned(10, 32)); 
		register_input_1 <= std_logic_vector(to_unsigned(2, 5));
		register_input_2 <= std_logic_vector(to_unsigned(2, 5));
		wait for 10 ps;
	clock <= '1';
		wait for 10 ps;
		assert (2 = to_integer(unsigned(register_output_1))); 
		assert (2 = to_integer(unsigned(register_output_2)));
	

WAIT;                                                       
END PROCESS init;                                                                                    
END breg_arch;
