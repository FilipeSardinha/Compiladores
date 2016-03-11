; EXTRN
extern	$prints
; EXTRN
extern	$readi
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$a:
; BYTE
	resb	4
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$b:
; BYTE
	resb	4
; TEXT
segment	.text
; BSS
segment	.bss
; ALIGN
align	4
; LABEL
$c:
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i9:
; CHAR
	db	0x69
; CHAR
	db	0x6E
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x64
; CHAR
	db	0x75
; CHAR
	db	0x7A
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x61
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xB5
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x70
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x69
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i9
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
; ADDRA
	pop	eax
	mov	[$a], eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i10:
; CHAR
	db	0x69
; CHAR
	db	0x6E
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x64
; CHAR
	db	0x75
; CHAR
	db	0x7A
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x61
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xB5
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x73
; CHAR
	db	0x65
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6E
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i10
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
; ADDRA
	pop	eax
	mov	[$b], eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i11:
; CHAR
	db	0x69
; CHAR
	db	0x6E
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x64
; CHAR
	db	0x75
; CHAR
	db	0x7A
; CHAR
	db	0x61
; CHAR
	db	0x20
; CHAR
	db	0x61
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xB5
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
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
	db	0x63
; CHAR
	db	0x65
; CHAR
	db	0x69
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x3A
; CHAR
	db	0x20
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i11
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
; ADDRA
	pop	eax
	mov	[$c], eax
; ADDRV
	push	dword [$a]
; IMM
	push	dword 1
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; ADDRV
	push	dword [$b]
; IMM
	push	dword 1
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; ADDRV
	push	dword [$c]
; IMM
	push	dword 1
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; JZ
	pop	eax
	cmp	eax, byte 0
	je	near $_i7
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i12:
; CHAR
	db	0x41
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x69
; CHAR
	db	0x6D
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xB5
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x6C
; CHAR
	db	0x61
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x64
; CHAR
	db	0x65
; CHAR
	db	0x76
; CHAR
	db	0x65
; CHAR
	db	0x6D
; CHAR
	db	0x20
; CHAR
	db	0x73
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x20
; CHAR
	db	0x70
; CHAR
	db	0x6F
; CHAR
	db	0x73
; CHAR
	db	0x69
; CHAR
	db	0x74
; CHAR
	db	0x69
; CHAR
	db	0x76
; CHAR
	db	0x61
; CHAR
	db	0x73
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i12
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; JMP
	jmp	dword $_i8
; LABEL
$_i7:
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; ADD
	pop	eax
	add	dword [esp], eax
; ADDRV
	push	dword [$c]
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$c]
; ADD
	pop	eax
	add	dword [esp], eax
; ADDRV
	push	dword [$b]
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; ADDRV
	push	dword [$c]
; ADDRV
	push	dword [$b]
; ADD
	pop	eax
	add	dword [esp], eax
; ADDRV
	push	dword [$a]
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; JZ
	pop	eax
	cmp	eax, byte 0
	je	near $_i5
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i13:
; CHAR
	db	0x4E
; CHAR
	db	0xC3
; CHAR
	db	0xA3
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0xC3
; CHAR
	db	0xA9
; CHAR
	db	0x20
; CHAR
	db	0x75
; CHAR
	db	0x6D
; CHAR
	db	0x20
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i13
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; JMP
	jmp	dword $_i6
; LABEL
$_i5:
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$b]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; ADDRV
	push	dword [$b]
; ADDRV
	push	dword [$c]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; AND
	pop	eax
	and	dword [esp], eax
; JZ
	pop	eax
	cmp	eax, byte 0
	je	near $_i3
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i14:
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x65
; CHAR
	db	0x71
; CHAR
	db	0x75
; CHAR
	db	0x69
; CHAR
	db	0x6C
; CHAR
	db	0xC3
; CHAR
	db	0xA1
; CHAR
	db	0x65
; CHAR
	db	0x72
; CHAR
	db	0x6F
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i14
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; JMP
	jmp	dword $_i4
; LABEL
$_i3:
; ADDRV
	push	dword [$b]
; ADDRV
	push	dword [$c]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; ADDRV
	push	dword [$a]
; ADDRV
	push	dword [$c]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; OR
	pop	eax
	or	dword [esp], eax
; JZ
	pop	eax
	cmp	eax, byte 0
	je	near $_i1
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i15:
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x69
; CHAR
	db	0x73
; CHAR
	db	0xC3
; CHAR
	db	0xB3
; CHAR
	db	0x63
; CHAR
	db	0x65
; CHAR
	db	0x6C
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i15
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; JMP
	jmp	dword $_i2
; LABEL
$_i1:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL
$_i16:
; CHAR
	db	0x74
; CHAR
	db	0x72
; CHAR
	db	0x69
; CHAR
	db	0xC3
; CHAR
	db	0xA2
; CHAR
	db	0x6E
; CHAR
	db	0x67
; CHAR
	db	0x75
; CHAR
	db	0x6C
; CHAR
	db	0x6F
; CHAR
	db	0x20
; CHAR
	db	0x65
; CHAR
	db	0x73
; CHAR
	db	0x63
; CHAR
	db	0x61
; CHAR
	db	0x6C
; CHAR
	db	0x65
; CHAR
	db	0x6E
; CHAR
	db	0x6F
; CHAR
	db	0x0A
; CHAR
	db	0x00
; TEXT
segment	.text
; ADDR
	push	dword $_i16
; CALL
	call	$prints
; TRASH
	add	esp, 4
; PUSH
	push	eax
; LABEL
$_i2:
; LABEL
$_i4:
; LABEL
$_i6:
; LABEL
$_i8:
; IMM
	push	dword 0
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
