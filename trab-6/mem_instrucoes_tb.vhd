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
-- Generated on "06/12/2018 19:40:27"
                                                            
-- Vhdl Test Bench template for design  :  mem_instrucoes
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mem_instrucoes_test IS
END mem_instrucoes_test;
ARCHITECTURE mem_instrucoes_arch OF mem_instrucoes_test IS
-- constants                                                 
-- signals                                                   
SIGNAL address : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clock : STD_LOGIC;
SIGNAL data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL q : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL wren : STD_LOGIC;
COMPONENT mem_instrucoes
	PORT (
	address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clock : IN STD_LOGIC;
	data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	wren : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mem_instrucoes
	PORT MAP (
-- list connections between master ports and signals
	address => address,
	clock => clock,
	data => data,
	q => q,
	wren => wren
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN             
	wren <= '0';
                            
	clock <= '0';
	wait for 10 ns;

	address <= "00000000";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"20082000");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000001";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"8d090000");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000010";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"8d0a0004");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000011";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"8d0b0008");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000100";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"8d0c000c");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000101";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"8d0d0010");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000110";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"01498020");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00000111";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"01498822");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00001000";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"018d9024");
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00001001";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"012b982a");
	
	-- Escrever e ler
	
	wren <= '1';
	
	clock <= '0';
	wait for 10 ns;
	
	address <= "00001010";
	data <= X"FFFFFFFF";
	clock <= '1';
	wait for 10 ns;
	
	clock <= '0';
	wait for 10 ns;
	
	data <= X"00000000";
	wren <= '0';
	address <= "00001010";
	clock <= '1';
	wait for 10 ns;
	assert (q = X"FFFFFFFF");

	clock <= '0';
	
WAIT;                                                       
END PROCESS init;                                           
END mem_instrucoes_arch;
