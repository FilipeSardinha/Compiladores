; EXTRN
extern	$prints
; EXTRN
extern	$printd
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i1:
; DOUBLE
	dq	0.000000e+00
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$pi:
; ID
	dd	$_i0
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i2:
; CHAR
	db	0x2D
; CHAR
	db	0x70
; CHAR
	db	0x69
; CHAR
	db	0x20
; CHAR
	db	0x3D
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i2
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; ADDRV
	push	dword [$pi]
; CALL
	call	$printd
; TRASH
	add	esp, 4
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i3:
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
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
