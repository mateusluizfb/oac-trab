#define MEM_SIZE 4096
#include <stdio.h>
#include <inttypes.h>
#include "memory.h"
#include "./mips_instructions/load/load.h"

int32_t memory[MEM_SIZE];

int main() {
  memory[0] = 123;

  sw(0, 0, 0);
  return 0;
}
