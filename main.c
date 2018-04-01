#define MEM_SIZE 4096
#include <stdio.h>
#include <inttypes.h>
#include "memory.h"
#include "./mips_instructions/load/load.h"
#include "./mips_instructions/store/store.h"

int32_t memory[MEM_SIZE];

int main() {
  sw(0, 0, 0x01020304);
  sw(0, 1, 0x00000000);
  sw(0, 2, 0x00000001);
  sw(0, 3, 0x0F00F001);

  dump_memory(0, 0);

  return 0;
}

void dump_memory(uint32_t address, uint32_t size) {
  int32_t *word_pointer = &memory;

  for (int i = 0; i < size; i++) {
    printf("mem[%d] = ", i);
    printf("%08x\n", *word_pointer);
    word_pointer++;
  }
}
