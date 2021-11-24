DATA SEGMENT
	MSG1 db 'enter the first number : $'
	MSG2 db 0ah, 0dh, 'enter the second number: $'
	MSG3 db 0ah, 0dh, 'the product is = $'
	NUM1 db ?
	NUM2 db ?
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START:	MOV AX, DATA
			mov ds, ax
			
			lea dx, msg1	;Print msg1
			mov ah, 09h
			int 21h

			mov ah, 01h
			int 21h			;Read the first number
			sub al, 30h		;Convert the ASCII value to binary
			mov num1, al	;Store the first number in num1

			lea dx, msg2	;Print msg2
			mov ah, 09h
			int 21h

			mov ah, 01h
			int 21h			;Read the second number
			sub al, 30h		;Convert the ASCII value to binary
			mov num2, al	;store the second number in NUM2

			lea dx, msg3	;Print msg3
			mov ah, 09h
			int 21h

			mov al, num1		;Move the first number to AL
			mov bl, num2		;Move the second number to BL
			mul bl				;Multiply AL and BL and store product in AX

			add al, 30h			;Convert binary value to ASCII for display
			mov dl, al
			mov ah, 02h
			int 21h				;Display the product

			mov ah, 4ch
			int 21h
CODE ENDS
END START
