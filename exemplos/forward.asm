; EXTRN
extern	$entry
; EXTRN
extern	$prints
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i1:
; CHAR
	db	0x6F
; CHAR
	db	0x6C
; CHAR
	db	0xC3
; CHAR
	db	0xA1
; CHAR
	db	0x20
; CHAR
	db	0x70
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x73
; CHAR
	db	0x6F
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x21
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i1
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
