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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.0, %function
updateBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, [r0, #4]
	cmp	r2, #0
	mov	r5, r0
	sub	sp, sp, #20
	ldr	r0, [r0, #20]
	ble	.L2
	ldr	r3, [r5, #28]
	add	r3, r2, r3
	cmp	r3, #239
	bgt	.L2
.L3:
	ldr	r3, [r5]
	cmp	r3, #0
	ldr	r1, [r5, #16]
	ble	.L4
	ldr	ip, [r5, #24]
	add	ip, r3, ip
	cmp	ip, #120
	bgt	.L4
.L5:
	mov	r7, #0
	ldr	r4, .L17
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	ldr	r8, .L17+4
	ldr	r9, .L17+8
	add	r6, r4, #220
.L9:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L16
.L7:
	add	r4, r4, #44
	cmp	r6, r4
	bne	.L9
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	rsb	r1, r1, #0
	str	r1, [r5, #16]
	b	.L5
.L2:
	rsb	r0, r0, #0
	str	r0, [r5, #20]
	b	.L3
.L16:
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r7, [r4, #36]
	strne	r3, [r9]
	strne	r7, [r5, #36]
	b	.L7
.L18:
	.align	2
.L17:
	.word	bullets
	.word	collision
	.word	ballsRemaining
	.size	updateBall.part.0, .-updateBall.part.0
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #31
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #3
	mov	r2, #240
	mov	r1, #120
	mov	r0, #0
	ldr	r4, .L21
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	drawRect
	.size	drawBar, .-drawBar
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #118
	mov	r5, #1
	mov	r4, #5
	mov	lr, #10
	mov	r2, #130
	mov	ip, #992
	mov	r0, #20
	ldr	r3, .L25
	str	r5, [r3, #16]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #32]	@ movhi
	str	r0, [r3, #36]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.size	initPlayer, .-initPlayer
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
	ldr	r4, .L29
	sub	sp, sp, #12
	str	r3, [sp]
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L29+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #1
	mov	r6, #2
	mov	r1, #0
	mvn	r2, #1
	mvn	r5, #32768
	ldr	ip, .L35
	ldr	r3, .L35+4
	ldm	ip, {r4, lr}
	add	ip, r3, #220
.L32:
	str	r0, [r3, #24]
	str	r6, [r3, #28]
	str	r2, [r3, #20]
	strh	r5, [r3, #32]	@ movhi
	str	r1, [r3, #36]
	str	r0, [r3, #40]
	stm	r3, {r1, r2, r4, lr}
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L32
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L48
	mov	r2, r0
	ldr	r1, [r2, #36]
	cmp	r1, #0
	mov	r3, #0
	beq	.L47
.L38:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #44
	bxeq	lr
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L38
.L47:
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	r5, .L48+4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl r6
	ldr	r2, [r5, #24]
	add	ip, r0, r3, lsl #2
	add	r4, r2, r2, lsr #31
	ldr	lr, [ip, #24]
	ldr	r2, [r5]
	add	lr, lr, lr, lsr #31
	add	r2, r2, r4, asr r6
	ldr	r4, [r5, #4]
	sub	r2, r2, lr, asr r6
	str	r4, [ip, #4]
	str	r6, [ip, #36]
	str	r1, [ip, #40]
	str	r2, [r0, r3, lsl #2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L61+4
	bne	.L51
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4]
	blt	.L51
.L52:
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #36]
	beq	.L60
	ldr	r2, .L61+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L55
.L60:
	add	r3, r3, #1
.L54:
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L52
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4]
	b	.L52
.L55:
	cmp	r3, #19
	ble	.L60
	bl	fireBullet
	mov	r3, #1
	b	.L54
.L62:
	.align	2
.L61:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
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
	mov	ip, #0
	ldr	r3, .L78
	add	r0, r3, #220
.L66:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L64
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r2, #0
	ldrgt	r2, [r3, #20]
	addgt	r1, r2, r1
	strgt	r1, [r3, #4]
	strle	ip, [r3, #36]
.L64:
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L66
	ldr	r4, .L78+4
	add	r5, r4, #220
.L68:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBall.part.0
.L67:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L68
	pop	{r4, r5, r6, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #28]
	add	r3, r2, r3
	cmp	r3, #0
	movle	r3, #0
	ldrgt	r3, [r0, #20]
	addgt	r2, r3, r2
	strgt	r2, [r0, #4]
	strle	r3, [r0, #36]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L90
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L91
.L88:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L91:
	str	r3, [sp]
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L92
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L88
.L90:
	mov	r2, #0
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L92
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L88
.L93:
	.align	2
.L92:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #10
	ldr	r4, .L98
	ldr	r5, .L98+4
	ldr	r9, .L98+8
	ldr	r8, .L98+12
	ldr	r7, .L98+16
	add	r6, r4, #220
.L95:
	str	r10, [r4, #28]
	str	r10, [r4, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	ip, #31744
	mov	r1, #0
	smull	r3, lr, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #2
	rsb	lr, r3, r3, lsl #3
	rsb	r3, r3, lr, lsl #3
	sub	r3, r0, r3, lsl r2
	ldr	lr, [r9]
	ldr	r0, [r9, #4]
	str	r3, [r4]
	str	r2, [r4, #20]
	str	r2, [r4, #16]
	str	r2, [r4, #36]
	strh	ip, [r4, #32]	@ movhi
	str	r1, [r4, #40]
	str	lr, [r4, #12]
	str	r0, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L95
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	balls
	.word	rand
	.word	player
	.word	2114445439
	.word	156180629
	.size	initBalls, .-initBalls
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #118
	mov	r8, #1
	ldr	r0, .L104
	mov	r6, #130
	str	r7, [r0]
	str	r7, [r0, #8]
	mov	fp, #5
	mov	r10, #10
	mov	r9, #992
	mov	r5, r7
	mov	r7, #20
	mov	r1, r8
	mov	lr, #2
	mov	r2, #0
	mvn	r3, #1
	mvn	ip, #32768
	str	r6, [r0, #4]
	str	r6, [r0, #12]
	mov	r4, r6
	ldr	r6, .L104+4
	str	fp, [r0, #24]
	str	r10, [r0, #28]
	strh	r9, [r0, #32]	@ movhi
	str	r7, [r0, #36]
	str	r8, [r0, #16]
	add	r0, r6, #220
.L101:
	str	r1, [r6, #24]
	str	lr, [r6, #28]
	str	r4, [r6, #12]
	str	r3, [r6, #20]
	strh	ip, [r6, #32]	@ movhi
	str	r2, [r6, #36]
	str	r1, [r6, #40]
	stm	r6, {r2, r3, r5}
	add	r6, r6, #44
	cmp	r6, r0
	bne	.L101
	bl	initBalls
	mov	r2, #5
	ldr	r3, .L104+8
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	player
	.word	bullets
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.0
	.size	updateBall, .-updateBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L112
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L113
.L110:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L113:
	str	r3, [sp]
	ldr	r5, .L114
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L110
.L112:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L114
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L110
.L115:
	.align	2
.L114:
	.word	drawRect
	.size	drawBall, .-drawBall
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
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawPlayer
	mov	r3, #31
	ldr	r5, .L118
	mov	r2, #240
	mov	r1, #120
	str	r3, [sp]
	mov	r0, #0
	mov	r3, #3
	ldr	r4, .L118+4
	mov	lr, pc
	bx	r4
	mov	r0, r5
	bl	drawBullet
	add	r0, r5, #44
	bl	drawBullet
	add	r0, r5, #88
	ldr	r4, .L118+8
	bl	drawBullet
	add	r0, r5, #132
	bl	drawBullet
	add	r0, r5, #176
	bl	drawBullet
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #44
	bl	drawBall
	add	r0, r4, #88
	bl	drawBall
	add	r0, r4, #132
	bl	drawBall
	add	r0, r4, #176
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBall
.L119:
	.align	2
.L118:
	.word	bullets
	.word	drawRect
	.word	balls
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,220,4
	.comm	bullets,220,4
	.comm	player,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
