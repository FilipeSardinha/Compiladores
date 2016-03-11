; EXTRN
extern	$prints
; EXTRN
extern	$printi
; EXTRN
extern	$println
; EXTRN
extern	$readi
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x0:
; INTEGER
	dd	1
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x1:
; INTEGER
	dd	2
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x2:
; INTEGER
	dd	3
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x3:
; INTEGER
	dd	5
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x4:
; INTEGER
	dd	7
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x5:
; INTEGER
	dd	9
; TEXT
segment	.text
; DATA
segment	.data
; ALIGN
align	4
; LABEL
$x:
; INTEGER
	dd	161884832
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
; LOCA
	pop	eax
	mov	[ebp+8], eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i1:
; CHAR
	db	0x78
; CHAR
	db	0x5B
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
; LOCV
	push	dword [ebp+8]
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
$_i2:
; CHAR
	db	0x5D
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
; LOCV
	push	dword [ebp+161886136]
; LOCV
	push	dword [ebp+8]
; ADD
	pop	eax
	add	dword [esp], eax
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
