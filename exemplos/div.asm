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
$n:
; BYTE
	resb	4
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$d:
; BYTE
	resb	4
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$i:
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i6:
; CHAR
	db	0x43
; CHAR
	db	0xC3
; CHAR
	db	0xA1
; CHAR
	db	0x6C
; CHAR
	db	0x63
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x69
; CHAR
	db	0x76
; CHAR
	db	0x69
; CHAR
	db	0x73
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
	db	0x20
; CHAR
	db	0x75
; CHAR
	db	0x6D
; CHAR
	db	0x20
; CHAR
	db	0x6E
; CHAR
	db	0xC3
; CHAR
	db	0xBA
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x6F
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i7:
; CHAR
	db	0x49
; CHAR
	db	0x6E
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x64
; CHAR
	db	0x75
; CHAR
	db	0x7A
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x6E
; CHAR
	db	0xC3
; CHAR
	db	0xBA
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x6F
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
; CALL
	call	$readi
; TRASH
	add	esp, 0
; PUSH
	push	eax
; ADDRA
	pop	eax
	mov	[$n], eax
; ADDRV
	push	dword [$n]
; IMM
	push	dword 0
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i5
; IMM
	push	dword 2
; ADDRA
	pop	eax
	mov	[$i], eax
; JMP
	jmp	dword $_i1
; LABEL
$_i2:
; ADDRV
	push	dword [$n]
; ADDRV
	push	dword [$i]
; MOD
	pop	ecx
	pop	eax
	cdq
	idiv	ecx
	push	edx
; IMM
	push	dword 0
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i3
; ADDRV
	push	dword [$i]
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
; ADDR
	push	dword $d
; INCR
	pop	eax
	add	dword [eax], 1
; LABEL
$_i3:
; ADDR
	push	dword $i
; INCR
	pop	eax
	add	dword [eax], 1
; LABEL
$_i1:
; ADDRV
	push	dword [$i]
; ADDRV
	push	dword [$n]
; IMM
	push	dword 2
; DIV
	pop	ecx
	pop	eax
	cdq
	idiv	ecx
	push	eax
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i2
; ADDRV
	push	dword [$d]
; IMM
	push	dword 0
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i4
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i8:
; CHAR
	db	0xC3
; CHAR
	db	0xA9
; CHAR
	db	0x20
; CHAR
	db	0x70
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x6F
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
; LABEL
$_i4:
; LABEL
$_i5:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
