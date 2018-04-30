#ifndef _MEMFUNCTIONSH_
#define _MEMFUNCTIONSH_

#define MEM_SIZE 4096
#define TEXT_ADDRESS 0x00000000
#define TEXT_LIMIT   0x00000FFC
#define DATA_ADDRESS 0x00002000
#define DATA_LIMIT   0x00003FFF

#include <stdlib.h>
#include <stdint.h>
#include "declarations.h"

int32_t mem[MEM_SIZE];

int32_t lw(int32_t address, int16_t kte);
int32_t lh(int32_t address, int16_t kte);
int32_t lb(int32_t address, int16_t kte);
int32_t lhu(int32_t address, int16_t kte);
int32_t lbu(int32_t address, int16_t kte);

void sw(int32_t address, int16_t kte, int32_t dado);
void sh(int32_t address, int16_t kte, int16_t dado);
void sb(int32_t address, int16_t kte, int8_t dado);

void fetch(void);
void decode(void);
void execute(void);

void mips_add(void);
void mips_or(void);
void mips_sll(void);
void mips_sub(void);
void mips_xor(void);
void mips_srl(void);
void mips_mult(void);
void mips_nor(void);
void mips_sra(void);
void mips_div(void);
void mips_and(void);
void mips_slt(void);
void mips_jr(void);
void mips_syscall(void);
void mips_mfhi(void);
void mips_mflo(void);

void mips_ext(void);
void mips_blez(void);
void mips_sltiu(void);
void mips_addi(void);
void mips_addiu(void);
void mips_j(void);
void mips_bgtz(void);
void mips_andi(void);
void mips_jal(void);
void mips_lui(void);
void mips_beq(void);
void mips_ori(void);
void mips_bne(void);
void mips_slti(void);
void mips_xori(void);

void mips_sb(void);
void mips_sh(void);
void mips_sw(void);
void mips_lb(void);
void mips_lbu(void);
void mips_lh(void);
void mips_lhu(void);
void mips_lw(void);

#endif
