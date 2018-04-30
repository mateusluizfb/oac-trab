# Mateus Luiz Freitas Barros - 15/0140801
#
#
# $s0 -> Primeiro operando
# $s1 -> Segundo operando

.data

	INSERIR_OPERANDO_1: .asciiz "Insira o primeiro operando: \n"
	INSERIR_OPERANDO_2: .asciiz "Insira o segundo operando: \n"

.text

  la $t1, INSERIR_OPERANDO_1 # Lê o endereço da mensagem do primeiro operando
  add $a0, $t1, $zero # Armazena a string para syscall
  li $v0, 4 # 4 é o código para imprimir string
  syscall

  li $v0, 6 # 6 é o código para ler float
  syscall
  mfc1 $s0, $f0 # Move o valor liget_extdo do coproc-1 para o $s0

  la $t1, INSERIR_OPERANDO_2 # Lê o endereço da mensagem do segundo operando
  add $a0, $t1, $zero # Armazena a string para syscall
  li $v0, 4 # 4 é o código para imprimir string
  syscall

  li $v0, 6 # 6 é o código para ler float
  syscall
  mfc1 $s1, $f0 # Move o valor lido do coproc-1 para o $s1

	GET_EXP: # retorna o expoente (bit 32) da word passada em $a0
		srl $t0, $a0, 31
		add $v0, $t0, $zero
		jr $ra

	GET_MAN: # retorna mantissa (bit 22 ao 0) da word passada em $a0
		andi $v0, $a0, 0x007FFFFF
		jr $ra
