; http://docs.cs.up.ac.za/programming/asm/derick_tut/syscalls.html

global _start

section .data
	message:     db 'Printout', 0xA
	messageLen:  equ $-message

section .text
_start:
	; Call write(2) syscall:
	;       ssize_t write(int fd, const void *buf, size_t count)
	mov eax, 4				; Syscall, sys_write: 
	mov ebx, 1				; fd: 1 is for stdout
	mov ecx, message		; buf: address of string
	mov edx, messageLen		; count: string length
	int 0x80				; interrupt
	
	; Call exit(2) syscall:
	;       void exit(int status)
	mov eax, 1				; Syscall, sys_exit
	mov ebx, 0				; status: exit status 0
	int 0x80
