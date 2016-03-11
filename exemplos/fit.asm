; DATA
segment	.data
; ALIGN
align	4
; LABEL
$PAGSIZ:
; INTEGER
	dd	1024
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$null:
; BYTE
	resb	4
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$base:
; INTEGER
	dd	0
; TEXT
segment	.text
; EXTRN
extern	$brk
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$abs:function
; LABEL
$abs:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 0
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 0
; JLT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jl	near $_i1
; LOCV
	push	dword [ebp+8]
; ADDRA
	pop	eax
	mov	[$abs], eax
; JMP
	jmp	dword $_i2
; LABEL
$_i1:
; LOCV
	push	dword [ebp+8]
; NEG
	neg	dword [esp]
; ADDRA
	pop	eax
	mov	[$abs], eax
; LABEL
$_i2:
; TEXT
segment	.text
; ALIGN
align	4
; GLOBL
global	$first:function
; LABEL
$first:
; ENTER
	push	ebp
	mov	ebp, esp
	sub	esp, 0
