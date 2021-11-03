data segment
		msg1 db 'enter first number : $'
		msg2 db 0AH, 0DH, 'enter the second number : $'
		msg3 db 0AH, 0DH, 'enter the sum is = $'
		num1 db ?
		num2 db ?
data ends

code segment
assume cs:code,ds:data
start:		mov AX, data
				mov ds, ax
				
				lea dx, msg1	;Print msg1
				mov ah, 09h
				int 21h
				
				mov ah, 01h		;read the first number
				int 21h			;convert the ascii value to binary
				sub al,30h		;store the first number in num1
				mov num1,al
				
				lea dx,msg2		;print msg2
				mov ah,09h
				int 21h
				
				mov ah,01h
				int 21h				;read the second number
				sub al,30h		;convert the ascii value to binary
				mov num1,al		;store the second number in num2
				
				lea dx,msg3
				mov ah,09h
				int 21h
				
				mov al, num1	;move the first number to al
				mov bl, num2	;move the second number to bl
				add al,bl			;add the numbers and store resutl in al
				
				add al,30h		;convert binary value to ascii for display
				mov dl,al
				mov ah,02h
				int 21h				;display the sum num1+num2
				
				mov ah,4ch
				int 21h
				
code ends
end start
