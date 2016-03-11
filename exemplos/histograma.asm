; EXTRN
extern	$prints
; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$readi
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$cruzes:function
; LABEL
$cruzes:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 0
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 50
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i4
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i6:
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x58
; CHAR
	db	0x2E
; CHAR
	db	0x2E
; CHAR
	db	0x2E
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
; JMP
	jmp	dword $_i5
; LABEL
$_i4:
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 0
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i3
; JMP
	jmp	dword $_i1
; LABEL
$_i2:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i7:
; CHAR
	db	0x58
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i7
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+8]
; LABEL
$_i1:
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 0
; JGT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jg	near $_i2
; LABEL
$_i3:
; LABEL
$_i5:
; EXTRN
extern	$atoi
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
