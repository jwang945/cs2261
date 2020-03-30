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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L4
	ldr	r3, .L4+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	ip, .L4+8
	mov	r3, #256
	str	r4, [ip]
	mov	r2, #83886080
	ldr	r4, .L4+12
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	seed
	.word	waitForVBlank
	.word	state
	.word	DMANow
	.word	startscreenPal
	.word	6160
	.word	startscreenTiles
	.word	100696064
	.word	startscreenMap
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #4096
	mov	r0, #4352
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L7
	ldr	r2, .L7+4
	ldrh	r1, [r1, #48]
	strh	r0, [r3]	@ movhi
	strh	r1, [r2]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
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
	ldr	r2, .L11
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L11+8
	ldr	r3, .L11+12
	ldr	r4, .L11+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+20
	mov	lr, pc
	bx	r4
	mov	r3, #864
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L11+28
	ldr	r1, .L11+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	seed
	.word	srand
	.word	state
	.word	waitForVBlank
	.word	DMANow
	.word	mainscreenPal
	.word	mainscreenTiles
	.word	100696064
	.word	mainscreenMap
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L20+4
	ldr	r1, .L20+8
	ldr	r3, [r2]
	ldrh	r1, [r1]
	add	r3, r3, #1
	tst	r1, #8
	str	r3, [r2]
	beq	.L13
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L29
	ldr	r4, .L29+4
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L29+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L29+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	updateGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
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
	push	{r4, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L33+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L47+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L45
.L36:
	tst	r3, #4
	beq	.L35
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L46
.L35:
	pop	{r4, lr}
	bx	lr
.L45:
	pop	{r4, lr}
	b	goToGame
.L46:
	pop	{r4, lr}
	b	goToStart
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	mov	r4, #3
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	ldr	ip, .L51+4
	ldr	r5, .L51+8
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L51+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #800
	mov	r2, #100663296
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L51+20
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	state
	.word	DMANow
	.word	winscreenPal
	.word	winscreenTiles
	.word	100696064
	.word	winscreenMap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L60
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
.L53:
	pop	{r4, lr}
	bx	lr
.L59:
	pop	{r4, lr}
	b	goToStart
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	mov	r3, #67108864
	mov	r2, #4096
	mov	r1, #4352
	push	{r4, r7, fp, lr}
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L73
	ldr	fp, .L73+4
	ldrh	r2, [r4, #48]
	strh	r1, [r3]	@ movhi
	ldr	r3, .L73+8
	strh	r2, [fp]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L73+12
	ldr	r5, .L73+16
	ldr	r10, .L73+20
	ldr	r9, .L73+24
	ldr	r8, .L73+28
	ldr	r7, .L73+32
.L63:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L64:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L64
.L66:
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L65
	.word	.L65
.L65:
	mov	lr, pc
	bx	r7
	b	.L63
.L67:
	mov	lr, pc
	bx	r8
	b	.L63
.L68:
	mov	lr, pc
	bx	r9
	b	.L63
.L69:
	mov	lr, pc
	bx	r10
	b	.L63
.L74:
	.align	2
.L73:
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	state
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	push	{r4, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	mov	lr, #4
	ldr	ip, .L77+4
	ldr	r4, .L77+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #128
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L77+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L77+20
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	waitForVBlank
	.word	state
	.word	DMANow
	.word	losescreenPal
	.word	losescreenTiles
	.word	100696064
	.word	losescreenMap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
