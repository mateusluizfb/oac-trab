#include <stdio.h>
#include <stdint.h>
#include "../../memory.h"

int32_t lw(uint32_t address, int16_t kte) {
  int32_t *word_pointer = (int32_t*) memory;
  int32_t actual_address = (address + kte) / 4;
  word_pointer += actual_address;

  printf("Hexa value: %08x\n", *word_pointer);
  printf("Decimal value: %i\n", *word_pointer);

  return *word_pointer;
}

int32_t lh(uint32_t address, int16_t kte) {
  int16_t *half_word_pointer = (int16_t*) memory;
  int16_t actual_address = (address + kte) / 2;
  half_word_pointer += actual_address;

  printf("Hexa value: %04hx\n", *half_word_pointer);
  printf("Decimal value: %d\n", *half_word_pointer);

  return *half_word_pointer;
}

int32_t lb(uint32_t address, int16_t kte) {
  int8_t *byte_pointer = (int8_t*) memory;
  int8_t actual_address = address + kte;
  byte_pointer += actual_address;

  printf("Hexa value: %02hhx\n", *byte_pointer);
  printf("Decimal value: %d\n", *byte_pointer);

  return *byte_pointer;
}

int32_t lhu(uint32_t address, int16_t kte) {
  uint16_t *half_word_pointer = (uint16_t*) memory;
  uint16_t actual_address = (address + kte) / 2;
  half_word_pointer += actual_address;

  printf("Hexa value: %04x\n", *half_word_pointer);
  printf("Decimal value: %d\n", *half_word_pointer);

  return *half_word_pointer;
}

int32_t lbu(uint32_t address, int16_t kte) {
  uint8_t *byte_pointer = (uint8_t*) memory;
  uint8_t actual_address = address + kte;
  byte_pointer += actual_address;

  printf("Hexa value: %02x\n", *byte_pointer);
  printf("Decimal value: %d\n", *byte_pointer);

  return *byte_pointer;
}
