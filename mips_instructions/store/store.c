#include <stdio.h>
#include <stdint.h>
#include "../../memory.h"

void sw(uint32_t address, int16_t kte, int32_t dado) {
  store_value(1, dado, address, kte);
}

void sh(uint32_t address, int16_t kte, int16_t dado) {
  store_value(2, dado, address, kte);
}

void sb(uint32_t address, int16_t kte, int8_t dado) {
  store_value(3, dado, address, kte);
}

void store_value(int store_type, void *data, uint32_t address, int16_t kte) {
  if (store_type == 1) {
    int32_t data_retyped = (int32_t) data;
  } else if (store_type == 2) {
    int16_t data_retyped = (int16_t) data;
  } else if (store_type == 2) {
    int8_t data_retyped = (int8_t) data;
  }

  char *byte_pointer = (char*) memory; // Cast to char and interate with bytes
  int actual_address = kte + address; // valor to offset mais o endereço * 4, para andar no andereço em words
  byte_pointer += actual_address; // Bytes offset

  *byte_pointer = data; // Insere o dado no endereço
}
