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
		add $a0, $zero, $s0 # Passar o primeiro operando para o primeiro argumento
		add $a1, $zero, $s1 # Passar o segundo operando para o segundo argumento
		beq $v0, $t1, SOMAR # somar(a, b) se valor do input for 1
		beq $v0, $t2, SAIR # multiplicar(a, b)  se valor do input for
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


	SOMAR: # Função de soma: somar(a, b) // $s0 = a, $s1 = b, $s2 = get_man(a), $s3 = get_man(b)
		addi $sp, $sp, -16 # Alocar espaço na pilha
		sw $s0, 12($sp) # Guarda $s0 na pilha
		sw $s1, 8($sp) # Guarda $s1 na pilha
		sw $s2, 4($sp) # Guarda $s1 na pilha
		sw $s3, 0($sp) # Guarda $s1 na pilha

		add $s0, $zero, $a0 # Guardar primeiro argumento em $s0
		add $s1, $zero, $a1 # Guardar segundo argumento em $s1

		add $a0, $zero, $s0 # passar valor de 'a' para o argumento de GET_MAN
		jal GET_MAN
		add $s3, $zero, $v0 # guarda valor da mantissa de 'a' em $s3

		add $a0, $zero, $s0 # passar valor de 'b' para o argumento de GET_MAN
		jal GET_MAN
		add $s4, $zero, $v0 # guarda valor da mantissa de 'b' em $s4

		ori $s3, $s3, 0x01000000 # Adiciona o bit '1' no bit 23 da mantissa de 'a'
		ori $s4, $s4, 0x01000000 # Adiciona o bit '1' no bit 23 da mantissa de 'b'

		add $t0, $s3, $s4 # soma as mantissas

		j SAIR
