; EXTRN
extern	$prints
; EXTRN
extern	$println
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$x:
; BYTE
	resb	4
; TEXT
segment	.text
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$entry:function
; LABEL
$entry:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 0
; JMP
	jmp	dword $_i1
; LABEL
$_i2:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i3:
; CHAR
	db	0x6F
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i3
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; ADDR
	push	dword $x
; INCR
	pop	eax
	add	dword [eax], 1
; LABEL
$_i1:
; ADDRV
	push	dword [$x]
; IMM
	push	dword 30
; JLT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jl	near $_i2
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
