#define MEM_SIZE 4096
#include <stdio.h>
#include <inttypes.h>
#include "memory.h"
#include "./mips_instructions/load/load.h"
#include "./mips_instructions/store/store.h"

int32_t memory[MEM_SIZE];

int main() {
  sb(0, 0, 0x01);
  sb(0, 1, 0x02);
  sb(0, 2, 0x03);
  sb(0, 3, 0x04);

  lw(0, 0);
  lh(0, 0);
  lb(0, 0);

  return 0;
}
