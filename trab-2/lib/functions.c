#define OPCODE ri >> 26
#define R_RS ri >> 21 & 0x1F
#define R_RT ri >> 16 & 0x1F
#define R_RD ri >> 11 & 0x1F
#define R_SHAMT ri >> 6 & 0x1F
#define R_FUNCT ri & 0x3F
#define I_K16 ri & 0xFFFF
#define J_K26 ri & 0x3FFFFFF

#include <stdlib.h>
#include "./functions.h"
#include "./declarations.h"

extern Funct FUNCTCODES;
extern Opcodes OPCODES;
extern Registers REGS;

int32_t lw(int32_t address, int16_t kte){
  if(kte % 4 == 0){
    int8_t *p = (int8_t*) mem;
    int32_t *t = (int32_t*) (p + address + kte);
    return *t;
  }
  return NULL;
}

void mips_lw(){
  b_reg[rt] = lw(b_reg[rs], k16);
}

int32_t lh(int32_t address, int16_t kte){
  if(kte % 2 == 0){
    int8_t *p = (int8_t*) mem;
    int16_t *t = (int16_t*) (p + address + kte);
    return *t;
  }
  return NULL;
}

void mips_lh(){
  b_reg[rt] = lh(b_reg[rs], k16);
}

int32_t lhu(int32_t address, int16_t kte){
  if(kte % 2 == 0){
    int8_t *p = (int8_t*) mem;
    int16_t *t = (int16_t*) (p + address + kte);
    return *t & 0x0000ffff;
  }
  return NULL;
}

void mips_lhu(){
  b_reg[rt] = lhu(b_reg[rs], k16);
}

int32_t lb(int32_t address, int16_t kte){
  int8_t *p = (int8_t*) mem;
  return *(p + address + kte);
}

void mips_lb(){
  b_reg[rt] = lb(b_reg[rs], k16);
}

int32_t lbu(int32_t address, int16_t kte){
  int8_t *p = (int8_t*) mem;
  return *(p + address + kte) & 0x000000ff;
}

void mips_lbu(){
  b_reg[rt] = lbu(b_reg[rs], k16);
}

void sw(int32_t address, int16_t kte, int32_t dado){
  if((address + kte) % 4 == 0){
    int8_t *p = (int8_t*) mem;
    int32_t *t = (int32_t*) (p + address + kte);
    *t = dado;
  }
}

void mips_sw(){
  sw(b_reg[rs], k16, b_reg[rt]);
}

void sh(int32_t address, int16_t kte, int16_t dado){
  if(kte % 2 == 0){
    int8_t *p = (int8_t*) mem;
    int16_t *t = (int16_t*) (p + address + kte);
    *t = dado;
  }
}

void mips_sh(){
  sh(b_reg[rs], k16, b_reg[rt]);
}

void sb(int32_t address, int16_t kte, int8_t dado){
  int8_t *p = (int8_t*) mem;
  *(p + address + kte) = dado;
}

void mips_sb(){
  sb(b_reg[rs], k16, b_reg[rt]);
}

void fetch(void){
  ri = lw(pc, 0);
  pc += 4;
}

void decode(void){
  opcode = OPCODE;
  rs = R_RS;
  rt = R_RT;
  rd = R_RD;
  shamt = R_SHAMT;
  funct = R_FUNCT;

  k16 = I_K16;

  k26 = J_K26;
}

void execute(void){
  (*opPointer[opcode])();
}

void mips_ext(void){
  (*functPointer[funct])();
}

void mips_add(void){
  b_reg[rd] = b_reg[rs] + b_reg[rt];
}

void mips_or(void){
  b_reg[rd] = b_reg[rs] | b_reg[rt];
}

void mips_sll(void){
  b_reg[rd] = (uint32_t) b_reg[rt] << shamt;
}

void mips_sub(void){
  b_reg[rd] = b_reg[rs] - b_reg[rt];
}

void mips_xor(void){
  b_reg[rd] = b_reg[rs] ^ b_reg[rt];
}

void mips_srl(void){
  b_reg[rd] = (uint32_t) b_reg[rt] >> shamt;
}

void mips_mult(void){
  uint64_t tmp = (int64_t)(int32_t) b_reg[rs] * (int64_t)(int32_t) b_reg[rt];
  hi = (uint32_t)(tmp >> 32);
  lo = (uint32_t)(tmp);
}

void mips_nor(void){
  b_reg[rd] = ~(b_reg[rs] | b_reg[rt]);
}

void mips_sra(void){
  b_reg[rd] = b_reg[rt] >> shamt;
}

void mips_div(void){
  lo = b_reg[rs] / b_reg[rt];
  hi = b_reg[rs] % b_reg[rt];
}

void mips_and(void){
  b_reg[rd] = b_reg[rs] & b_reg[rt];
}

void mips_slt(void){
  b_reg[rd] = b_reg[rs] < b_reg[rt] ? 1 : 0;
}

void mips_jr(void){
  pc = b_reg[rs];
}

void mips_syscall(void){
  char *prt_str = NULL;
  int8_t *p = (int8_t*) mem;
  switch(b_reg[REGS.v0]){
    case 1:
      printf("%d", b_reg[REGS.a0]);
      break;
    case 4:
      prt_str = (char *)(p + b_reg[REGS.a0]);
      printf("%s", prt_str);
      break;
    case 10:
      pc = -1;
  }
}

void mips_mfhi(void){
  b_reg[rd] = hi;
}

void mips_mflo(void){
  b_reg[rd] = lo;
}

void mips_blez(void){
  (b_reg[rs] <= 0) ? pc += (k16 << 2) : pc;
}

void mips_sltiu(void){
  b_reg[rt] = (unsigned)b_reg[rs] < (unsigned)k16 ? 1 : 0;
}

void mips_addi(void){
  b_reg[rt] = b_reg[rs] + k16;
}

void mips_addiu(void){
  b_reg[rt] = (unsigned)b_reg[rs] + (unsigned)k16;
}

void mips_j(void){
  int32_t tmp_pc = pc & 0xF0000000;
  int32_t tmp_k26 = k26 << 2;
  pc = tmp_k26 | tmp_pc;
}

void mips_bgtz(void){
  (b_reg[rs] > 0) ? pc += (k16 << 2) : pc;
}

void mips_andi(void){
  b_reg[rt] = b_reg[rs] & (int32_t)k16;
}

void mips_jal(void){
  b_reg[REGS.ra] = pc;

  int32_t tmp_pc = pc & 0xF0000000;
  int32_t tmp_k26 = k26 << 2;
  pc = tmp_k26 | tmp_pc;
}

void mips_lui(void){
  b_reg[rt] = (int32_t) k16 << 16;
}

void mips_beq(void){
  if(b_reg[rs] == b_reg[rt])
    pc += (k16 << 2);
}

void mips_ori(void){
  b_reg[rt] = b_reg[rs] | ((int32_t) k16 & 0x0000ffff);
}

void mips_bne(void){
  if(b_reg[rs] != b_reg[rt])
    pc += (k16 << 2);
}

void mips_slti(void){
  b_reg[rt] = b_reg[rs] < k16 ? 1 : 0;
}

void mips_xori(void){
  b_reg[rt] = b_reg[rs] ^ ((int32_t) k16 & 0x0000ffff);
}
