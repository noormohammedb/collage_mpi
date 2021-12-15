data segment
	msg1 db 'enter the number : $'
	msg2 db 0ah, 0dh, 'the number is odd $'
	msg3 db 0ah, 0dh, 'the number is even $'
	num db ?
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
		mov num, al

		mov al, num
		mov ah, 00h
		shr al, 1

		jc odd

		lea dx, msg3
		mov ah, 09h
		int 21h
		jmp stop

odd:
		lea dx, msg2
		mov ah, 09h
		int 21h

stop:
		mov ah, 4ch
		int 21h

code ends
end start
