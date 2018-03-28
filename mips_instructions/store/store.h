#ifndef STORE_H
#define STORE_H

//  escreve um inteiro alinhado na memória - endereços múltiplos de 4
void sw(uint32_t address, int16_t kte, int32_t dado);

// escreve meia palavra, 16 bits - endereços múltiplos de 2
void sh(uint32_t address, int16_t kte, int16_t dado);

// escreve um byte na memória 
void sb(uint32_t address, int16_t kte, int8_t dado);

#endif /* STORE_H */
