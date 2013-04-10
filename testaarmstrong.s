.intel_syntax noprefix
.global testaarmstrong

a = 8
b = 12
n = 8
f = 8
numdigit = -16
digit = -8
sum = -12
aux = -4


	
descobredigitos:
	push ebp
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
	mov edx, 0
	jmp loop
	
termino:
	mov eax, ecx
	pop ebp
	ret

	



	
	
potencia:
	push ebp		
	mov ebp, esp		
	mov ecx, [ebp+b]	
	#dec ecx			
	mov ebx, [ebp+a]	
	mov eax, 1	
	
looop:
	mul ebx			
	dec ecx		
	cmp ecx, 0		
	ja looop			

fim:
	pop ebp			
	ret			




testaarmstrong:
	push ebp
	mov ebp, esp
	
	sub esp, 16

	mov eax, [ebp+f]
	mov [ebp+aux], eax
	mov edx, 0
	mov ecx, 0
	mov ebx, 0

	mov ebx, [ebp+f]
	push ebx
	#push eax
	call descobredigitos

	mov [ebp+numdigit], eax
	mov edx, 0
	mov [ebp+sum], edx

laco:
	mov edx, [ebp+aux]
	cmp edx, 0
	je end

	mov edx, 0
	mov ecx, 0
	mov ebx, 10
	mov eax, [ebp+aux]

	div ebx

	mov [ebp+aux], eax
	mov [ebp+digit], edx

	push [ebp+numdigit]
	push [ebp+digit]

	call potencia

	mov ecx, eax
	mov eax, [ebp+sum]
	add eax, ecx
	mov [ebp+sum], eax

	jmp laco
	

end:
	add esp, 16
	cmp eax, [ebp+f]
	je returntrue
	mov eax, 0
	mov esp, ebp
	pop ebp
	ret

returntrue:
	mov eax, 1
	mov esp, ebp
	pop ebp
	ret
	