#include <stdio.h>
#include <stdint.h>
#include "../../memory.h"

void sw(uint32_t address, int16_t kte, int32_t dado) {
  int32_t *word_pointer = (int32_t*) memory; // Cast to char and interate with bytes
  int actual_address = (kte + address) / 4; // valor to offset mais o endereço * 4, para andar no andereço em words
  word_pointer += actual_address; // Bytes offset

  *word_pointer = dado; // Insere o dado no endereço
}

void sh(uint32_t address, int16_t kte, int16_t dado) {
  int16_t *half_word_pointer = (int16_t*) memory; // Cast to char and interate with bytes
  int actual_address = (kte + address) / 2; // valor to offset mais o endereço * 4, para andar no andereço em words
  half_word_pointer += actual_address; // Bytes offset

  *half_word_pointer = dado; // Insere o dado no endereço
}

void sb(uint32_t address, int16_t kte, int8_t dado) {
  int8_t *byte_pointer = (int8_t*) memory; // Cast to char and interate with bytes
  int actual_address = kte + address; // valor to offset mais o endereço * 4, para andar no andereço em words
  byte_pointer += actual_address; // Bytes offset

  *byte_pointer = dado; // Insere o dado no endereço
}
