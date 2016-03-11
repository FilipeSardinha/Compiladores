; EXTRN
extern	$prints
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
; IMM
	push	dword 1
; LOCA
	pop	eax
	mov	[ebp+8], eax
; JMP
	jmp	dword $_i6
; LABEL
$_i7:
; LOCV
	push	dword [ebp+8]
; JMP
	jmp	dword $_i6
; LABEL
$_i7:
; LOCV
	push	dword [ebp+8]
; IMM
	push	dword 3
; JLE
	pop	eax
	pop	ecx
	cmp	ecx, eax
	jle	near $_i5
; LABEL
$_i5:
; JMP
	jmp	dword $_i6
; LABEL
$_i7:
; LABEL
$_i6:
; IMM
	push	dword 0
; JNZ
	pop	eax
	cmp	eax, byte 0
	jne	near $_i7
; LABEL
$_i6:
; IMM
	push	dword 0
; JNZ
	pop	eax
	cmp	eax, byte 0
	jne	near $_i7
; LABEL
$_i6:
; IMM
	push	dword 0
; JNZ
	pop	eax
	cmp	eax, byte 0
	jne	near $_i7
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
