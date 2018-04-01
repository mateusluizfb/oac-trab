#define MEM_SIZE 4096
#include <stdio.h>
#include <stdint.h>
#include "memory.h"
#include "./mips_instructions/load/load.h"
#include "./mips_instructions/store/store.h"
#include "./lib/dump_memory/dump_memory.h"

int32_t memory[MEM_SIZE];

int main() {
  sb(0, 0, 0x04);
  sb(0, 1, 0x03);
  sb(0, 2, 0x02);
  sb(0, 3, 0x01);

  sb(4, 0, 0xFF);
  sb(4, 1, 0xFE);
  sb(4, 2, 0xFD);
  sb(4, 3, 0xFC);

  sh(8, 0, 0xFFF0);
  sh(8, 2, 0x8C);

  sw(12, 0, 0xFF);

  sw(16, 0, 0xFFFF);

  sw(20, 0, 0xFFFFFFFF);

  sw(24, 0, 0x80000000);

  dump_memory(0, 28);

  // TODO: Loads unsigned

  return 0;
}
