; EXTRN
extern	$prints
; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$readi
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$a:
; BYTE
	resb	4
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$b:
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
	mov	[$a], eax
; CALL
	call	$readi
; TRASH
	add	esp, 0
; PUSH
	push	eax
; ADDRA
	pop	eax
	mov	[$b], eax
; ADDRV
	push	dword [$a]
; IMM
	push	dword 0
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; ADDRV
	push	dword [$b]
; IMM
	push	dword 0
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; JZ
	pop	eax
	cmp	eax, byte 0
	je	near $_i6
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i8:
; CHAR
	db	0x4F
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x76
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x72
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x65
; CHAR
	db	0x76
; CHAR
	db	0x65
; CHAR
	db	0x6D
; CHAR
	db	0x20
; CHAR
	db	0x73
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x20
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
	db	0x73
; CHAR
	db	0x0A
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
; JMP
	jmp	dword $_i7
; LABEL
$_i6:
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; JEQ
	pop	eax
	pop	ecx
	cmp	ecx, eax
	je	near $_i5
; JMP
	jmp	dword $_i1
; LABEL
$_i2:
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i3
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; SUB
	pop	eax
	sub	dword [esp], eax
; ADDRA
	pop	eax
	mov	[$a], eax
; JMP
	jmp	dword $_i4
; LABEL
$_i3:
; ADDRV
	push	dword [$b]
; ADDRV
	push	dword [$a]
; SUB
	pop	eax
	sub	dword [esp], eax
; ADDRA
	pop	eax
	mov	[$b], eax
; LABEL
$_i4:
; LABEL
$_i1:
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i2
; LABEL
$_i5:
; ADDRV
	push	dword [$a]
; CALL
	call	$printi
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
; LABEL
$_i7:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
