section .data

    fname db "data.txt",0
    mode db "r",0                                ;;set file mode for reading
    format db "%d", 0

;;--- end of the data section -----------------------------------------------;;

section .bss
    y resd 1
    fp resb 1

section .text
    extern fopen
	extern fscanf
	extern testaarmstrong
	global seleciona_armstrong

seleciona_armstrong:        
    push ebp
    mov ebp,esp

    mov eax, mode
    push eax
    mov eax, fname
    push eax
    call fopen                
    mov [fp], eax ;store file pointer
	mov ebx, 0
	mov esi, 0

lop:
    lea eax, [y]
    push eax        
    lea eax, [format]
    push eax
    mov eax, [fp] 
    push eax
    call fscanf
	cmp eax, -1
	je final
	mov edi, 0	

breakp:
	mov edi, eax
	mov eax, [y]
	push eax
	call testaarmstrong
	add esi, eax
	;pop eax

	mov edx, 0
	mov [y], edx

	cmp edi, 0
	jg lop 

final:
	mov eax, esi
	mov esp, ebp
	pop ebp
	ret
	

    ;Ele nao detecta numeros de armstrong
