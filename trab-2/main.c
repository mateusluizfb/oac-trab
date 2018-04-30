#include <stdio.h>
#include <stdlib.h>
#include "./lib/functions.h"

extern int32_t mem[MEM_SIZE];
int32_t old_b_reg[32];

void init(){
  initializePc();
  initializePointers();
  int i;
  for(i = 0; i < 32; i++){
    old_b_reg[i] = 0;
    b_reg[i] = 0;
  }
}

int read(int32_t initialAdress, char* filename, int32_t readSize){
  FILE *file;
  file = fopen(filename, "rb");
  if(file == NULL){
    printf("Não encontrado.\n");
    return 1;
  } else {
    int8_t *p = (int8_t*) mem;
    fread((p + initialAdress), 4, readSize, file);
    return 0;
  }
}

void readBinaries(){
  int ret;
  char buff[50];

  do {
    printf("Caminho completo até o .bin de .data: ");
    scanf(" %s", buff);
    ret = read(DATA_ADDRESS, buff, DATA_LIMIT);
  } while(ret);

  do {
    printf("Caminho completo até o .bin te .text: ");
    scanf("%s", buff);
    ret = read(TEXT_ADDRESS, buff, TEXT_LIMIT);
  } while(ret);


  init();
}

void printMem(){
  char format;
  int32_t initial;
  int32_t final;
  do {
    printf("Digite o formato:\nh - Hexa\nd - Decimal\nFormato: ");
    scanf(" %c", &format);
    getchar();
    if(!(format != 'd' || format != 'h')){
      printf("Formato inválido!\n");
    }
  } while(!(format != 'd' || format != 'h'));

  printf("Valor inicial de leitura em hexa. \nEx: 0x00002000, digite apenas 2000.\n");
  scanf("%x", &initial);
  printf("Valor final de leitura em hexa. \n");
  scanf("%x", &final);

  int32_t value;
  printf("*******\n");
  printf(" .data \n");
  printf("*******\n");
  int i = 0;
  for(; initial < final; initial += 4){
    value = lw(initial, 0);
    if(format == 'h')
      printf("%08x\n", value);
    else
      printf("%d\n", value);
  }
}

void printRegisters(){
  int i;
  printf("--REGISTRADORES--\n");
  for(i = 0;i < 32; i++){
    printf("$%d -> %08x", i, b_reg[i]);
    if(old_b_reg[i] != b_reg[i])
      printf(" <-- mudou");
    printf("\n");

    old_b_reg[i] = b_reg[i];
  }
  printf("PC -> %08x \n", pc);
  printf("HI -> %08x \n", hi);
  printf("LO -> %08x \n", lo);
  printf("---\n");
}

void step(){
  fetch();
  decode();
  execute();
}

void runProgram(){
  int i;
  do {
    step();
  } while(pc > 0x00000000 && pc < TEXT_LIMIT);
}

void showMenu(){
  int input;
  while(input != 5){
    printf("\n1 - Step");
    printf("\n2 - Run");
    printf("\n3 - Dump Memory");
    printf("\n4 - Dump Registers");
    printf("\n5 - Sair ou CTRL + C\n");

    scanf("%d", &input);
    getchar();
    switch(input){
      case 1:
        step();
        break;
      case 2:
        runProgram();
        break;
      case 3:
        printMem();
        break;
      case 4:
        printRegisters();
        break;
      case 5:
        break;
      default:
        printf("Opcao invalida!\n");
    }
  }
}

int main(){
  readBinaries();
  showMenu();
}
