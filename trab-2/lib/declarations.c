#include "functions.h"

Opcodes OPCODES = {
  .EXT = 0x00,
  .LH = 0x21,
  .SB = 0x28,
  .BLEZ = 0x06,
  .SLTIU = 0x0B,
  .J = 0x02,
  .LW = 0x23,
  .LHU = 0x25,
  .SH = 0x29,
  .BGTZ = 0x07,
  .ANDI = 0x0C,
  .JAL = 0x03,
  .LB = 0x20,
  .LUI = 0x0F,
  .BEQ = 0x04,
  .ADDI = 0x08,
  .ADDIU = 0x09,
  .ORI = 0x0D,
  .LBU = 0x24,
  .SW = 0x2B,
  .BNE = 0x05,
  .SLTI = 0x0A,
  .XORI = 0x0E
};

Funct FUNCTCODES = {
  .ADD = 0x20,
  .OR = 0x25,
  .SLL = 0x00,
  .SUB = 0x22,
  .XOR = 0x26,
  .SRL = 0x02,
  .MULT = 0x18,
  .NOR = 0x27,
  .SRA = 0x03,
  .DIV = 0x1A,
  .AND = 0x24,
  .SLT = 0x2A,
  .JR = 0x08,
  .SYSCALL = 0x0c,
  .MFHI = 0x10,
  .MFLO = 0x12
};

Registers REGS = {
  .zero = 0,
  .at = 1,
  .v0 = 2,
  .v1 = 3,
  .a0 = 4,
  .a1 = 5,
  .a2 = 6,
  .a3 = 7,
  .t0 = 8,
  .t1 = 9,
  .t2 = 10,
  .t3 = 11,
  .t4 = 12,
  .t5 = 13,
  .t6 = 14,
  .t7 = 15,
  .s0 = 16,
  .s1 = 17,
  .s2 = 18,
  .s3 = 19,
  .s4 = 20,
  .s5 = 21,
  .s6 = 22,
  .s7 = 23,
  .t8 = 24,
  .t9 = 25,
  .k0 = 26,
  .k1 = 27,
  .gp = 28,
  .sp = 29,
  .fp = 30,
  .ra = 31,
};

void initializePc(){
  pc = TEXT_ADDRESS;
}

void initializePointers(){
  functPointer[FUNCTCODES.ADD] = mips_add;
  functPointer[FUNCTCODES.OR] = mips_or;
  functPointer[FUNCTCODES.SLL] = mips_sll;
  functPointer[FUNCTCODES.SUB] = mips_sub;
  functPointer[FUNCTCODES.XOR] = mips_xor;
  functPointer[FUNCTCODES.SRL] = mips_srl;
  functPointer[FUNCTCODES.MULT] = mips_mult;
  functPointer[FUNCTCODES.NOR] = mips_nor;
  functPointer[FUNCTCODES.SRA] = mips_sra;
  functPointer[FUNCTCODES.DIV] = mips_div;
  functPointer[FUNCTCODES.AND] = mips_and;
  functPointer[FUNCTCODES.SLT] = mips_slt;
  functPointer[FUNCTCODES.JR] = mips_jr;
  functPointer[FUNCTCODES.SYSCALL] = mips_syscall;
  functPointer[FUNCTCODES.MFHI] = mips_mfhi;
  functPointer[FUNCTCODES.MFLO] = mips_mflo;

  opPointer[OPCODES.EXT] = mips_ext;
  opPointer[OPCODES.BLEZ] = mips_blez;
  opPointer[OPCODES.SLTIU] = mips_sltiu;
  opPointer[OPCODES.ADDI] = mips_addi;
  opPointer[OPCODES.ADDIU] = mips_addiu;
  opPointer[OPCODES.J] = mips_j;
  opPointer[OPCODES.BGTZ] = mips_bgtz;
  opPointer[OPCODES.ANDI] = mips_andi;
  opPointer[OPCODES.JAL] = mips_jal;
  opPointer[OPCODES.LUI] = mips_lui;
  opPointer[OPCODES.BEQ] = mips_beq;
  opPointer[OPCODES.ORI] = mips_ori;
  opPointer[OPCODES.BNE] = mips_bne;
  opPointer[OPCODES.SLTI] = mips_slti;
  opPointer[OPCODES.XORI] = mips_xori;

  opPointer[OPCODES.SB] = mips_sb;
  opPointer[OPCODES.SW] = mips_sw;
  opPointer[OPCODES.SH] = mips_sh;
  opPointer[OPCODES.LB] = mips_lb;
  opPointer[OPCODES.LBU] = mips_lbu;
  opPointer[OPCODES.LH] = mips_lh;
  opPointer[OPCODES.LHU] = mips_lhu;
  opPointer[OPCODES.LW] = mips_lw;
}
