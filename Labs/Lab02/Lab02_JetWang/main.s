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
	mov	r0, #67108864
	ldr	r3, .L4
	ldr	ip, .L4+4
	ldrh	r1, [r3, #48]
	ldr	r2, .L4+8
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	strh	ip, [r0]	@ movhi
	mov	r10, #19
	strh	r1, [r2]	@ movhi
	ldr	r0, .L4+12
	ldrh	ip, [r3, #48]
	ldr	r1, .L4+16
	ldr	r2, .L4+20
	mov	r9, #15
	ldr	r3, .L4+24
	strh	ip, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, #71
	mov	ip, #5
	mov	r7, #220
	mov	r6, #136
	mov	r0, #113
	mov	r5, #17
	mov	r4, #10
	mov	r1, #72
	mov	r2, #115
	mov	r3, #1
	ldr	r8, .L4+28
	str	r10, [r8]
	ldr	r8, .L4+32
	str	r9, [r8]
	ldr	r8, .L4+36
	str	lr, [r8]
	ldr	r8, .L4+40
	str	lr, [r8]
	ldr	lr, .L4+44
	str	ip, [lr]
	ldr	lr, .L4+48
	str	ip, [lr]
	ldr	ip, .L4+52
	str	r7, [ip]
	ldr	ip, .L4+56
	str	r6, [ip]
	ldr	ip, .L4+60
	str	r0, [ip]
	ldr	ip, .L4+64
	str	r0, [ip]
	ldr	r0, .L4+68
	str	r5, [r0]
	ldr	r0, .L4+72
	ldr	ip, .L4+76
	str	r4, [r0]
	ldr	r0, .L4+80
	str	r1, [ip]
	str	r1, [r0]
	ldr	lr, .L4+84
	ldr	ip, .L4+88
	ldr	r0, .L4+92
	ldr	r1, .L4+96
	str	r2, [lr]
	str	r2, [ip]
	str	r3, [r0]
	str	r3, [r1]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	buttons
	.word	32736
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	gHeight
	.word	gWidth
	.word	gRow0
	.word	gRow1
	.word	gCol0
	.word	gRow3
	.word	gCol1
	.word	gRow2
	.word	gCol2
	.word	gCol3
	.word	bHeight
	.word	bWidth
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
	.word	bRDel
	.word	bCDel
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L33
	ldrh	r3, [r3]
	ldr	r4, .L33+4
	tst	r3, #8
	ldrh	ip, [r4]
	sub	sp, sp, #20
	beq	.L7
	tst	ip, #8
	beq	.L32
.L7:
	ldr	r4, .L33+8
	ldr	r0, [r4]
	cmp	r0, #0
	movlt	r3, #0
	ldrlt	r2, .L33+12
	strlt	r0, [r2]
	movlt	r0, r3
	ldr	r6, .L33+16
	ldr	r2, [r6]
	strlt	r3, [r4]
	add	r3, r2, r0
	ldr	r5, .L33+20
	cmp	r3, #240
	ldrgt	r3, .L33+12
	ldr	r1, [r5]
	strgt	r0, [r3]
	rsbgt	r0, r2, #240
	strgt	r0, [r4]
	cmp	r1, #0
	movlt	r3, #0
	ldrlt	lr, .L33+24
	strlt	r1, [lr]
	movlt	r1, r3
	ldr	r7, .L33+28
	strlt	r3, [r5]
	ldr	r3, [r7]
	add	lr, r3, r1
	cmp	lr, #160
	ldrgt	lr, .L33+24
	strgt	r1, [lr]
	rsbgt	r1, r3, #160
	strgt	r1, [r5]
	tst	ip, #64
	ldreq	lr, .L33+24
	streq	r1, [lr]
	subeq	r1, r1, #1
	streq	r1, [r5]
	tst	ip, #128
	ldreq	lr, .L33+24
	streq	r1, [lr]
	addeq	r1, r1, #1
	streq	r1, [r5]
	tst	ip, #32
	ldreq	lr, .L33+12
	streq	r0, [lr]
	subeq	r0, r0, #1
	streq	r0, [r4]
	tst	ip, #16
	ldr	r10, .L33+32
	ldreq	ip, .L33+12
	ldr	r8, [r10]
	streq	r0, [ip]
	ldr	lr, .L33+36
	ldr	ip, .L33+40
	addeq	r0, r0, #1
	streq	r0, [r4]
	ldr	lr, [lr]
	ldr	ip, [ip]
	ldr	r9, .L33+44
	str	r8, [sp, #12]
	ldr	r8, [r9]
	str	lr, [sp, #4]
	str	r8, [sp, #8]
	str	ip, [sp]
	ldr	r8, .L33+48
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	cmp	r0, #0
	ldr	lr, .L33+52
	addne	r0, r2, r2, lsr #31
	ldr	lr, [lr]
	asrne	r0, r0, #1
	ldr	ip, .L33+56
	rsbne	r0, r0, #120
	ldreq	r0, [r4]
	strne	r0, [r4]
	ldr	ip, [ip]
	str	lr, [sp, #4]
	ldr	r3, [r7]
	ldr	lr, [r10]
	str	ip, [sp]
	addne	r1, r3, r3, lsr #31
	ldr	ip, [r9]
	asrne	r1, r1, #1
	rsbne	r1, r1, #80
	ldreq	r1, [r5]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	strne	r1, [r5]
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	cmp	r0, #0
	ldr	lr, .L33+60
	addne	r0, r2, r2, lsr #31
	ldr	lr, [lr]
	asrne	r0, r0, #1
	ldr	ip, .L33+64
	rsbne	r0, r0, #120
	ldreq	r0, [r4]
	strne	r0, [r4]
	ldr	ip, [ip]
	str	lr, [sp, #4]
	ldr	r3, [r7]
	ldr	lr, [r10]
	str	ip, [sp]
	addne	r1, r3, r3, lsr #31
	ldr	ip, [r9]
	asrne	r1, r1, #1
	rsbne	r1, r1, #80
	ldreq	r1, [r5]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	strne	r1, [r5]
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	cmp	r0, #0
	ldr	r3, [r7]
	ldr	ip, .L33+68
	ldr	fp, .L33+72
	addne	r0, r2, r2, lsr #31
	ldr	lr, [r10]
	addne	r1, r3, r3, lsr #31
	ldr	r9, [r9]
	ldr	ip, [ip]
	asrne	r0, r0, #1
	ldr	r10, [fp]
	asrne	r1, r1, #1
	rsbne	r0, r0, #120
	ldreq	r0, [r4]
	strne	r0, [r4]
	rsbne	r1, r1, #80
	ldreq	r1, [r5]
	stm	sp, {r10, ip}
	str	lr, [sp, #12]
	str	r9, [sp, #8]
	strne	r1, [r5]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L6
	ldr	r2, [r7]
	ldr	r3, [r6]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	rsb	r2, r2, #80
	rsb	r3, r3, #120
	str	r2, [r5]
	str	r3, [r4]
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	ldr	r3, .L33+76
	ldr	r0, .L33+80
	ldrh	r1, [r3]
	ldr	r2, .L33+84
	cmp	r1, r0
	moveq	r0, r2
	ldr	r2, .L33+88
	strh	r0, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	ldrh	ip, [r4]
	b	.L7
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.word	bCol
	.word	bOldCol
	.word	bWidth
	.word	bRow
	.word	bOldRow
	.word	bHeight
	.word	gHeight
	.word	gRow0
	.word	gCol0
	.word	gWidth
	.word	collision
	.word	gRow1
	.word	gCol1
	.word	gRow2
	.word	gCol2
	.word	gRow3
	.word	gCol3
	.word	bgColor
	.word	32736
	.word	1023
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L37
	ldrh	r3, [r3]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r6, .L37+4
	ldr	r5, .L37+8
	ldr	r9, .L37+12
	ldr	r8, .L37+16
	ldr	r4, .L37+20
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r9]
	ldr	r0, [r8]
	mov	lr, pc
	bx	r4
	mov	r1, #31744
	mov	r7, #992
	ldr	fp, .L37+24
	ldr	r10, .L37+28
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r0, [r10]
	str	r1, [sp]
	ldr	r1, [fp]
	mov	lr, pc
	bx	r4
	ldr	r6, .L37+32
	str	r7, [sp]
	ldr	r5, .L37+36
	ldr	r1, .L37+40
	ldr	r0, .L37+44
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	str	r7, [sp]
	ldr	r1, .L37+48
	ldr	r0, .L37+52
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	str	r7, [sp]
	ldr	r1, .L37+56
	ldr	r0, .L37+60
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	str	r7, [sp]
	ldr	r1, .L37+64
	ldr	r0, .L37+68
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r2, [fp]
	ldr	r3, [r10]
	str	r2, [r9]
	str	r3, [r8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	bgColor
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	drawRect
	.word	bRow
	.word	bCol
	.word	gHeight
	.word	gWidth
	.word	gRow0
	.word	gCol0
	.word	gRow1
	.word	gCol1
	.word	gRow2
	.word	gCol2
	.word	gRow3
	.word	gCol3
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r9, .L42+4
	ldr	r4, .L42+8
	ldr	r8, .L42+12
	ldr	r7, .L42+16
	ldr	r6, .L42+20
	ldr	r5, .L42+24
.L40:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L40
.L43:
	.align	2
.L42:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	gWidth,4,4
	.comm	gHeight,4,4
	.comm	gCol3,4,4
	.comm	gCol2,4,4
	.comm	gCol1,4,4
	.comm	gCol0,4,4
	.comm	gRow3,4,4
	.comm	gRow2,4,4
	.comm	gRow1,4,4
	.comm	gRow0,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
