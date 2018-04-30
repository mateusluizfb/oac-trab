#ifndef _GLOBALSH_
#define _GLOBALSH_

#define NUM_OPCODES 0x2C
#define NUM_FUNCTS 0x2B

int32_t b_reg[32];

uint32_t pc;
uint32_t ri;
uint32_t hi;
uint32_t lo;
int8_t opcode;
int8_t rs;
int8_t rt;
int8_t rd;
int8_t shamt;
int8_t funct;
int16_t k16;
int32_t k26;

void (*opPointer[NUM_OPCODES]) (void);
void (*functPointer[NUM_FUNCTS]) (void);

typedef struct {
  int8_t EXT;
  int8_t LH;
  int8_t SB;
  int8_t BLEZ;
  int8_t SLTIU;
  int8_t J;
  int8_t LW;
  int8_t LHU;
  int8_t SH;
  int8_t BGTZ;
  int8_t ANDI;
  int8_t JAL;
  int8_t LB;
  int8_t LUI;
  int8_t BEQ;
  int8_t ADDI;
  int8_t ADDIU;
  int8_t ORI;
  int8_t LBU;
  int8_t SW;
  int8_t BNE;
  int8_t SLTI;
  int8_t XORI;
} Opcodes;

typedef struct {
  int8_t ADD;
  int8_t OR;
  int8_t SLL;
  int8_t SUB;
  int8_t XOR;
  int8_t SRL;
  int8_t MULT;
  int8_t NOR;
  int8_t SRA;
  int8_t DIV;
  int8_t AND;
  int8_t SLT;
  int8_t JR;
  int8_t SYSCALL;
  int8_t MFHI;
  int8_t MFLO;
} Funct;

typedef struct {
  int8_t zero;
  int8_t at;
  int8_t v0;
  int8_t v1;
  int8_t a0;
  int8_t a1;
  int8_t a2;
  int8_t a3;
  int8_t t0;
  int8_t t1;
  int8_t t2;
  int8_t t3;
  int8_t t4;
  int8_t t5;
  int8_t t6;
  int8_t t7;
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t t8;
  int8_t t9;
  int8_t k0;
  int8_t k1;
  int8_t gp;
  int8_t sp;
  int8_t fp;
  int8_t ra;
} Registers;

void initializePc(void);
void initializePointers(void);
#endif
