# Mateus Luiz Freitas Barros - 15/0140801
#
#
# $s0 -> Primeiro operando
# $s1 -> Segundo operando

.data

	INSERIR_OPERANDO_1: 		.asciiz "Insira o primeiro operando: \n"
	INSERIR_OPERANDO_2: 		.asciiz "Insira o segundo operando: \n"
	ESCOLHER_OPERACAO_MSG:  .asciiz "Digite:\n - '1' para somar \n - '2' para multiplicar \n - '3' para sair \n"

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

	ESCOLHER_OPERACAO:
		la $t1, ESCOLHER_OPERACAO_MSG # Lê o endereço da mensagem para escolher o comando
		add $a0, $t1, $zero # Armazena o valor para o syscal
		li $v0, 4 # 4 é o código para imprimir $a0
		syscall
		li $v0, 5 # 5 é o código para ler inteiro
		syscall
		add $t1, $zero, 1
		add $t2, $zero, 2
		add $t3, $zero, 3
		beq $v0, $t1, SOMAR # Soma se o valor for 1
		beq $v0, $t2, SAIR # Multiplica se o valor for 2
		beq $v0, $t3, SAIR # Sai do programa se o valor for 3
		j ESCOLHER_OPERACAO # Se for nenhum dos valores anteriores, pede o input novamente

	SAIR:
		li $v0, 10 # 10 é o código para sair do programa
		syscall

	GET_EXP: # retorna o expoente (bit 32) da word passada em $a0
		srl $t0, $a0, 31
		add $v0, $t0, $zero
		jr $ra

	GET_MAN: # retorna mantissa (bit 22 ao 0) da word passada em $a0
		andi $v0, $a0, 0x007FFFFF
		jr $ra


	SOMAR: # Função de soma
		addi $sp, $zero, -4 # Alocar espaço na pilha
	
		j SAIR
