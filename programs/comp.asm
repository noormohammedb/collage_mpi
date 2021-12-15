data segment
	msg1 db 'enter the first number : $'
	msg2 db 0ah, 0dh, 'enter the second number : $'
	msg3 db 0ah, 0dh, 'the number are equal $'
	msg4 db 0ah, 0dh, 'the number are not equal $'
	num1 db ?
	num2 db ?
data ends

code segment
assume cs:code, ds:data
start:
		mov ax, data
		mov ds, ax

		lea dx, msg1
		mov ah, 09h
		int 21h

		mov ah, 01h
		int 21h
		sub al, 30h
		mov num1, al

		lea dx, msg2
		mov ah, 09h
		int 21h

		mov ah, 01h
		int 21h
		sub al, 30h
		mov num2, al

		mov al, num1
		mov bl, num2
		cmp al, bl

		jne notequal
		lea dx, msg3
		mov ah, 09h
		int 21h
		jmp stop
		
notequal:
		lea dx, msg4
		mov ah, 09h
		int 21h

stop:
		mov ah, 4ch
		int 21h

code ends
end start
		
