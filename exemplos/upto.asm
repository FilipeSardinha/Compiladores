; EXTRN
extern	$printi
; EXTRN
extern	$println
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
