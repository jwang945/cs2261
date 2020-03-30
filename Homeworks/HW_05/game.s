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
	.file	"game.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #0
	mov	r0, #1
	mov	r2, lr
	mov	r1, #16
	ldr	r3, .L8
	ldr	r4, .L8+4
	add	ip, r3, #5376
	str	lr, [r4]
	add	ip, ip, #24
.L2:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r3, ip
	bne	.L2
	mov	r4, #0
	ldr	r6, .L8+8
	ldr	r3, .L8+12
	add	r0, r6, #16
	ldm	r0, {r0, r1}
	add	r2, r3, #2400
.L3:
	str	r4, [r3, #20]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L3
	mvn	lr, #0
	mov	r7, #16
	ldr	ip, .L8+16
	ldr	r8, .L8+20
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	ldr	r5, .L8+32
	str	lr, [ip]
	mov	lr, pc
	bx	r8
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r8
	ldr	r10, .L8+44
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	str	r7, [r5, #8]
	str	r7, [r5, #12]
	mov	lr, pc
	bx	r10
	ldr	r1, [r5, #12]
	ldr	r9, .L8+52
	rsb	r1, r1, #160
	mov	lr, pc
	bx	r9
	str	r1, [r5]
	mov	lr, pc
	bx	r10
	ldr	r1, [r5, #8]
	rsb	r1, r1, #240
	mov	lr, pc
	bx	r9
	mov	ip, #72
	mov	r2, #80
	mov	r3, #1
	mov	lr, #20
	mov	r0, #120
	mov	r9, #4
	str	r7, [r6, #16]
	str	r7, [r6, #20]
	ldr	r7, .L8+56
	str	r1, [r5, #4]
	orr	r1, r1, #16384
	strh	r1, [r7, #2]	@ movhi
	strh	ip, [r7, #4]	@ movhi
	ldr	r1, [r5]
	ldr	ip, .L8+60
	strh	r1, [r7]	@ movhi
	strh	ip, [r7, #10]	@ movhi
	strh	r2, [r7, #8]	@ movhi
	strh	r4, [r7, #12]	@ movhi
	ldr	r1, .L8+64
	str	lr, [r5, #24]
	str	r3, [r5, #20]
	str	r3, [r5, #28]
	str	r3, [r6, #8]
	str	r3, [r6, #12]
	str	r3, [r6, #24]
	str	r2, [r6]
	str	r0, [r6, #4]
	str	r4, [r6, #28]
	str	r9, [r5, #16]
	mov	lr, pc
	bx	r1
	mov	r1, r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	snakeBodies
	.word	currEnd
	.word	snakeHead
	.word	pivots
	.word	currNumPivots
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	apple
	.word	100728832
	.word	spritesheetTiles
	.word	rand
	.word	hideSprites
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	16504
	.word	waitForVBlank
	.size	initGame, .-initGame
	.align	2
	.global	spawnApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnApple, %function
spawnApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L26
	ldr	r10, .L26+4
	ldr	fp, .L26+8
	sub	sp, sp, #20
.L11:
	ldr	r4, .L26+12
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #12]
	ldr	r5, .L26+16
	rsb	r1, r1, #160
	mov	lr, pc
	bx	r5
	mov	r8, r1
	mov	lr, pc
	bx	r4
	ldr	r4, [r6, #8]
	rsb	r1, r4, #240
	mov	lr, pc
	bx	r5
	ldr	r3, [r6, #12]
	str	r1, [sp]
	str	r8, [sp, #4]
	str	r4, [sp, #8]
	str	r3, [sp, #12]
	add	r2, r10, #16
	mov	r9, r1
	ldm	r2, {r2, r3}
	ldr	r1, [r10]
	ldr	r0, [r10, #4]
	ldr	ip, .L26+20
	mov	lr, pc
	bx	ip
	subs	r5, r0, #0
	bne	.L11
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L12
	mov	r7, r5
	ldr	r4, .L26+24
.L14:
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r2, [sp, #12]
	str	r8, [sp, #4]
	str	r9, [sp]
	str	r3, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	ip, .L26+20
	mov	lr, pc
	bx	ip
	ldr	r3, [fp]
	cmp	r0, #0
	add	r7, r7, #1
	movne	r5, #1
	cmp	r3, r7
	add	r4, r4, #36
	bgt	.L14
	cmp	r5, #0
	bne	.L11
.L12:
	ldr	r3, .L26+28
	orr	r2, r9, #16384
	stm	r6, {r8, r9}
	strh	r2, [r3, #2]	@ movhi
	strh	r8, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	apple
	.word	snakeHead
	.word	currEnd
	.word	rand
	.word	__aeabi_idivmod
	.word	collision
	.word	snakeBodies
	.word	shadowOAM
	.size	spawnApple, .-spawnApple
	.align	2
	.global	initSnakeBodies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSnakeBodies, %function
initSnakeBodies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r0, #1
	mov	r1, #16
	ldr	r3, .L32
	add	ip, r3, #5376
	add	ip, ip, #24
.L29:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r3, ip
	bne	.L29
	bx	lr
.L33:
	.align	2
.L32:
	.word	snakeBodies
	.size	initSnakeBodies, .-initSnakeBodies
	.align	2
	.global	addNewBody
	.syntax unified
	.arm
	.fpu softvfp
	.type	addNewBody, %function
addNewBody:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	mov	ip, #1
	ldr	r4, .L50
	ldr	r3, [r4]
	ldr	r2, .L50+4
	sub	lr, r3, #1
	add	r0, lr, lr, lsl #3
	add	r1, r3, r3, lsl #3
	add	r1, r2, r1, lsl #2
	add	r0, r2, r0, lsl #2
	cmp	r3, r5
	str	ip, [r1, #32]
	str	ip, [r1, #28]
	str	r5, [r0, #32]
	lsl	ip, r3, #3
	bne	.L35
	ldr	r0, .L50+8
	ldr	r1, [r0, #24]
	str	r1, [r2, #24]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L36
.L38:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L37
.L35:
	ldr	r0, [r0, #24]
	lsl	r5, lr, #3
	str	r0, [r1, #24]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L43
.L45:
	.word	.L48
	.word	.L47
	.word	.L46
	.word	.L44
.L44:
	add	lr, r5, lr
	add	r0, r2, lr, lsl #2
	ldr	r6, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r5, [r2, lr, lsl #2]
	add	r0, ip, r3
	add	r1, r6, r1
	add	lr, r2, r0, lsl #2
	str	r5, [r2, r0, lsl #2]
	str	r1, [lr, #4]
.L42:
	mov	lr, #64
	add	ip, ip, r3
	ldr	r0, .L50+12
	ldr	r5, [r2, ip, lsl #2]
	add	r2, r3, #2
	add	r3, r3, #1
	str	r3, [r4]
	orr	r1, r1, #16384
	add	r3, r0, r2, lsl #3
	lsl	ip, r2, #3
	strh	r5, [r0, ip]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	ldr	lr, [r0]
	ldr	r5, [r0, #20]
	ldr	r1, [r0, #4]
	add	r0, lr, r5
	stm	r2, {r0, r1}
	b	.L42
.L40:
	ldr	lr, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r0, [r0]
	sub	r1, lr, r1
	stm	r2, {r0, r1}
	b	.L42
.L39:
	ldr	lr, [r0]
	ldr	r5, [r0, #20]
	ldr	r1, [r0, #4]
	sub	r0, lr, r5
	stm	r2, {r0, r1}
	b	.L42
.L37:
	ldr	lr, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r0, [r0]
	add	r1, lr, r1
	stm	r2, {r0, r1}
	b	.L42
.L48:
	add	lr, r5, lr
	add	r1, r2, lr, lsl #2
	ldr	r0, [r2, lr, lsl #2]
	ldr	r5, [r1, #20]
	add	lr, ip, r3
	ldr	r1, [r1, #4]
	add	r0, r0, r5
	add	r5, r2, lr, lsl #2
	str	r0, [r2, lr, lsl #2]
	str	r1, [r5, #4]
	b	.L42
.L47:
	add	lr, r5, lr
	add	r0, r2, lr, lsl #2
	ldr	r6, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r5, [r2, lr, lsl #2]
	add	r0, ip, r3
	sub	r1, r6, r1
	add	lr, r2, r0, lsl #2
	str	r5, [r2, r0, lsl #2]
	str	r1, [lr, #4]
	b	.L42
.L46:
	add	lr, r5, lr
	add	r1, r2, lr, lsl #2
	ldr	r0, [r2, lr, lsl #2]
	ldr	r5, [r1, #20]
	add	lr, ip, r3
	ldr	r1, [r1, #4]
	sub	r0, r0, r5
	add	r5, r2, lr, lsl #2
	str	r0, [r2, lr, lsl #2]
	str	r1, [r5, #4]
	b	.L42
.L36:
	ldr	r1, [r2, #4]
	b	.L42
.L43:
	add	r1, ip, r3
	add	r1, r2, r1, lsl #2
	ldr	r1, [r1, #4]
	b	.L42
.L51:
	.align	2
.L50:
	.word	currEnd
	.word	snakeBodies
	.word	snakeHead
	.word	shadowOAM
	.size	addNewBody, .-addNewBody
	.align	2
	.global	addPivot
	.syntax unified
	.arm
	.fpu softvfp
	.type	addPivot, %function
addPivot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	lr, .L61
	mov	r3, #0
	mov	r2, lr
	b	.L55
.L53:
	add	r3, r3, #1
	cmp	r3, #100
	add	r2, r2, #24
	beq	.L52
.L55:
	ldr	ip, [r2, #20]
	cmp	ip, #0
	bne	.L53
	ldr	r2, .L61+4
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L52
	mov	r5, #1
	mov	r4, #64
	ldr	ip, .L61+8
	ldr	r2, [ip]
	ldr	r6, .L61+12
	add	r2, r2, r5
	str	r2, [ip]
	ldr	r6, [r6, #24]
	add	r2, r3, r3, lsl r5
	ldr	ip, .L61+16
	rsb	r3, r3, #127
	str	r0, [lr, r2, lsl #3]
	add	r2, lr, r2, lsl #3
	stmib	r2, {r1, r6}
	str	r5, [r2, #20]
	orr	r1, r1, #16384
	add	r2, ip, r3, lsl #3
	lsl	r3, r3, #3
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r4, [r2, #4]	@ movhi
.L52:
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	pivots
	.word	currEnd
	.word	currNumPivots
	.word	snakeHead
	.word	shadowOAM
	.size	addPivot, .-addPivot
	.align	2
	.global	checkPivots
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPivots, %function
checkPivots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r8, .L79
	ldr	r3, .L79+4
	mov	r7, r5
	mov	r6, #512
	ldr	r4, [r8]
	ldr	r2, .L79+8
	add	ip, r3, #2400
	b	.L65
.L64:
	add	r3, r3, #24
	cmp	r3, ip
	sub	r2, r2, #8
	beq	.L78
.L65:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L64
	ldr	lr, [r0, #4]
	ldr	r1, [r3, #4]
	cmp	lr, r1
	bne	.L64
	ldr	lr, [r0]
	ldr	r1, [r3]
	cmp	lr, r1
	bne	.L64
	ldr	lr, [r0, #32]
	ldr	r1, [r3, #8]
	cmp	lr, #0
	str	r1, [r0, #24]
	add	r3, r3, #24
	strhne	r6, [r2]	@ movhi
	strne	r7, [r3, #-4]
	movne	r5, #1
	subne	r4, r4, #1
	cmp	r3, ip
	sub	r2, r2, #8
	bne	.L65
.L78:
	cmp	r5, #0
	strne	r4, [r8]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	currNumPivots
	.word	pivots
	.word	shadowOAM+1016
	.size	checkPivots, .-checkPivots
	.align	2
	.global	updateSnakeBodies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSnakeBodies, %function
updateSnakeBodies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #64
	ldr	r0, .L95
	ldr	r4, .L95+4
	add	r5, r0, #5376
	add	r5, r5, #24
.L89:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L82
	ldr	r3, [r0, #24]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L83
.L85:
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L84
.L84:
	ldmib	r0, {r2, r3}
	sub	r3, r2, r3
	str	r3, [r0, #4]
.L83:
	bl	checkPivots
	ldm	r0, {r2, r3}
	orr	r3, r3, #16384
	strh	r6, [r4, #20]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	strh	r2, [r4, #16]	@ movhi
.L82:
	add	r0, r0, #36
	cmp	r0, r5
	add	r4, r4, #8
	bne	.L89
	pop	{r4, r5, r6, lr}
	bx	lr
.L86:
	ldr	r3, [r0]
	ldr	r2, [r0, #12]
	add	r3, r3, r2
	str	r3, [r0]
	b	.L83
.L87:
	ldmib	r0, {r2, r3}
	add	r3, r2, r3
	str	r3, [r0, #4]
	b	.L83
.L88:
	ldr	r3, [r0]
	ldr	r2, [r0, #12]
	sub	r3, r3, r2
	str	r3, [r0]
	b	.L83
.L96:
	.align	2
.L95:
	.word	snakeBodies
	.word	shadowOAM
	.size	updateSnakeBodies, .-updateSnakeBodies
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L167
	ldrh	r2, [r4]
	ldr	r5, .L167+4
	tst	r2, #64
	ldr	r3, [r5, #24]
	ldm	r5, {r0, r1}
	sub	sp, sp, #28
	beq	.L98
	ldr	ip, .L167+8
	ldrh	ip, [ip]
	ands	ip, ip, #64
	beq	.L161
.L98:
	tst	r2, #128
	beq	.L99
	ldr	ip, .L167+8
	ldrh	ip, [ip]
	tst	ip, #128
	beq	.L162
.L99:
	tst	r2, #32
	beq	.L100
	ldr	ip, .L167+8
	ldrh	ip, [ip]
	tst	ip, #32
	bne	.L100
	cmp	r3, #1
	bne	.L163
	tst	r2, #16
	beq	.L107
	tst	ip, #16
	bne	.L107
.L120:
	mov	r3, #1
	str	r3, [r5, #24]
	bl	addPivot
	ldr	r3, [r5, #24]
	ldm	r5, {r0, r1}
.L102:
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L104
.L105:
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L103
.L163:
	mov	r3, #3
	str	r3, [r5, #24]
	bl	addPivot
	ldrh	r2, [r4]
	ldr	r3, [r5, #24]
	ldm	r5, {r0, r1}
.L100:
	tst	r2, #16
	beq	.L102
	ldr	r2, .L167+8
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L102
	cmp	r3, #3
	bne	.L120
.L103:
	mov	r3, #3
	ldr	r2, [r5, #8]
	sub	r1, r1, r2
	str	r1, [r5, #4]
.L104:
	ldr	r2, .L167+12
	orr	r1, r1, #16384
	lsl	r3, r3, #1
	strh	r1, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	bl	updateSnakeBodies
	ldr	r2, [r5, #4]
	cmp	r2, #0
	blt	.L109
	ldr	r3, [r5, #16]
	rsb	r3, r3, #239
	cmp	r2, r3
	ble	.L164
.L109:
	ldr	r3, .L167+16
	ldr	fp, .L167+20
	mov	lr, pc
	bx	r3
	ldr	r10, .L167+24
	mov	lr, pc
	bx	fp
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L167+12
	mov	lr, pc
	bx	r10
	ldr	r3, .L167+28
	mov	lr, pc
	bx	r3
.L110:
	ldr	r1, [r5]
	cmp	r1, #0
	blt	.L111
	ldr	r3, [r5, #20]
	rsb	r2, r3, #159
	cmp	r1, r2
	bgt	.L111
.L112:
	ldr	r7, .L167+32
	ldm	r7, {r0, r2, ip, lr}
	ldr	r9, .L167+36
	stmib	sp, {r0, ip, lr}
	str	r2, [sp]
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #16]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L165
.L113:
	ldr	r8, .L167+40
	ldr	r3, [r8]
	cmp	r3, #1
	ble	.L114
	mov	r6, #1
	ldr	r4, .L167+44
	b	.L116
.L115:
	ldr	r3, [r8]
	cmp	r3, r6
	add	r4, r4, #36
	ble	.L114
.L116:
	add	r2, r4, #36
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #56]
	ldr	r1, [r4, #52]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #16]
	mov	r3, #1
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L115
	ldr	r3, .L167+16
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	fp
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L167+12
	mov	lr, pc
	bx	r10
	ldr	r3, .L167+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	cmp	r3, r6
	add	r4, r4, #36
	bgt	.L116
.L114:
	ldr	r0, [r7, #20]
	add	r0, r0, #1
	str	r3, [sp, #20]
	ldr	r2, .L167+48
	ldr	r1, [r7, #24]
	str	r0, [r7, #20]
	mov	lr, pc
	bx	r2
	cmp	r1, #0
	ldr	r3, [sp, #20]
	bne	.L117
	mov	r0, #1
	ldr	r2, [r7, #16]
	cmp	r2, #1
	cmpne	r2, #4
	add	r1, r2, #32
	ldr	ip, .L167+12
	lsl	r1, r1, r0
	strh	r1, [ip, #4]	@ movhi
	ldr	r1, [r7, #28]
	rsbeq	r1, r1, #0
	add	r2, r2, r1
	str	r0, [r7, #20]
	streq	r1, [r7, #28]
	str	r2, [r7, #16]
.L117:
	cmp	r3, #10
	beq	.L166
.L119:
	mov	lr, pc
	bx	fp
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L167+12
	mov	lr, pc
	bx	r10
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L111:
	ldr	r3, .L167+16
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	fp
	ldr	r1, .L167+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r10
	ldr	r3, .L167+28
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r3, [r5, #20]
	b	.L112
.L164:
	ldr	fp, .L167+20
	ldr	r10, .L167+24
	b	.L110
.L162:
	cmp	r3, #0
	beq	.L99
	mov	r3, #2
	str	r3, [r5, #24]
	bl	addPivot
	ldrh	r2, [r4]
	ldr	r3, [r5, #24]
	ldm	r5, {r0, r1}
	b	.L99
.L161:
	cmp	r3, #2
	beq	.L98
	str	ip, [r5, #24]
	bl	addPivot
	ldrh	r2, [r4]
	ldr	r3, [r5, #24]
	ldm	r5, {r0, r1}
	b	.L98
.L106:
	ldr	r2, [r5, #12]
	add	r0, r0, r2
	str	r0, [r5]
	b	.L104
.L108:
	ldr	r2, [r5, #12]
	sub	r0, r0, r2
	str	r0, [r5]
	b	.L104
.L107:
	ldr	r3, [r5, #8]
	add	r1, r1, r3
	str	r1, [r5, #4]
	mov	r3, #1
	b	.L104
.L165:
	bl	spawnApple
	bl	addNewBody
	b	.L113
.L166:
	ldr	r3, .L167+16
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	fp
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L167+12
	mov	lr, pc
	bx	r10
	ldr	r3, .L167+52
	mov	lr, pc
	bx	r3
	b	.L119
.L168:
	.align	2
.L167:
	.word	oldButtons
	.word	snakeHead
	.word	buttons
	.word	shadowOAM
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	goToLose
	.word	apple
	.word	collision
	.word	currEnd
	.word	snakeBodies
	.word	__aeabi_idivmod
	.word	goToWin
	.size	updateGame, .-updateGame
	.comm	currNumPivots,4,4
	.comm	currEnd,4,4
	.comm	apple,32,4
	.comm	pivots,2400,4
	.comm	snakeBodies,5400,4
	.comm	snakeHead,32,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
