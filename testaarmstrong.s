
#Vinicius Vendramini - NUSP: 7991103
#Gervasio Santos - NUSP: 7990996
#EP1 de LabProg - primeiro semestre de 2013

	
.intel_syntax noprefix
.global testaarmstrong

a = 8 				#base da exponenciacao da funcao potencia
b = 12 				#expoente de potencia
n = 8 				#numero analisado na funcao descobredigitos
f = 8 				#argumetno de testaarmstrong
numdigit = -16 			#numero de digitos de f
digit = -8 			#digito de f
sum = -12 			#soma dos digitos de f, elevados ao numero de digitos
aux = -4 			#usada parar armazenar o valor de f, que eh alterado na execucao dos metodos


				#descobre o numero de digitos de um numero 
descobredigitos:
	push ebp 		#armazena a pilha
	mov ebp, esp
	mov eax, [ebp+n]	# x = n		
	mov ecx, 0		# cont = 0
	mov ebx, 10
	mov edx, 0
	
loop:	
	cmp eax, 0		# while( x != 0 )	
	je termino		# jump to termino if x == 0	
	inc ecx			# cont++
	div ebx			# x / = 10
	mov edx, 0		#zera edx para evitar erros na divisao
	jmp loop
	
termino:
	mov eax, ecx 		#move o resultado para eax
	pop ebp 		#volta a pilha
	ret

	



	
				#outra funcao. calcula pontencia.
potencia:
	push ebp		#salva pilha
	mov ebp, esp		
	mov ecx, [ebp+b]	#move o primeiro parametro pra ecx		
	mov ebx, [ebp+a]	#move segundo parametro para ebx
	mov eax, 1		#move 1 para eax
	
looop:
	mul ebx 		#multiplica eax por ebx			
	dec ecx			#decrementa ecx
	cmp ecx, 0		#se o contador (ecx) for zero, para o loop
	ja looop			

fim:
	pop ebp			#restaura a pilha
	ret			#retorna



				#funcao principal. Dado um inteiro, devolve 1 se for um numeor de armstrong e 0 c.c.
testaarmstrong:
	push ebp 		#salva pilha
	mov ebp, esp		
	
	sub esp, 16		#aloca espaco na memoria para var locais

	mov eax, [ebp+f]  	#manda o argumento para eax
	mov [ebp+aux], eax 	#copia o mesmo agumento para aux
	mov edx, 0		#zera regiistradores para evitar erro
	mov ecx, 0
	mov ebx, 0

	mov ebx, [ebp+f]	#move argumento para ebx
	push ebx		#coloca ebx na pilha
	call descobredigitos	#decobre o numero de digitos em f

	mov [ebp+numdigit], eax #armazena o resultado em numdigit
	mov edx, 0		#zera edx
	mov [ebp+sum], edx	#zera a soma

laco:
	mov edx, [ebp+aux]	#move auxiliar para edx
	cmp edx, 0		#se for zero, o loop se encerra
	je end			#pula pra end

	mov edx, 0		#inicializa os valores cabiveis nos registradores
	mov ecx, 0		
	mov ebx, 10
	mov eax, [ebp+aux]

	div ebx			#retira um digito do numero

	mov [ebp+aux], eax	#salva o quociente em aux
	mov [ebp+digit], edx	#salva o resto em digit

	push [ebp+numdigit]	#empilha digit e numdigit para chamada da funcao potencia
	push [ebp+digit]

	call potencia		#calcula pow(digit, numdigit)

	mov ecx, eax		#move resultado da potencia para ecx
	mov eax, [ebp+sum]	#move soma para eax
	add eax, ecx		#soma o resultado na soma
	mov [ebp+sum], eax	#volta resultado para sum

	jmp laco
	

end:
	add esp, 16		#libera espaco alocado
	cmp eax, [ebp+f]	#se f for igual a sum, ou seja, o numeri fir de armstrong
	je returntrue		#se for um numero de armstrong, pula para returntrue
	mov eax, 0		#zera o eax
	mov esp, ebp		#reseta a pilha
	pop ebp			
	ret			#return FALSE

returntrue:
	mov eax, 1		#coloca 1 em eax, ou seja, TRUE
	mov esp, ebp		#reseta a pilha
	pop ebp
	ret			#return TRUE
	