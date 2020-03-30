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
	.global	initTiger
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTiger, %function
initTiger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #70
	mov	r0, #120
	mov	r1, #1
	mov	r2, #24
	ldr	r3, .L3
	str	ip, [r3]
	str	ip, [r3, #16]
	str	r0, [r3, #4]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L4:
	.align	2
.L3:
	.word	tiger
	.size	initTiger, .-initTiger
	.align	2
	.global	updateTiger
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTiger, %function
updateTiger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L10
	ldr	r3, .L10+4
	ldrh	r0, [r2, #48]
	ldr	r1, [r3, #4]
	ldr	r2, [r3]
	tst	r0, #32
	str	r2, [r3, #16]
	str	r1, [r3, #20]
	bne	.L6
	ldr	r0, [r3, #8]
	sub	r1, r1, r0
	cmp	r1, #0
	strgt	r1, [r3, #4]
.L6:
	ldr	r1, .L10
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L7
	ldmib	r3, {r0, r1}
	add	r0, r0, r1
	ldr	r1, [r3, #28]
	add	r1, r0, r1
	cmp	r1, #239
	strle	r0, [r3, #4]
.L7:
	ldr	r1, .L10
	ldrh	r1, [r1, #48]
	tst	r1, #64
	bne	.L8
	ldr	r1, [r3, #12]
	sub	r2, r2, r1
	cmp	r2, #0
	strgt	r2, [r3]
.L8:
	ldr	r2, .L10
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bxne	lr
	ldr	r2, [r3]
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #24]
	add	r2, r2, r0
	add	r1, r2, r1
	cmp	r1, #159
	strle	r2, [r3]
	bx	lr
.L11:
	.align	2
.L10:
	.word	67109120
	.word	tiger
	.size	updateTiger, .-updateTiger
	.align	2
	.global	drawTiger
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTiger, %function
drawTiger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L14
	ldr	ip, .L14+4
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r4, .L14+8
	ldr	r0, [r0, #4]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	tiger
	.word	tigerBitmap
	.word	drawImage4
	.size	drawTiger, .-drawTiger
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
	mov	r2, #83886080
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L22
	ldrb	r0, [r2]	@ zero_extendqisi2
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	mov	r7, #3
	bl	drawTiger
	ldr	r4, .L22+4
	ldr	r6, .L22+8
	add	r5, r4, #160
.L18:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L21
.L17:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L18
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L21:
	str	r7, [sp]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	b	.L17
.L23:
	.align	2
.L22:
	.word	fillScreen4
	.word	bunnies
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	initBunnies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBunnies, %function
initBunnies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #230
	ldr	r4, .L28
	ldr	r5, .L28+4
	ldr	r8, .L28+8
	ldr	r7, .L28+12
	add	r6, r4, #160
.L25:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, lr, r7, r0
	mov	ip, #2
	mov	r1, #10
	mov	r2, #0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #6
	mul	r3, r9, r3
	sub	r0, r0, r3
	str	ip, [r4, #12]
	str	r1, [r4, #24]
	str	r1, [r4, #28]
	str	r2, [r4, #32]
	str	r2, [r4, #36]
	stmib	r4, {r0, ip}
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L25
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	bunnies
	.word	rand
	.word	458129845
	.word	1195121335
	.size	initBunnies, .-initBunnies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #70
	mov	r1, #120
	mov	r0, #1
	push	{r4, lr}
	mov	lr, #24
	ldr	ip, .L32
	sub	sp, sp, #8
	str	r2, [ip]
	str	r2, [ip, #16]
	str	r1, [ip, #4]
	str	r1, [ip, #20]
	str	r0, [ip, #8]
	str	r0, [ip, #12]
	ldr	r1, .L32+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r4, .L32+8
	str	lr, [ip, #24]
	str	lr, [ip, #28]
	mov	lr, pc
	bx	r4
	ldrh	r2, [sp, #4]
	ldr	r3, .L32+12
	strh	r2, [r3, #254]	@ movhi
	bl	initBunnies
	mov	r2, #0
	ldr	r3, .L32+16
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	tiger
	.word	tigerPal
	.word	DMANow
	.word	83886336
	.word	bunniesEaten
	.size	initGame, .-initGame
	.align	2
	.global	updateBunny
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBunny, %function
updateBunny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #16
	bne	.L35
	ldr	r1, [r0]
	ldr	r5, [r0, #12]
	ldr	r3, [r0, #24]
	cmp	r1, #1
	rsble	r5, r5, #0
	add	r2, r1, r3
	strle	r5, [r0, #12]
	cmp	r2, #158
	rsbgt	r5, r5, #0
	strgt	r5, [r0, #12]
	ldr	r0, [r0, #4]
	ldr	lr, [r4, #8]
	ldr	r2, [r4, #28]
	cmp	r0, #1
	rsble	lr, lr, #0
	add	ip, r0, r2
	strle	lr, [r4, #8]
	cmp	ip, #238
	ldr	ip, .L46
	rsbgt	lr, lr, #0
	ldr	r6, [ip, #24]
	add	r1, r1, r5
	add	r0, r0, lr
	ldr	r5, [ip, #28]
	strgt	lr, [r4, #8]
	str	r1, [r4]
	str	r0, [r4, #4]
	str	r6, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L46+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L45
.L34:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	ldr	r3, [r0, #36]
	add	r3, r3, #1
	cmp	r3, #99
	strle	r3, [r0, #36]
	ble	.L34
	mov	r3, #0
	ldr	r5, .L46+8
	str	r3, [r0, #36]
	str	r3, [r0, #32]
	mov	lr, pc
	bx	r5
	mov	r1, #230
	ldr	r3, .L46+12
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	mul	r3, r1, r3
	sub	r0, r0, r3
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L46+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	mov	r2, #1
	mov	r3, #3
	ldr	lr, .L46+20
	ldr	ip, [lr]
	str	r2, [r4, #32]
	str	r3, [sp]
	add	ip, ip, r2
	ldr	r1, [r4]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	str	ip, [lr]
	ldr	r4, .L46+24
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	tiger
	.word	collision
	.word	rand
	.word	1195121335
	.word	458129845
	.word	bunniesEaten
	.word	drawRect4
	.size	updateBunny, .-updateBunny
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
	push	{r4, lr}
	ldr	r4, .L50
	bl	updateTiger
	mov	r0, r4
	bl	updateBunny
	add	r0, r4, #40
	bl	updateBunny
	add	r0, r4, #80
	bl	updateBunny
	add	r0, r4, #120
	pop	{r4, lr}
	b	updateBunny
.L51:
	.align	2
.L50:
	.word	bunnies
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBunny
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBunny, %function
drawBunny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxne	lr
	mov	r2, #3
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r4, .L58
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	drawRect4
	.size	drawBunny, .-drawBunny
	.comm	bunniesEaten,4,4
	.comm	bunnies,160,4
	.comm	tiger,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
