section .data
	
    moderead: db "r",0 		;modo de leitura de arquivos
    modewrite: db "w",0 	;modo de escrita de arquivos
    format: db "%d",0 		;formato entendido pelo fscanf
    string: db "%d ",10,0 	;formato usado pelo fprintf
    entrada: equ 8 		;parametro do ponteiro pro arquivo de entrada
    saida: equ 12 		;parametro do ponteiro pro arquivo de saida
	
section .bss
    y resd 1 			;variavel usada para receber leitura do fscanf
    finp resd 1 		;ponteiro para o arquvo de entrada
    foutp resd 1 		;idem para saida

	;; inclusao das funcoes cabiveis
	
section .text
    extern fopen 		
    extern fprintf
    extern fclose
    extern fscanf
    extern testaarmstrong
    global seleciona_armstrongs

	;;  le arquivo de texto e faz o que o enunciado pede
seleciona_armstrongs:        
    push ebp 			;salva base da pilha
    mov ebp,esp 		

	;;  call fopen na entrada
    push moderead 		;da push nos argumentos de fopen
    push dword[ebp+entrada]
    call fopen			;call da funcao
    mov [finp], eax 		;salva o arquivo recebido no ponteiro
    add esp, 8			;libera o espaco allocado

	;;  call fopen na saida
    push modewrite		;da push nos argumentos de fopen
    push dword[ebp+saida]
    call fopen			;call da funcao
    mov [foutp], eax		;salva o arquivo recebido num ponteiro
    add esp, 8			;libera o espaco allocado
	
    mov ebx, 0			;zera registradores para evitar erros
    mov esi, 0

lop:
    lea eax, [y]		;empilha os parametros para a fscanf
    push eax 			
    lea eax, [format]
    push eax
    mov eax, [finp] 
    push eax
    call fscanf 		;chama fscanf

    add esp, 12 		;libera os parametros

    cmp eax, -1 		;se estamos no EOF, pula para final
    je final 			
    mov edi, 0			;zera registrador que sera usado para armazenar valor de eax de fscanf

    mov edi, eax 		;move o resultado do fscanf para edi
    mov eax, [y] 		;passa o numero lido no fscanf para o eax
    push eax 			;empilha o valor para ser argumento de testaarmstrong
    call testaarmstrong 	;confere se um int eh armstrong
    add esp, 4 			;libera memoria
    add esi, eax 		;soma retorno de testaarmstrong em esi; guarda a quantidade de numeros de armstrong

    cmp eax, 0 			;se o numero nao for de armstrong vai para lop2, ou seja, nao imprime na saida
    je lop2
    push dword [y] 		;passa argumentos para fprintf
    push dword string
    push dword [foutp]
    call fprintf 		;chama fprintf para escrever y na saida
    add esp, 12 		;libera memoria

lop2:
    mov edx, 0 			;zera y
    mov [y], edx

   cmp edi, 0 			;verifica se loop deve continuar
   jg lop 

final:
	
   push dword[finp] 		;passa arugumento de fclose, fecha o arquivo de entrada
   call fclose 			
   add esp, 4 			;libera memoria
	
   push dword[foutp] 		;passa arquivo de saida
   call fclose
   add esp, 4 			;libera memoria
	
   mov eax, esi 		;passa o valor de retorno, o numero de numeros de armstrong lidos, para eax
   mov esp, ebp 		;restaura a base da pilha
   pop ebp 			
	
   ret 				;retorna
