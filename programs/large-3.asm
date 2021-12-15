data segment
	msg1 db 'enter the first number: $'
	msg2 db 0ah, 0dh, 'enter the second number : $'
	msg3 db 0ah, 0dh, 'enter the third number : $'
	msg4 db 0ah, 0dh, 'the largest number is : $'
	num1 db ?
	num2 db ?
	num3 db ?
	largest db ?
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

	lea dx, msg3
	mov ah, 09h
	int 21h

	mov ah, 01h
	int 21h
	sub al, 30h
	mov num3, al

	mov al, num1
	mov bl, num1
	cmp al, bl
	jnc first

second:
	mov al, bl
	mov bl, num3
	cmp al, bl
	jc third
	mov largest, al
	jmp exit

first:
	mov bl, num3
	cmp al,bl
	jc third
	mov largest, al
	jmp exit

third:
	mov largest, bl

exit:
	lea dx, msg4
	mov ah, 09h
	int 21h

	mov dl, largest
	add dl, 30h
	mov ah, 02h
	int 21h

stop:
	mov ah, 4ch
	int 21h
	
code ends
end start
