section .data

    finname: db "data.txt",0
    moderead: db "r",0
	foutname: db "saida.txt",0
	modewrite: db "w",0
    format: db "%d",0

	mensagem: db "testando",10,0
	string: db "%d ",10,0

section .bss
    y resd 1
    finp resd 1
	foutp resd 1

section .text
    extern fopen
	extern fprintf
	extern fclose
	extern fscanf
	extern testaarmstrong
	global seleciona_armstrong

seleciona_armstrong:        
    push ebp
    mov ebp,esp

	;Call fopen na entrada
    push moderead
    push finname
    call fopen    
    mov [finp], eax ;store file pointer
	add esp, 8

	push modewrite
	push foutname
	call fopen
	mov [foutp], eax
	add esp, 8
	
	mov ebx, 0
	mov esi, 0

lop:
    lea eax, [y]
    push eax
    lea eax, [format]
    push eax
    mov eax, [finp] 
    push eax
    call fscanf
	add esp, 12

	cmp eax, -1
	je final
	mov edi, 0	

	mov edi, eax
	mov eax, [y]
	push eax
	call testaarmstrong
	add esi, eax

	cmp eax, 0
	je lop2
	push dword [y]
	push dword string
	push dword [foutp]
	call fprintf
	add esp, 12

lop2:
	mov edx, 0
	mov [y], edx

	cmp edi, 0
	jg lop 

final:
	
	push dword[finp]
	call fclose
	add esp, 4
	
	push dword[foutp]
	call fclose
	add esp, 4
	
	mov eax, esi
	mov esp, ebp
	pop ebp
	
	ret
