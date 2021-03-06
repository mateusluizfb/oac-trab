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

ENTITY breg_vhd_tst IS
END breg_vhd_tst;
ARCHITECTURE breg_arch OF breg_vhd_tst IS
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
END breg_arch;
