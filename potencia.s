.intel_syntax noprefix
.global potencia


a = 8
b = 12
n = 8
numdigit = 4
digit = 8

potencia:
	push ebp		
	mov ebp, esp		
	mov ecx, [ebp+b]	
	dec ecx			
	mov ebx, [ebp+a]	
	mov eax, ebx
		
looop:
	mul ebx			
	dec ecx		
	cmp ecx, 0		
	ja looop			

fim:
	pop ebp			
	ret
	