; EXTRN
extern	$prints
; EXTRN
extern	$readi
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
; CALL
	call	$readi
; TRASH
	add	esp, 0
; PUSH
	push	eax
; ADDRA
	pop	eax
	mov	[$x], eax
; ADDRV
	push	dword [$x]
; IMM
	push	dword 0
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i1
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i4:
; CHAR
	db	0x70
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x69
; CHAR
	db	0x74
; CHAR
	db	0x69
; CHAR
	db	0x76
; CHAR
	db	0x6F
; CHAR
	db	0x21
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i4
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LABEL
$_i1:
; ADDRV
	push	dword [$x]
; IMM
	push	dword 0
; JGE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jge	near $_i2
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i5:
; CHAR
	db	0x6E
; CHAR
	db	0x65
; CHAR
	db	0x67
; CHAR
	db	0x61
; CHAR
	db	0x74
; CHAR
	db	0x69
; CHAR
	db	0x76
; CHAR
	db	0x6F
; CHAR
	db	0x21
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i5
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LABEL
$_i2:
; ADDRV
	push	dword [$x]
; IMM
	push	dword 0
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i3
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i6:
; CHAR
	db	0x6E
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x21
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i6
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LABEL
$_i3:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
