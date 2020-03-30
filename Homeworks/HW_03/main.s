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
	mov	ip, #67108864
	mov	r1, #0
	ldr	r3, .L4
	push	{r4, lr}
	ldrh	r0, [r3, #48]
	ldr	lr, .L4+4
	ldr	r2, .L4+8
	strh	lr, [ip]	@ movhi
	strh	r0, [r2]	@ movhi
	ldr	ip, .L4+12
	ldrh	lr, [r3, #48]
	ldr	r2, .L4+16
	ldr	r0, .L4+20
	ldr	r3, .L4+24
	strh	lr, [ip]	@ movhi
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	state
	.word	32736
	.word	fillScreen
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L8
	ldr	r0, .L8+4
	ldr	r3, .L8+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	state
	.word	32736
	.word	fillScreen
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L12
	mov	r0, #0
	ldr	r3, .L12+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	fillScreen
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, lr}
	ldr	r2, .L16
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	15855
	.word	fillScreen
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L20
	mov	r0, #992
	ldr	r3, .L20+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.word	fillScreen
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L24
	mov	r0, #31
	ldr	r3, .L24+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.word	fillScreen
	.size	goToLose, .-goToLose
	.align	2
	.global	continueStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	continueStart, %function
continueStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	ldr	r2, .L36+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L35
	pop	{r4, lr}
	bx	lr
.L35:
	ldr	r3, .L36+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L36+20
	mov	r0, r4
	ldr	r3, .L36+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	state
	.word	fillScreen
	.size	continueStart, .-continueStart
	.align	2
	.global	continueGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	continueGame, %function
continueGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L52+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
.L39:
	ldr	r3, .L52+20
	ldr	r3, [r3]
	cmp	r3, #99
	bgt	.L50
.L40:
	ldr	r3, .L52+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L51
	pop	{r4, lr}
	bx	lr
.L51:
	mov	r1, #4
	ldr	r2, .L52+28
	mov	r0, #31
	ldr	r3, .L52+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L50:
	mov	r1, #3
	ldr	r2, .L52+28
	mov	r0, #992
	ldr	r3, .L52+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L40
.L49:
	mov	r1, #2
	ldr	r2, .L52+28
	ldr	r0, .L52+36
	ldr	r3, .L52+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L39
.L53:
	.align	2
.L52:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	bombsSurvived
	.word	loseFlag
	.word	state
	.word	fillScreen
	.word	15855
	.size	continueGame, .-continueGame
	.align	2
	.global	continuePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	continuePause, %function
continuePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L66
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L66+4
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L64
.L55:
	tst	r3, #4
	beq	.L54
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L65
.L54:
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r1, .L66+8
	ldr	r0, .L66+12
	ldr	r2, .L66+16
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L64:
	mov	r1, #1
	ldr	r2, .L66+8
	ldr	r3, .L66+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L55
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	32736
	.word	fillScreen
	.size	continuePause, .-continuePause
	.align	2
	.global	continueWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	continueWin, %function
continueWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r1, .L77+8
	ldr	r0, .L77+12
	ldr	r2, .L77+16
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	32736
	.word	fillScreen
	.size	continueWin, .-continueWin
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
	mov	r1, #67108864
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	r4, .L90
	ldr	r0, .L90+4
	ldrh	r3, [r4, #48]
	ldr	fp, .L90+8
	strh	r0, [r1]	@ movhi
	strh	r3, [fp]	@ movhi
	ldr	r6, .L90+12
	ldrh	r1, [r4, #48]
	ldr	r5, .L90+16
	ldr	r0, .L90+20
	ldr	r3, .L90+24
	strh	r1, [r6]	@ movhi
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	ldr	r10, .L90+28
	ldr	r9, .L90+32
	ldr	r8, .L90+36
	ldr	r7, .L90+40
.L80:
	ldr	r2, [r5]
	ldrh	r3, [fp]
.L81:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L83:
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L82
	.word	.L82
.L82:
	mov	lr, pc
	bx	r7
	b	.L80
.L84:
	mov	lr, pc
	bx	r8
	b	.L80
.L85:
	mov	lr, pc
	bx	r9
	b	.L80
.L86:
	mov	lr, pc
	bx	r10
	b	.L80
.L91:
	.align	2
.L90:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	state
	.word	32736
	.word	fillScreen
	.word	continueStart
	.word	continueGame
	.word	continuePause
	.word	continueWin
	.size	main, .-main
	.text
	.align	2
	.global	continueLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	continueLose, %function
continueLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	continueWin
	.size	continueLose, .-continueLose
	.comm	seed,4,4
	.comm	timeStep,4,4
	.comm	time,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
