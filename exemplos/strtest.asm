; EXTRN
extern	$prints
; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$strlen
; EXTRN
extern	$strchr
; EXTRN
extern	$strcpy
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
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 3
; JGE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jge	near $_i1
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i3:
; CHAR
	db	0x70
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x67
; CHAR
	db	0x72
; CHAR
	db	0x61
; CHAR
	db	0x6D
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x6E
; CHAR
	db	0x65
; CHAR
	db	0x63
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x73
; CHAR
	db	0x69
; CHAR
	db	0x74
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x65
; CHAR
	db	0x20
; CHAR
	db	0x32
; CHAR
	db	0x20
; CHAR
	db	0x61
; CHAR
	db	0x72
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x74
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x28
; CHAR
	db	0x73
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x73
; CHAR
	db	0x29
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
	push	dword 1
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
; JMP
	jmp	dword $_i2
; LABEL
$_i1:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i4:
; CHAR
	db	0x70
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x69
; CHAR
	db	0x72
; CHAR
	db	0x61
; CHAR
	db	0x3A
; CHAR
	db	0x20
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
; LOCV
	push	dword [ebp+135024232]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i5:
; CHAR
	db	0x0A
; CHAR
	db	0x73
; CHAR
	db	0x65
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6E
; CHAR
	db	0x64
; CHAR
	db	0x61
; CHAR
	db	0x3A
; CHAR
	db	0x20
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
; LOCV
	push	dword [ebp+135024736]
; IMM
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i6:
; CHAR
	db	0x0A
; CHAR
	db	0x6D
; CHAR
	db	0x61
; CHAR
	db	0x69
; CHAR
	db	0x6F
; CHAR
	db	0x72
; CHAR
	db	0x3A
; CHAR
	db	0x20
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
; LOCV
	push	dword [ebp+135025240]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; LOCV
	push	dword [ebp+135025384]
; IMM
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
; GT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setg	cl
	mov	[esp], ecx
; CALL
	call	$printi
; TRASH
	add	esp, 4
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i7:
; CHAR
	db	0x0A
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x6F
; CHAR
	db	0x72
; CHAR
	db	0x3A
; CHAR
	db	0x20
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
	push	dword [ebp+135025936]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; LOCV
	push	dword [ebp+135026080]
; IMM
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; CALL
	call	$printi
; TRASH
	add	esp, 4
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i8:
; CHAR
	db	0x0A
; CHAR
	db	0x69
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i8
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+135026632]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; LOCV
	push	dword [ebp+135026776]
; IMM
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; CALL
	call	$printi
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCAL
	lea	eax, [ebp+8]
	push	eax
; INCR
	pop	eax
	add	dword [eax], 2
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i9:
; CHAR
	db	0x0A
; CHAR
	db	0x73
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x63
; CHAR
	db	0x68
; CHAR
	db	0x72
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i9
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+135027784]
; IMM
	push	dword 0
; ADD
	pop	eax
	add	dword [esp], eax
; LOCV
	push	dword [ebp+135027640]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$strchr
; TRASH
	add	esp, 8
; PUSH
	push	eax
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+135028752]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; LOCV
	push	dword [ebp+8]
; CALL
	call	$strcpy
; TRASH
	add	esp, 8
; PUSH
	push	eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i10:
; CHAR
	db	0x0A
; CHAR
	db	0x63
; CHAR
	db	0xC3
; CHAR
	db	0xB3
; CHAR
	db	0x70
; CHAR
	db	0x69
; CHAR
	db	0x61
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i10
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+8]
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; CALL
	call	$println
; TRASH
	add	esp, 0
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
; LABEL
$_i2:
