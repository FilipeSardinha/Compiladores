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
$cnt:
; BYTE
	resb	4
; TEXT
segment	.text
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$fibonacci:function
; LABEL
$fibonacci:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 0
; ADDR
	push	dword $cnt
; INCR
	pop	eax
	add	dword [eax], 1
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 1
; JGT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jg	near $_i1
; LOCV
	push	dword [ebp+8]
; ADDRA
	pop	eax
	mov	[$fibonacci], eax
; JMP
	jmp	dword $_i2
; LABEL
$_i1:
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL
	call	$fibonacci
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 2
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL
	call	$fibonacci
; TRASH
	add	esp, 4
; PUSH
	push	eax
; ADD
	pop	eax
	add	dword [esp], eax
; ADDRA
	pop	eax
	mov	[$fibonacci], eax
; LABEL
$_i2:
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
$_i3:
; CHAR
	db	0x51
; CHAR
	db	0x75
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x20
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x6D
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xA9
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0x65
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x65
; CHAR
	db	0x20
; CHAR
	db	0x46
; CHAR
	db	0x69
; CHAR
	db	0x62
; CHAR
	db	0x6F
; CHAR
	db	0x6E
; CHAR
	db	0x61
; CHAR
	db	0x63
; CHAR
	db	0x63
; CHAR
	db	0x69
; CHAR
	db	0x20
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x63
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x63
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x72
; CHAR
	db	0x3F
; CHAR
	db	0x20
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
; CALL
	call	$readi
; TRASH
	add	esp, 0
; PUSH
	push	eax
; LOCA
	pop	eax
	mov	[ebp+8], eax
; LOCV
	push	dword [ebp+8]
; CALL
	call	$fibonacci
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCA
	pop	eax
	mov	[ebp+8], eax
; LOCV
	push	dword [ebp+8]
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
; ADDRV
	push	dword [$cnt]
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
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
