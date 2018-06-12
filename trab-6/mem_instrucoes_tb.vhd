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

ENTITY mem_instrucoes_vhd_tst IS
END mem_instrucoes_vhd_tst;
ARCHITECTURE mem_instrucoes_arch OF mem_instrucoes_vhd_tst IS
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
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END mem_instrucoes_arch;
