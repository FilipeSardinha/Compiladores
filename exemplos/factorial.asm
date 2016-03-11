; EXTRN
extern	$printd
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
	sub	esp, 0
; LOCV
	push	dword [ebp+8]
; LOCA
	pop	eax
	mov	[ebp+8], eax
; LOCV
	push	dword [ebp+8]
; CALL
	call	$printd
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
