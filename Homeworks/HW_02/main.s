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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	ldr	r3, .L4
	ldr	ip, .L4+4
	ldrh	r1, [r3, #48]
	ldr	r2, .L4+8
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	ip, .L4+12
	ldrh	lr, [r3, #48]
	sub	sp, sp, #12
	mov	fp, #31744
	ldr	r6, .L4+16
	mov	r1, r4
	mov	r0, r4
	str	r4, [sp]
	mov	r3, #160
	strh	lr, [ip]	@ movhi
	mov	r2, #240
	mov	lr, pc
	bx	r6
	mov	r1, #30
	mov	r9, #155
	mov	r7, #60
	mov	r5, #3
	mov	ip, #120
	mov	lr, #70
	ldr	r2, .L4+20
	ldr	r10, .L4+24
	ldr	r0, [r2]
	str	fp, [sp]
	str	r4, [r10]
	ldr	r10, .L4+28
	str	r1, [r10]
	ldr	r10, .L4+32
	str	r9, [r10]
	ldr	r9, .L4+36
	str	r7, [r9]
	ldr	r9, .L4+40
	str	r7, [r9]
	ldr	r7, .L4+44
	str	r5, [r7]
	ldr	r7, .L4+48
	str	r5, [r7]
	ldr	r7, .L4+52
	str	ip, [r7]
	ldr	r7, .L4+56
	add	r0, r0, r0, lsr #31
	str	ip, [r7]
	ldr	r7, .L4+60
	asr	r0, r0, #1
	str	ip, [r7]
	sub	r0, ip, r0
	ldr	ip, .L4+64
	str	lr, [ip]
	ldr	ip, .L4+68
	str	lr, [ip]
	mov	lr, #5
	ldr	ip, .L4+72
	str	lr, [ip]
	mov	lr, #1
	ldr	ip, .L4+76
	str	lr, [ip]
	mov	lr, #2
	ldr	ip, .L4+80
	str	lr, [ip]
	mov	ip, #40
	ldr	r7, .L4+84
	mov	r3, #12
	str	ip, [r7]
	mov	r8, #15
	mov	ip, #50
	ldr	r9, .L4+88
	ldr	r10, .L4+92
	ldr	fp, .L4+96
	str	r3, [r2]
	str	r0, [fp]
	mov	r2, r3
	str	ip, [r9]
	str	r8, [r10]
	mov	lr, pc
	bx	r6
	ldr	r3, [r10]
	ldr	ip, .L4+100
	ldr	r1, [r9]
	ldr	r0, [r7]
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	ldr	r0, .L4+104
	ldr	r1, .L4+108
	ldr	r2, .L4+112
	ldr	r3, .L4+116
	str	r4, [r0]
	str	r5, [r1]
	str	r4, [r2]
	str	r4, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	drawRect
	.word	targetSize
	.word	bumpVx
	.word	targetRow
	.word	bumpRow
	.word	bumpCol
	.word	bumpOCol
	.word	bumpHeight
	.word	bumpStrength
	.word	bumpWidth
	.word	ballCol
	.word	ballOCol
	.word	ballRow
	.word	ballORow
	.word	ballSize
	.word	ballVx
	.word	ballVy
	.word	mineCol
	.word	mineRow
	.word	mineSize
	.word	targetCol
	.word	1023
	.word	time
	.word	timeStep
	.word	failFlag
	.word	winFlag
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForRestart.part.0, %function
checkForRestart.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initialize
.L9:
	.align	2
.L8:
	.word	buttons
	.size	checkForRestart.part.0, .-checkForRestart.part.0
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r6, #0
	sub	sp, sp, #12
	ldr	r9, .L12
	ldr	r8, .L12+4
	ldr	r7, .L12+8
	str	r6, [sp]
	ldr	r0, .L12+12
	ldr	r4, .L12+16
	ldr	r3, [r9]
	ldr	r2, [r8]
	ldr	r1, [r7]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	ip, .L12+20
	ldr	r0, .L12+24
	ldr	r5, .L12+28
	ldr	r3, [r9]
	ldr	r2, [r8]
	ldr	r1, [r7]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	str	r6, [sp]
	ldr	r1, .L12+32
	ldr	r0, .L12+36
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	mov	ip, #31
	ldr	r3, [r5]
	str	ip, [sp]
	ldr	r1, .L12+40
	ldr	r0, .L12+44
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	bumpHeight
	.word	bumpWidth
	.word	bumpRow
	.word	bumpOCol
	.word	drawRect
	.word	32767
	.word	bumpCol
	.word	ballSize
	.word	ballORow
	.word	ballOCol
	.word	ballRow
	.word	ballCol
	.size	draw, .-draw
	.align	2
	.global	drawFailScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFailScreen, %function
drawFailScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #40
	mov	r5, #31
	sub	sp, sp, #12
	ldr	r4, .L16
	mov	r1, r3
	mov	r2, #5
	mov	r0, #30
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #15
	mov	r1, #75
	mov	r0, #35
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #50
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #100
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #15
	mov	r1, #75
	mov	r0, #105
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #130
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #15
	mov	r1, #40
	mov	r0, #135
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #15
	mov	r1, #75
	mov	r0, #135
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #150
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #40
	mov	r0, #160
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #55
	mov	r0, #160
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #75
	mov	r0, #160
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #10
	mov	r2, #5
	mov	r1, #45
	mov	r0, #160
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #15
	mov	r2, #5
	mov	r1, #60
	mov	r0, #175
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #40
	mov	r0, #190
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #57
	mov	r0, #190
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #20
	mov	r1, #75
	mov	r0, #190
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #12
	mov	r2, #5
	mov	r1, #45
	mov	r0, #190
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #13
	mov	r2, #5
	mov	r1, #62
	mov	r0, #190
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	drawRect
	.size	drawFailScreen, .-drawFailScreen
	.align	2
	.global	drawWinScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWinScreen, %function
drawWinScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #40
	mov	r5, #31744
	sub	sp, sp, #12
	ldr	r4, .L20
	mov	r1, r3
	mov	r2, #5
	mov	r0, #30
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #15
	mov	r1, #75
	mov	r0, #35
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #50
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #100
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #110
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #120
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r2, #25
	mov	r1, #75
	mov	r0, #100
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #135
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #5
	mov	r1, r3
	mov	r0, #150
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #40
	mov	r2, #4
	mov	r1, r3
	mov	r0, #170
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, #50
	mov	r2, r3
	mov	r0, #150
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, #55
	mov	r2, r3
	mov	r0, #155
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, #60
	mov	r2, r3
	mov	r0, #160
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, #65
	mov	r2, r3
	mov	r0, #165
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	drawRect
	.size	drawWinScreen, .-drawWinScreen
	.align	2
	.global	checkForRestart
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForRestart, %function
checkForRestart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	checkForRestart.part.0
.L25:
	.align	2
.L24:
	.word	oldButtons
	.size	checkForRestart, .-checkForRestart
	.align	2
	.global	erase
	.syntax unified
	.arm
	.fpu softvfp
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	sub	sp, sp, #8
	str	r5, [sp]
	ldr	r3, .L28
	ldr	r2, .L28+4
	ldr	r1, .L28+8
	ldr	r0, .L28+12
	ldr	r6, .L28+16
	ldr	r4, .L28+20
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	str	r5, [sp]
	ldr	r1, .L28+24
	ldr	r0, .L28+28
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	str	r5, [sp]
	ldr	r1, .L28+32
	ldr	r0, .L28+36
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+40
	ldr	r1, .L28+44
	ldr	r3, [r3]
	ldr	r0, .L28+48
	str	r5, [sp]
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+52
	ldr	r1, .L28+56
	ldr	r3, [r3]
	ldr	r0, .L28+60
	str	r5, [sp]
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	bumpHeight
	.word	bumpWidth
	.word	bumpRow
	.word	bumpCol
	.word	ballSize
	.word	drawRect
	.word	ballRow
	.word	ballCol
	.word	ballORow
	.word	ballOCol
	.word	targetSize
	.word	targetRow
	.word	targetCol
	.word	mineSize
	.word	mineRow
	.word	mineCol
	.size	erase, .-erase
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L58
	ldrh	r2, [r2]
	ldr	r5, .L58+4
	ldr	r4, .L58+8
	tst	r2, #32
	str	r3, [r5]
	sub	sp, sp, #28
	ldr	r3, [r4]
	bne	.L31
	ldr	r1, .L58+12
	ldr	r0, .L58+16
	ldr	r1, [r1]
	str	r3, [r0]
	rsb	r1, r1, #0
	sub	r3, r3, #1
	str	r1, [r5]
	str	r3, [r4]
.L31:
	tst	r2, #16
	bne	.L32
	ldr	r2, .L58+12
	ldr	r1, .L58+16
	ldr	r2, [r2]
	str	r3, [r1]
	add	r3, r3, #1
	str	r3, [r4]
	str	r2, [r5]
.L32:
	cmp	r3, #0
	bge	.L33
	mov	r2, #0
	ldr	r1, .L58+16
	str	r3, [r1]
	mov	r3, r2
	str	r2, [r4]
	str	r2, [r5]
.L33:
	ldr	r8, .L58+20
	ldr	r2, [r8]
	add	r1, r2, r3
	cmp	r1, #240
	ble	.L34
	mov	r1, #0
	ldr	r0, .L58+16
	str	r1, [r5]
	rsb	r1, r2, #240
	str	r3, [r0]
	str	r1, [r4]
.L34:
	ldr	r1, .L58+24
	ldr	r6, .L58+28
	ldr	r7, .L58+32
	ldr	r9, [r1]
	ldr	r3, [r7]
	ldr	ip, .L58+36
	ldr	r0, .L58+40
	ldr	r10, [r6]
	ldr	r1, .L58+44
	str	r3, [r0]
	str	r2, [sp, #20]
	mov	r0, r9
	str	r3, [sp, #16]
	str	r10, [ip]
	ldr	r1, [r1]
	ldr	fp, .L58+48
	mov	lr, pc
	bx	fp
	subs	r9, r9, #0
	movne	r9, #1
	cmp	r1, #0
	movne	r9, #0
	cmp	r9, #0
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	bne	.L55
.L30:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L55:
	ldr	r9, .L58+52
	ldr	fp, .L58+56
	ldr	lr, [r9]
	ldr	ip, [fp]
	add	r0, r10, lr
	cmp	r0, #0
	add	r1, r3, ip
	movlt	r3, #0
	str	r0, [r6]
	movlt	r0, r3
	ldr	r10, .L58+60
	strlt	r3, [r6]
	ldr	r3, [r10]
	rsblt	lr, lr, #0
	add	r0, r3, r0
	strlt	lr, [r9]
	cmp	r0, #239
	ldrgt	r0, [r9]
	rsbgt	lr, r3, #240
	rsbgt	r0, r0, #0
	strgt	r0, [r9]
	strgt	lr, [r6]
	cmp	r1, #0
	movlt	lr, #0
	movlt	r0, r3
	rsblt	ip, ip, #0
	addge	r0, r1, r3
	str	r1, [r7]
	strlt	ip, [fp]
	movlt	r1, lr
	strlt	lr, [r7]
	cmp	r0, #160
	bgt	.L56
.L41:
	ldr	ip, .L58+64
	ldr	r0, .L58+68
	ldr	lr, [r4]
	ldr	r0, [r0]
	ldr	ip, [ip]
	ldr	r4, .L58+72
	stmib	sp, {r0, r2, ip}
	str	lr, [sp]
	mov	r2, r3
	ldr	r0, [r6]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L42
	ldr	r2, [r9]
	ldr	r3, [fp]
	ldr	r1, [r5]
	rsb	r3, r3, #0
	add	r2, r2, r1
	str	r2, [r9]
	str	r3, [fp]
.L42:
	ldr	r1, .L58+76
	ldr	r3, .L58+80
	ldr	r2, .L58+84
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	r1, [r3]
	ldr	r3, [r10]
	stmib	sp, {r0, r2}
	str	r2, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r7]
	ldr	r0, [r6]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L57
.L43:
	ldr	r0, .L58+88
	ldr	r1, .L58+92
	ldr	r2, .L58+96
	ldr	r3, [r10]
	ldr	r2, [r2]
	ldr	lr, [r0]
	ldr	ip, [r1]
	ldr	r0, [r6]
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	stm	sp, {ip, lr}
	mov	r2, r3
	ldr	r1, [r7]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L30
	mov	r2, #1
	ldr	r3, .L58+100
	str	r2, [r3]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	erase
.L56:
	mov	r2, #1
	ldr	r3, .L58+100
	str	r2, [r3]
	bl	erase
	ldr	r2, [r8]
	ldr	r1, [r7]
	ldr	r3, [r10]
	b	.L41
.L57:
	mov	r2, #1
	ldr	r3, .L58+104
	str	r2, [r3]
	bl	erase
	b	.L43
.L59:
	.align	2
.L58:
	.word	buttons
	.word	bumpVx
	.word	bumpCol
	.word	bumpStrength
	.word	bumpOCol
	.word	bumpWidth
	.word	time
	.word	ballCol
	.word	ballRow
	.word	ballOCol
	.word	ballORow
	.word	timeStep
	.word	__aeabi_idivmod
	.word	ballVx
	.word	ballVy
	.word	ballSize
	.word	bumpHeight
	.word	bumpRow
	.word	collision
	.word	targetRow
	.word	targetCol
	.word	targetSize
	.word	mineRow
	.word	mineCol
	.word	mineSize
	.word	failFlag
	.word	winFlag
	.size	update, .-update
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r5, .L77+4
	ldr	r4, .L77+8
	ldr	fp, .L77+12
	ldr	r6, .L77+16
	ldr	r8, .L77+20
	ldr	r9, .L77+24
	ldr	r10, .L77+28
	ldr	r7, .L77+32
.L66:
	ldrh	r3, [r4]
	strh	r3, [r5]	@ movhi
	ldr	r2, [fp]
	ldrh	r3, [r7, #48]
	cmp	r2, #0
	strh	r3, [r4]	@ movhi
	bne	.L61
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L75
.L62:
	ldr	r3, .L77+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L66
	mov	lr, pc
	bx	r10
	b	.L66
.L75:
	ldr	r3, .L77+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+44
	mov	lr, pc
	bx	r3
	ldr	r2, [fp]
	ldr	r3, [r6]
	orrs	r3, r2, r3
	beq	.L76
.L63:
	ldr	r3, [r8]
	cmp	r2, #0
	add	r3, r3, #1
	str	r3, [r8]
	beq	.L74
.L61:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #8
	movne	lr, pc
	bxne	r10
.L74:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L66
	b	.L62
.L76:
	ldr	r3, .L77+48
	mov	lr, pc
	bx	r3
	ldr	r2, [fp]
	b	.L63
.L78:
	.align	2
.L77:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	failFlag
	.word	winFlag
	.word	time
	.word	drawFailScreen
	.word	checkForRestart.part.0
	.word	67109120
	.word	drawWinScreen
	.word	update
	.word	waitForVBlank
	.word	draw
	.size	main, .-main
	.comm	winFlag,4,4
	.comm	failFlag,4,4
	.comm	timeStep,4,4
	.comm	time,4,4
	.comm	mineSize,4,4
	.comm	mineCol,4,4
	.comm	mineRow,4,4
	.comm	targetSize,4,4
	.comm	targetCol,4,4
	.comm	targetRow,4,4
	.comm	ballVy,4,4
	.comm	ballVx,4,4
	.comm	ballSize,4,4
	.comm	ballOCol,4,4
	.comm	ballORow,4,4
	.comm	ballCol,4,4
	.comm	ballRow,4,4
	.comm	bumpStrength,4,4
	.comm	bumpVx,4,4
	.comm	bumpWidth,4,4
	.comm	bumpHeight,4,4
	.comm	bumpOCol,4,4
	.comm	bumpCol,4,4
	.comm	bumpRow,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
