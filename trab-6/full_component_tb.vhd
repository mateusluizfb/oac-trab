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
-- Generated on "06/17/2018 18:44:23"
                                                            
-- Vhdl Test Bench template for design  :  full_component
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY full_component_test IS
END full_component_test;
ARCHITECTURE full_component_arch OF full_component_test IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL component_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL inst_mem_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL inst_mem_wren : STD_LOGIC;
COMPONENT full_component
	PORT (
	clock : IN STD_LOGIC;
	component_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	inst_mem_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	inst_mem_wren : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : full_component
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	component_out => component_out,
	inst_mem_data => inst_mem_data,
	inst_mem_wren => inst_mem_wren
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                  
	clock <= '0';
	inst_mem_wren <= '0';
	wait for 10 ns;
	
	clock <= '1';
	wait for 10 ns;
	
	clock <= '0';
	wait for 10 ns;
	

													
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                            
END full_component_arch;
