readnum	macro num	;Macro definition with parameter NUM
	mov ah, 01h
	int 21h
	sub al, 30h
	mov num, al
	endm

printmsg	macro msg	;Macro definition with parameter MSG
	lea dx, msg
	mov ah, 09h
	int 21h
	endm

data segment
	msg1 db 'enter the first number: $'
	msg2 db 0ah, 0dh, 'enter the second number: $'
	msg3 db 0ah, 0dh, 'enter the third number: $'
	msg4 db 0ah, 0dh, 'the smallest number is: $'
	num1 db ?
	num2 db ?
	num3 db ?
	smallest db ?
data ends

code segment
assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax

	printmsg msg1	;Macro call with argument msg1
	readnum num1	;macro call with argument num1

	printmsg msg2	;Macro call with argument msg1
	readnum num2	;macro call with argument num1

	printmsg msg3	;Macro call with argument msg1
	readnum num3	;macro call with argument num1

	mov al, num1
	mov bl, num2
	cmp al, bl
	jc first			;if carry (num1 < num2), jump to first

second:
	mov al, bl		;if no carry (num1 > num2), mov num2 to al
	mov bl, num3
	cmp al, bl		;compare al and bl (num2 and num3)
	jnc third		;if no carry (num2 > num3), jump to third
	mov smallest, al	;if carry (num2 < num3), num 2 is smallest
	jmp exit

first:
	mov bl, num3	;mov num3 to bl
	cmp al, bl
	jnc third		;if no carry (num1 > num3), jump to third
	mov smallest, al	;if carry (num2 < num3), num1 is smallest
	jmp exit

third:
	mov smallest, bl	;if no carry, num3 is smallest

exit:
	printmsg msg4
	mov dl, smallest	;Mov smallest number to dl
	add dl, 30h
	mov ah, 02h
	int 21h

stop:
	mov ah, 4ch
	int 21h

code ends
end start
