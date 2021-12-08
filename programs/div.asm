DATA SEGMENT
	msg1 db 'enter the first number (divide) : $'
	msg2 db OAH, ODH, 'enter the second numner (diviser) : $'
	msg3 db OAH, ODH, 'the quotient is = $'
	msg4 db OAH, ODH, 'the remainder is = $'
	num1 db ?
	num2 db ?
	qnt db ?
	rem db ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:	mov ax, data
	mov ds, ax

	lea dx, msg1
	mov ah, 09h	; may get error
	int 21h

	mov ah, 01h
	int 21h
	sub a1, 30h
	mov num1, al
	
	lea dx, msg2
	mov ah, 09h
	int 21h

	mov ah, 01h
	int 21h
	sub al, 30h
	mov num2, al

	mov a1, num1
	mov ah, 00h
	mov bl, num2
	div bl

	add al, 30h
	mov qnt, al
	add ah, 30h
	mov rem, ah

	lea dx, msg3
	mov ah, 09h
	int 21h

	mov dl, qnt
	mov ah, 02h
	int 21h

	lea dx, msg4
	mov ah, 09h
	int 21h

	mov ah, 4ch
	int 21h
CODE ENDS
ENDS START
