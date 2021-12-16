printmsg macro msg	;macro for printing message
	mov ah, 09h
	lea dx, msg
	int 21h
	endm

data segment
	cr equ 0dh
	lf equ 0ah
	msg1 db 'enter the string : $'
	msg2 db 'entered string is : $'
	buff db 80 dup(0)
data ends

code segment
assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	
	printmsg msg1
	
	mov si, offset buff		;move the offset of buffer to si

read:
	mov ah, 01h		;loop for reading string
	int 21h
	mov [si], al
	inc si
	cmp al, cr		;compare the charactor with cariage return
	jne read			;if not equal, read the next character

	mov al, '$'
	mov [si], al	;attach '$' at the end of string

	printmsg msg2
	printmsg buff	;print the contents of buff(string)

	mov ah, 4ch
	int 21h

code ends
end start
