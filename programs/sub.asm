DATA SEGMENT
	MSG1 DB 'ENTER THE FIRST NUMBER: $'
	msg2 db 0ah, 0dh, 'enter the second number: $'
	msg3 db 0ah, 0dh, 'the difference is = $'
	num1 db ?
	num2 db ?
data ends

code segment
assume cs:code, ds:data

start:	mov ax, data
			mov ds, ax
		
			lea dx, msg1	;Print msg1
			mov ah, 09h
			int 21h
		
			mov ah, 01h
			int 21h			;Read the firest number
			sub al, 30h		;Convert the ASCII value to binary
			mov num1, al	;store the firest number in num1
		
			lea dx, msg2	;print msg2
			mov ah, 09h
			int 21h
		
			mov ah, 01h
			int 21h			;Read the second number
			sub al, 30h		;Convert the ASCII value to binary
			mov num2, al	;Store the second number in num2
		
			lea dx, msg3	;Print msg3
			mov ah, 09h
			int 21h
		
			mov al, num1	;Move the firest number to AL
			mov bl, num2	;Move the second number to BL
			sub al, bl		;Subtract BL from AL and store result in AL
		
			ADD al, 30h		;Convert binary value to ascii for display
			mov dl, al
			mov ah, 02h
			int 21h			;Display the difference NUM1-NUM2
		
			
			mov ah, 4ch
			int 21h

code ends
end start
