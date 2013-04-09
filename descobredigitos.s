.intel_syntax noprefix
.global descobredigitos

a = 8
b = 12
n = 8
numdigit = 4
digit = 8

	
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

