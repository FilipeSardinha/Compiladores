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
$m:
; BYTE
	resb	4
; TEXT
segment	.text
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
	mov	[$m], eax
; ADDRV
	push	dword [$m]
; IMM
	push	dword 0
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i4
; JMP
	jmp	dword $_i1
; LABEL
$_i2:
; ADDRV
	push	dword [$x]
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
	push	dword $x
; INCR
	pop	eax
	add	dword [eax], 1
; ADDRV
	push	dword [$x]
; ADDRV
	push	dword [$m]
; JNE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jne	near $_i3
; LABEL
$_i3:
; ADDR
	push	dword $x
; INCR
	pop	eax
	add	dword [eax], 3
; LABEL
$_i1:
; ADDRV
	push	dword [$x]
; IMM
	push	dword 20
; JLT
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jl	near $_i2
; LABEL
$_i4:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
