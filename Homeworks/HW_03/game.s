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
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #140
	mov	r4, #10
	mov	lr, #5
	mov	r1, #118
	mov	r2, #2
	mvn	ip, #49664
	ldr	r3, .L4
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #8]
	strh	ip, [r3, #32]	@ movhi
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L7
	ldr	r2, .L11+4
	ldr	r3, [r2, #4]
	ldr	r1, [r2, #16]
	subs	r3, r3, r1
	strpl	r3, [r2, #4]
.L7:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L8
	ldr	r3, .L11+4
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #16]
	ldr	r1, [r3, #28]
	add	r2, r2, r0
	add	r1, r2, r1
	cmp	r1, #240
	strle	r2, [r3, #4]
.L8:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L9
	ldr	r2, .L11+4
	ldr	r3, [r2]
	ldr	r1, [r2, #20]
	subs	r3, r3, r1
	strpl	r3, [r2]
.L9:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L11+4
	add	r0, r3, #20
	ldr	r2, [r3]
	ldm	r0, {r0, r1}
	add	r2, r2, r0
	add	r1, r2, r1
	cmp	r1, #160
	strle	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L15
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L15+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBombs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBombs, %function
initBombs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L21
	ldr	r5, .L21+4
	ldr	r8, .L21+8
	ldr	r7, .L21+12
	ldr	r9, .L21+16
.L18:
	mov	r10, #0
	str	r10, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r4]
	sub	r0, r0, r3, lsl #4
	stmib	r4, {r0, r2}
	mov	lr, pc
	bx	r5
	mov	r2, #10
	smull	r1, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r0, [r4, #12]
	mov	lr, pc
	bx	r5
	mov	fp, r0
	mov	lr, pc
	bx	r5
	mov	r6, r0
	mov	lr, pc
	bx	r5
	mov	r3, r0
	smull	r2, ip, r9, r0
	smull	r2, r0, r9, r6
	smull	r2, r1, r9, fp
	asr	lr, r3, #31
	add	ip, ip, r3
	rsb	ip, lr, ip, asr #7
	add	r0, r0, r6
	asr	lr, r6, #31
	rsb	r0, lr, r0, asr #7
	rsb	ip, ip, ip, lsl #8
	add	lr, r1, fp
	asr	r1, fp, #31
	rsb	r0, r0, r0, lsl #8
	sub	r3, r3, ip
	rsb	r1, r1, lr, asr #7
	sub	r2, r6, r0
	lsl	r3, r3, #10
	rsb	r0, r1, r1, lsl #8
	orr	r3, r3, r2, lsl #5
	sub	r0, fp, r0
	orr	r0, r3, r0
	ldr	r3, .L21+20
	str	r10, [r4, #28]
	strh	r0, [r4, #24]	@ movhi
	add	r4, r4, #32
	cmp	r4, r3
	bne	.L18
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	bombs
	.word	rand
	.word	-2004318071
	.word	1431655766
	.word	-2139062143
	.word	bombs+1600
	.size	initBombs, .-initBombs
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	mov	r4, #10
	mov	lr, #5
	mov	r0, #140
	mov	r1, #118
	mov	r2, #2
	mvn	ip, #49664
	ldr	r5, .L25
	str	r3, [r5]
	ldr	r5, .L25+4
	str	r3, [r5]
	ldr	r3, .L25+8
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	pop	{r4, r5, lr}
	str	r0, [r3]
	str	r0, [r3, #8]
	strh	ip, [r3, #32]	@ movhi
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	b	initBombs
.L26:
	.align	2
.L25:
	.word	loseFlag
	.word	bombsSurvived
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	updateBomb
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBomb, %function
updateBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, r0
	add	r5, r4, #16
	ldm	r5, {r5, ip}
	ldr	r0, .L40
	sub	sp, sp, #20
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	lr, [r4]
	ldr	r0, [r0, #4]
	str	r5, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	ldr	r5, .L40+4
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L40+8
	strne	r2, [r3]
	ldr	r3, [r4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #170
	str	r3, [r4]
	bgt	.L39
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L39:
	mov	r3, #0
	ldr	r2, .L40+12
	str	r3, [r4, #28]
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L40+16
	smull	r2, r3, r0, r3
	ldr	r1, .L40+20
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	add	r3, r2, #1
	str	r0, [r4, #4]
	str	r3, [r1]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	collision
	.word	loseFlag
	.word	rand
	.word	-2004318071
	.word	bombsSurvived
	.size	updateBomb, .-updateBomb
	.align	2
	.global	drawBomb
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBomb, %function
drawBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L48
.L43:
	ldr	r3, [r4]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L48:
	mov	r2, #0
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r5, .L49
	ldr	r2, [r0, #20]
	ldmib	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L43
.L50:
	.align	2
.L49:
	.word	drawRect
	.size	drawBomb, .-drawBomb
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r4, .L55
	add	r5, r4, #1600
.L52:
	mov	r0, r4
	add	r4, r4, #32
	bl	drawBomb
	cmp	r4, r5
	bne	.L52
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	bombs
	.size	drawGame, .-drawGame
	.align	2
	.global	chanceToSpawn
	.syntax unified
	.arm
	.fpu softvfp
	.type	chanceToSpawn, %function
chanceToSpawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L63
	mov	lr, pc
	bx	r3
	ands	r0, r0, #7
	bne	.L57
	ldr	r2, .L63+4
	b	.L60
.L59:
	cmp	r0, #50
	beq	.L57
.L60:
	ldr	r3, [r2, r0, lsl #5]
	cmp	r3, #0
	lsl	r3, r0, #5
	add	r0, r0, #1
	bne	.L59
	mov	r1, #1
	ldr	r2, .L63+8
	add	r3, r2, r3
	str	r1, [r3, #28]
.L57:
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	rand
	.word	bombs+28
	.word	bombs
	.size	chanceToSpawn, .-chanceToSpawn
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L69
	add	r5, r4, #1600
.L66:
	mov	r0, r4
	add	r4, r4, #32
	bl	updateBomb
	cmp	r4, r5
	bne	.L66
	pop	{r4, r5, r6, lr}
	b	chanceToSpawn
.L70:
	.align	2
.L69:
	.word	bombs
	.size	updateGame, .-updateGame
	.comm	bombsSurvived,4,4
	.comm	loseFlag,4,4
	.comm	bombs,1600,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
