readnum macro num
	mov ah, 01h
	int 21h
	sub al, 30h		;convert the ascii to binary
	mov num, al		;store number in num
	endm

printmsg	macro msg
	lea dx, msg
	mov ah, 09h
	int 21h
	endm

data segment
	cr equ 0dh
	lf equ 0ah
	msg1 db 'enter the first number : $'
	msg2 db lf, cr, 'enter the next number : $'
	msg3 db lf, cr, 'sum of the numbers is : $'
	array db 10 dup(0)
	num db ?
	result db 5 dup('$')
data ends

code segment
assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax

	mov si, offset array		;load the offset to array to si
	mov ch, 00h
	mov cl, 05h		;initialize cl to 05

	printmsg msg1
	readnum num		;read the first number

	mov al, num
	mov [si], al	;store the first number in array
	inc si		;increment si
	dec cx		;decrement cx

readnext:
	printmsg msg2
	readnum num		;read the next number

	mov al, num
	mov [si], al	;store the number in array
	inc si		;increment si
	loop readnext	; decrement cx and loop until cx=0

	mov si, offset array		;load the offset of array to si
	mov ax, 0000h		;initialize sum to 0
	mov cx, 0005h		;initialize cl with count of numbers

addnext:
	mov bl, [si]	;mov the number to bl
	mov bh, 00h
	add ax, bx		;add the number to sum
	inc si			;increment si to get the next number
	loop addnext 	;decrement cx and loop until cx=0

	mov si, offset result	;load offset of result to si
	call hex2ascii			;call procedure hex2ascii

	printmsg	msg3
	printmsg result		;print the result

	mov al, 00h
	mov ah, 4ch
	int 21h

hex2ascii	proc near		;procedure for converting binary to ascii
	mov bl, 0ah		;load 0a to bl
	div bl		;divide ax by bl
	add al, 30h		;add 30h to quotiant
	mov [si], al		;mov the result(ascii) to result
	inc si		;increment si
	add ah, 30h		;add 30h	to the remainder ah
	mov [si], ah		;move the result(ascii) to result
	inc si		;increment si
	mov al, '$'
	mov [si], al		;mov '$' to result
	ret
hex2ascii endp		;end of procedure

code ends
end start
