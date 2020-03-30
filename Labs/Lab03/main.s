	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldr	r3, .L8
	ldr	ip, [r3]
	ldr	r1, .L8+4
	add	r3, ip, #47872
	ldr	r0, .L8+8
	strh	r1, [r2]	@ movhi
	add	r1, r3, #126
	sub	r2, ip, #2
.L2:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L2
	mvn	r1, #49152
	ldr	r2, .L8+12
	add	r3, r3, #126
	add	r2, ip, r2
.L3:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L3
	bx	lr
.L9:
	.align	2
.L8:
	.word	videoBuffer
	.word	1027
	.word	32239
	.word	76798
	.size	initialize, .-initialize
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r1]
	str	r2, [r0]
	str	r3, [r1]
	bx	lr
	.size	swap, .-swap
	.align	2
	.global	drawPerson
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPerson, %function
drawPerson:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r6, r2, #0
	ble	.L11
	mov	r7, r3
	sub	r4, r0, #4
	ldr	r8, .L16
	add	r6, r4, r6, lsl #2
	sub	r5, r1, #4
.L13:
	ldr	r0, [r4, #4]!
	mov	r2, r7
	ldr	r1, [r5, #4]!
	mov	lr, pc
	bx	r8
	cmp	r4, r6
	bne	.L13
.L11:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	setPixel
	.size	drawPerson, .-drawPerson
	.align	2
	.global	drawBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBackground, %function
drawBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	ip, [r3]
	ldr	r0, .L24+4
	add	r3, ip, #47872
	add	r1, r3, #126
	sub	r2, ip, #2
.L19:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r2, r1
	bne	.L19
	mvn	r1, #49152
	ldr	r2, .L24+8
	add	r3, r3, #126
	add	r2, ip, r2
.L20:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L20
	bx	lr
.L25:
	.align	2
.L24:
	.word	videoBuffer
	.word	32239
	.word	76798
	.size	drawBackground, .-drawBackground
	.align	2
	.global	drawCactus
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCactus, %function
drawCactus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L28
	sub	sp, sp, #8
	ldr	r5, .L28+4
	mov	r3, #9
	mov	r2, #4
	mov	r1, #79
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	add	r0, r4, #4
	mov	r3, #4
	mov	r2, #3
	mov	r1, #84
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	add	r0, r4, #7
	mov	r3, #30
	mov	r2, #6
	mov	r1, #72
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	add	r0, r4, #13
	mov	r3, #4
	mov	r2, #3
	mov	r1, #87
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #9
	mov	r2, #4
	mov	r1, #82
	str	r6, [sp]
	add	r0, r4, #16
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	4067
	.word	drawRect
	.size	drawCactus, .-drawCactus
	.align	2
	.global	eraseCactus
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseCactus, %function
eraseCactus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, .L32
	sub	sp, sp, #12
	str	r2, [sp]
	ldr	r5, .L32+4
	mov	r3, #28
	mov	r2, #20
	mov	r1, #72
	mov	lr, pc
	bx	r5
	ldr	r3, .L32+8
	mov	r0, r4
	str	r3, [sp]
	mov	r2, #20
	mov	r3, #2
	mov	r1, #100
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	32239
	.word	drawRect
	.word	16383
	.size	eraseCactus, .-eraseCactus
	.align	2
	.global	drawCacti
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCacti, %function
drawCacti:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L39
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L34
	mov	r4, #0
	add	r6, r7, #4
	add	r5, r7, #16
.L36:
	ldr	r0, [r6], #4
	bl	eraseCactus
	ldr	r0, [r5], #4
	bl	drawCactus
	ldr	r3, [r7]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L36
.L34:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawCacti, .-drawCacti
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L79
	ldr	r3, .L79+4
	strh	r1, [r2]	@ movhi
	ldr	r1, [r3]
	ldr	ip, .L79+8
	add	r3, r1, #47872
	add	r0, r3, #126
	sub	r2, r1, #2
.L42:
	strh	ip, [r2, #2]!	@ movhi
	cmp	r2, r0
	bne	.L42
	mvn	r0, #49152
	ldr	r2, .L79+12
	add	r3, r3, #126
	add	r2, r1, r2
.L43:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L43
	ldr	r7, .L79+16
	ldr	r8, .L79+20
	ldr	r4, .L79+24
	ldr	r6, .L79+28
	ldr	r5, .L79+32
.L58:
	ldr	r2, .L79+36
	ldr	r3, .L79+40
	ldrh	lr, [r2]
	strh	lr, [r3]	@ movhi
	ldr	r3, .L79+44
	ldrh	ip, [r3, #48]
	ldr	r3, .L79+48
	strh	ip, [r2]	@ movhi
	sub	r0, r3, #12
.L46:
	ldr	r2, [r3], #4
	add	r1, r2, #1
	cmp	r1, #220
	str	r2, [r0], #4
	movgt	r2, #0
	strle	r1, [r3, #-4]
	strgt	r2, [r3, #-4]
	cmp	r3, r7
	bne	.L46
	tst	lr, #8
	ldm	r8, {r3, r10}
	beq	.L47
	tst	ip, #8
	bne	.L47
	cmp	r3, #0
	beq	.L77
	cmp	r10, #45
	beq	.L59
.L54:
	add	r10, r10, #1
	str	r10, [r8, #4]
.L50:
	ldr	r3, .L79+52
	mov	lr, pc
	bx	r3
	ldr	r9, .L79+56
	ldr	r10, .L79+60
	ldr	fp, .L79+8
.L56:
	ldr	r0, [r9, #4]!
	mov	r2, fp
	ldr	r1, [r10, #4]!
	mov	lr, pc
	bx	r5
	cmp	r6, r9
	bne	.L56
	ldr	r3, .L79+64
	mov	lr, pc
	bx	r3
	ldr	r9, .L79+68
	ldr	r10, .L79+72
	ldr	fp, .L79+76
.L57:
	ldr	r0, [r9, #4]!
	mov	r2, fp
	ldr	r1, [r10, #4]!
	mov	lr, pc
	bx	r5
	cmp	r9, r4
	bne	.L57
	b	.L58
.L47:
	cmp	r10, #45
	beq	.L78
	cmp	r3, #0
	bne	.L54
	b	.L50
.L78:
	cmp	r3, #0
	beq	.L50
.L59:
	mov	r3, #0
	ldr	r0, .L79+56
	str	r3, [r8, #4]
	str	r3, [r8]
	ldr	r1, .L79+72
	ldr	r3, .L79+68
	ldr	r2, .L79+60
.L53:
	ldr	r9, [r3, #4]!
	ldr	lr, [r0, #4]!
	ldr	ip, [r1, #4]!
	str	lr, [r3]
	ldr	lr, [r2, #4]!
	cmp	r3, r4
	str	r9, [r0]
	str	lr, [r1]
	str	ip, [r2]
	bne	.L53
	b	.L50
.L77:
	mov	r2, #1
	ldr	r3, .L79+68
	str	r2, [r8]
	ldr	r0, .L79+56
	ldr	r1, .L79+72
	ldr	r2, .L79+60
.L49:
	ldr	r9, [r3, #4]!
	ldr	lr, [r0, #4]!
	ldr	ip, [r1, #4]!
	str	lr, [r3]
	ldr	lr, [r2, #4]!
	cmp	r3, r4
	str	r9, [r0]
	str	lr, [r1]
	str	ip, [r2]
	bne	.L49
	b	.L54
.L80:
	.align	2
.L79:
	.word	1027
	.word	videoBuffer
	.word	32239
	.word	76798
	.word	.LANCHOR0+28
	.word	.LANCHOR1
	.word	visiblePersonCols+756
	.word	invisiblePersonCols+756
	.word	setPixel
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	.LANCHOR0+16
	.word	waitForVBlank
	.word	invisiblePersonCols-4
	.word	invisiblePersonRows-4
	.word	drawCacti
	.word	visiblePersonCols-4
	.word	visiblePersonRows-4
	.word	32767
	.size	main, .-main
	.text
	.align	2
	.global	advanceCacti
	.syntax unified
	.arm
	.fpu softvfp
	.type	advanceCacti, %function
advanceCacti:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r3, .L87
	sub	r0, r3, #12
	add	ip, r3, #12
.L84:
	ldr	r2, [r3], #4
	add	r1, r2, #1
	cmp	r1, #220
	strle	r1, [r3, #-4]
	strgt	lr, [r3, #-4]
	cmp	r3, ip
	str	r2, [r0], #4
	bne	.L84
	ldr	lr, [sp], #4
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0+16
	.size	advanceCacti, .-advanceCacti
	.global	time
	.global	up
	.global	cactusColsLength
	.global	oldCactusCols
	.global	cactusCols
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cactusColsLength, %object
	.size	cactusColsLength, 4
cactusColsLength:
	.word	3
	.type	oldCactusCols, %object
	.size	oldCactusCols, 12
oldCactusCols:
	.word	0
	.word	73
	.word	147
	.type	cactusCols, %object
	.size	cactusCols, 12
cactusCols:
	.word	0
	.word	73
	.word	147
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	up, %object
	.size	up, 4
up:
	.space	4
	.type	time, %object
	.size	time, 4
time:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
