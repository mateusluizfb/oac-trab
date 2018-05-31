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
-- Generated on "05/30/2018 20:26:28"
                                                            
-- Vhdl Test Bench template for design  :  ula
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;            
library work;                                   
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;
USE work.ula_package.all;

ENTITY ula_vhd_tst IS
END ula_vhd_tst;
ARCHITECTURE ula_arch OF ula_vhd_tst IS
	-- constants                                                 
	-- signals                                                   
	SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL B : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL ULA_OP : ULA_OPERATION;
	SIGNAL ula_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	COMPONENT ula
		PORT (
			A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ULA_OP : IN ULA_OPERATION;
			ula_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	BEGIN
		i1 : ula
		PORT MAP ( 
	-- list connections between master ports and signals
			A => A,
			B => B,
			ULA_OP => ULA_OP,
			ula_out => ula_out
		);
	init : PROCESS                                               
	-- variable declarations                                     
	BEGIN
		A <= std_LOGIC_VECTOR(to_signed(1, 32));
		B <= std_LOGIC_VECTOR(to_signed(1, 32));
		ULA_OP <= ADD;
		wait for 10 ns;
			  -- code that executes only once                      
	WAIT;                                                       
END PROCESS init;                                                                                   
END ula_arch;
