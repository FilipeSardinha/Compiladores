; EXTRN
extern	$printi
; EXTRN
extern	$println
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
	sub	esp, 4
; LOCV
	push	dword [ebp+8]
; CALL
	call	$fptr
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
	push	dword [$entry]
; LOCA
	pop	eax
	mov	[ebp+-4], eax
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 0
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i1
; LOCV
	push	dword [ebp+16]
; LOCV
	push	dword [ebp+12]
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL
	call	$fptr
; TRASH
	add	esp, 12
; PUSH
	push	eax
; LABEL
$_i1:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
