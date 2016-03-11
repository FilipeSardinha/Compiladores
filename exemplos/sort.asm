; EXTRN
extern	$bubble
; EXTRN
extern	$strcmp
; EXTRN
extern	$strdup
; EXTRN
extern	$readln
; EXTRN
extern	$new
; EXTRN
extern	$free
; EXTRN
extern	$prints
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
