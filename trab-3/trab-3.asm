# Mateus Luiz Freitas Barros - 15/0140801
#
#
#
#
# $f2 -> Primeiro operando
# $f4 -> Segundo operando

.data

	INSERIR_OPERANDO_1: .asciiz "Insira o primeiro operando: \n"
	INSERIR_OPERANDO_2: .asciiz "Insira o segundo operando: \n "

.text

  la $t1, INSERIR_OPERANDO_1 # Lê o endereço da mensagem do primeiro operando
  add $a0, $t1, $zero # Armazena a string para syscall
  li $v0, 4 # 4 é o código para imprimir string
  syscall

  li $v0, 6 # 6 é o código para ler float
  syscall
  mov.s $f2, $f0 # Move o valor lido para o $f2

  la $t1, INSERIR_OPERANDO_2 # Lê o endereço da mensagem do segundo operando
  add $a0, $t1, $zero # Armazena a string para syscall
  li $v0, 4 # 4 é o código para imprimir string
  syscall

  li $v0, 6 # 6 é o código para ler float
  syscall
  mov.s $f4, $f0 # Move o valor lido para o $f4
