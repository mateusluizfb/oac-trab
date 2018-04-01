#ifndef LOAD_H
#define LOAD_H
#include <stdint.h>

// Le um inteiro alinhado - endereços múltiplos de 4
int32_t lw(uint32_t address, int16_t kte);

// Le meia palavra, 16 bits - retorna inteiro com sinal
int32_t lh(uint32_t address, int16_t kte);

// Le meia palavra, 16 bits formato inteiro sem sinal
uint32_t lhu(uint32_t address, int16_t kte);

// Le um byte - retorna inteiro com sinal
int32_t lb(uint32_t address, int16_t kte);

// Le um byte - 8 bits formato inteiro sem sinal
int32_t lbu(uint32_t address, int16_t kte);

#endif
