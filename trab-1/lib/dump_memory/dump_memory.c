#include <stdint.h>
#include <stdio.h>
#include "../../memory.h"

void dump_memory(uint32_t address, uint32_t size) {
  int32_t *word_pointer = &memory;

  size = size / 4;

  for (int i = 0; i < size; i++) {
    printf("mem[%d] = ", i);
    printf("%08x\n", *word_pointer);
    word_pointer++;
  }
}
