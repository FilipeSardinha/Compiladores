; EXTRN
extern	$prints
; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$atoi
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$cnt:
; INTEGER
	dd	0
; TEXT
segment	.text
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$ackermann:function
; LABEL
$ackermann:
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
	push	dword 0
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i3
; LOCV
	push	dword [ebp+12]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; ADDRA
	pop	eax
	mov	[$ackermann], eax
; JMP
	jmp	dword $_i4
; LABEL
$_i3:
; LOCV
	push	dword [ebp+12]
; IMM
	push	dword 0
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i1
; IMM
	push	dword 1
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL
	call	$ackermann
; TRASH
	add	esp, 8
; PUSH
	push	eax
; ADDRA
	pop	eax
	mov	[$ackermann], eax
; JMP
	jmp	dword $_i2
; LABEL
$_i1:
; LOCV
	push	dword [ebp+12]
; IMM
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; LOCV
	push	dword [ebp+8]
; CALL
	call	$ackermann
; TRASH
	add	esp, 8
; PUSH
	push	eax
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL
	call	$ackermann
; TRASH
	add	esp, 8
; PUSH
	push	eax
; ADDRA
	pop	eax
	mov	[$ackermann], eax
; LABEL
$_i2:
; LABEL
$_i4:
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
	push	dword 2
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i5
; LOCV
	push	dword [ebp+141692288]
; IMM
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$atoi
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LOCV
	push	dword [ebp+141692256]
; IMM
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; CALL
	call	$atoi
; TRASH
	add	esp, 8
; PUSH
	push	eax
; CALL
	call	$ackermann
; TRASH
	add	esp, 4
; PUSH
	push	eax
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
$_i6:
; CHAR
	db	0x20
; CHAR
	db	0x23
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
