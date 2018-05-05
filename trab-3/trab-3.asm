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

	SUB_EXP: # subtrai expoente
		andi $a0, $a0, 0x7F800000
		andi $a1, $a1, 0x7F800000
		srl $a0, $a0, 23
		srl $a1, $a1, 23
		sub $v0, $a0, $a1
		jr  $ra

	TRANSFORM_COMP_2: # TRANSFORM_COMP_2(sinal, masntissa)
		add $v0, $zero, $a1 # valor original no retorno para caso pule o comp de 2
		beq $a0, $zero, TRANSFORM_COMP_2_SAIR # SE o sinal for negativo, então faz a conversão
		xori $v0, $a1, 0xFFFFFFFF # inverte os bits
		addi $v0, $v0, 1 # soma mais '1'
		TRANSFORM_COMP_2_SAIR:
			jr $ra

	DESFAZER_COMP_2: # DESFAZER_COMP_2(valor)
		add $v0, $zero, $a0 # valor original no retorno caso o valor não seja negativo
		slt $t0, $a0, $zero # se o valor for menor que 0 então desfaz o complemento de 2
		beq $t0, $zero, DESFAZER_COMP_2_SAIR
		addi $v0, $a0, -1
		xori $v0, $v0, 0xFFFFFFFF # inverte os bits
		DESFAZER_COMP_2_SAIR:
			jr $ra

	NORM_SINGLE: # norm_single(valor, expoente do maior) / retorna mantissa normalizada e quantos bits foram shiftados positivamente ou negativamente
		addi $sp, $sp, -12
		sw $s2, 8($sp)
		sw $s1, 4($sp)
		sw $s0, 0($sp)

		add $s1, $zero, $zero # expoente = 0
		add $s0, $a0, $zero # $s0 = argumento
		add $s2, $a1, $zero # $s1 = argumento 2

		NORM_SINGLE_CHECAR_BIT_23:
			andi $t0, $s0, 0x00800000 # Checa de o bit '23' é '1'
			beq $t0, $zero, NORM_SINGLE_CHECAR_BIT_24 # não tiver bit no bit 23, então checa o bit 24
			j NORM_SINGLE_RETORNAR # se tiver '1' no bit 23 então mantissa já está normalizada

		NORM_SINGLE_CHECAR_BIT_24:
			andi $t0, $s0, 0x01000000 # Checa de o bit '24' é '1'
			beq $t0, $zero, NORM_SINGLE_RETORNAR # se não tiver bit no 24, então retorna a mantissa
			srl $s0, $s0, 1
			addi $s1, $zero, 1 # expoente++
			j NORM_SINGLE_CHECAR_BIT_23

		# TODO: Checar de possuí 1's depois da virgula, caso não tenha antes

		NORM_SINGLE_RETORNAR:
			andi $s0, $s0, 0x007FFFFF # pegar só a parte válida da mantissa (22 até o 0)
			beq $s1, $zero, NORM_SINGLE_RETORNAR_EXPOENTE_S2
			addi $t1, $s1, 127 # 127 + expoente (quantidade de shifts até normalizar)
			sll $t1, $t1, 23 # move tudo até o local do expoente no padrão IEEE
			NORM_SINGLE_RETORNAR_EXPOENTE_S2: # bota o expoente do alinhamento caso o expoente seja 0, ou seja, já tava normalizado
				add $t1, $s2, $zero
			or $v0, $t1, $s0 # arruma expoente com a mantissa

			lw $s0, 0($sp)
			lw $s1, 4($sp)
			lw $s2, 8($sp)
			addi $sp, $sp, 12 # desempilhar
			jr $ra


	SOMAR: # Função de soma: somar(a, b) // $s0 = a, $s1 = b, $s2 = get_man(a), $s3 = get_man(b)
		addi $sp, $sp, -20 # Alocar espaço na pilha
		sw $s0, 16($sp) # Guarda $s0 na pilha
		sw $s1, 12($sp) # Guarda $s1 na pilha
		sw $s4, 8($sp) # Guarda $s1 na pilha
		sw $s3, 4($sp) # Guarda $s1 na pilha
		sw $s5, 0($sp) # Guarda $s1 na pilha

		add $s0, $zero, $a0 # Guardar primeiro argumento em $s0
		add $s1, $zero, $a1 # Guardar segundo argumento em $s1

		add $a0, $zero, $s0 # passar valor de 'a' para o argumento de GET_MAN
		jal GET_MAN
		add $s3, $zero, $v0 # guarda valor da mantissa de 'a' em $s3
		ori $s3, $s3, 0x00800000 # Adiciona o bit '1' no bit 23 da mantissa de 'a'

		add $a0, $zero, $s1 # passar valor de 'b' para o argumento de GET_MAN
		jal GET_MAN
		add $s4, $zero, $v0 # guarda valor da mantissa de 'b' em $s4
		ori $s4, $s4, 0x00800000 # Adiciona o bit '1' no bit 23 da mantissa de 'b'

		add $a0, $s0, $zero
		add $a1, $s1, $zero
		jal SUB_EXP # SUBTRAIR expoente de A por expoente de B
		add $s5, $v0, $zero # guarda valor da subtração em $t1
		beq $v0, $zero, SOMAR_MANTISSA # se o retorno for 0, então vai direto pra soma

		slt $t0, $v0, $zero # se retorno < 0 seta $t0 pra 1
		beq $zero, $t0, ALINHAR_EXPOENTE_B # se o retorno é positivo, alinha a mantissa de b

		ALINHAR_EXPOENTE_A: # Alinha a mantissa de 'a' com a de 'b' para ser possível fazer a soma
			add $t0, $v0, $zero
			andi $s5, $s1, 0x7F800000 # Guarda expoente do maior
			ALINHAR_EXPOENTE_A_FOR:
				beq $t0, $zero, ALINHAR_EXPOENTE_A_FOR_END
				srl $s3, $s3, 1
				addi $t0, $t0, 1
				j ALINHAR_EXPOENTE_A_FOR
			ALINHAR_EXPOENTE_A_FOR_END:
				j SOMAR_MANTISSA

		ALINHAR_EXPOENTE_B: # Alinha a mantissa de 'b' com a de 'a' para ser possível fazer a soma
			add $t0, $v0, $zero
			andi $s5, $s0, 0x7F800000 # Guarda expoente do maior
			ALINHAR_EXPOENTE_B_FOR:
				beq $t0, $zero, ALINHAR_EXPOENTE_B_FOR_END
				srl $s4, $s4, 1
				addi $t0, $t0, -1
				j ALINHAR_EXPOENTE_B_FOR
			ALINHAR_EXPOENTE_B_FOR_END:
				j SOMAR_MANTISSA

		SOMAR_MANTISSA:
			andi $a0, $s0, 0x80000000 # bit do sinal
			add $a1, $zero, $s3
			jal TRANSFORM_COMP_2 # TRANSFORM_COMP_2(sinal, mantissa)
			add $s3, $v0, $zero # pega o valor que foi ou não convertido pra comp de 2

			andi $a0, $s1, 0x80000000 # bit do sinal
			add $a1, $zero, $s4
			jal TRANSFORM_COMP_2 # TRANSFORM_COMP_2(sinal, mantissa)
			add $s4, $v0, $zero # pega o valor que foi ou não convertido pra comp de 2

			add $a0, $s3, $s4 # soma as mantissas
			add $a1, $s5, $zero # passa o valor do maior expoente pra caso a soma já esteja normalizada
			jal NORM_SINGLE

		# desempilhar
		j SAIR
