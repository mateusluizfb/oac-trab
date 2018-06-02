package ula_package is

	type ULA_OPERATION is (
		ADD, ADDU,
		SUB, SUBU,
		AND_OP, OR_OP,
		SLT, SLTU,
		NOR_OP, XOR_OP,
		SLL_OP, SRL_OP,
		SRA_OP, RTL,
		RTR
	);

end package;