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
	mov	r3, #67108864
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+12
	ldr	r2, .L4+16
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32736
	.word	fillScreen
	.word	state
	.word	seed
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
	push	{r4, lr}
	ldr	r3, .L8
	ldr	r0, .L8+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	32736
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Balls Remaining:\000"
	.text
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
	push	{r4, lr}
	mov	r0, #0
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+4
	ldr	r3, .L12+8
	ldr	r2, .L12+12
	mov	r1, #145
	mov	r0, #5
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC0
	.word	state
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
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Pause\000"
	.text
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
	ldr	r0, .L25
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+8
	mov	r3, #31
	ldr	r2, .L25+12
	mov	r1, #72
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC1
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
	ldr	r3, .L39
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L37:
	pop	{r4, lr}
	b	goToGame
.L38:
	ldr	r3, .L39+12
	ldr	r0, .L39+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L39+20
	ldr	r3, .L39+24
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.word	seed
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Win\000"
	.text
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
	push	{r4, lr}
	mov	r0, #992
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r4, .L43+4
	mov	r3, #31
	ldr	r2, .L43+8
	mov	r1, #72
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L43+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	fillScreen
	.word	drawString
	.word	.LC2
	.word	state
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
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L52+12
	ldr	r0, .L52+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L52+20
	ldr	r3, .L52+24
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.word	seed
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Lose\000"
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
	mov	r0, #31
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r4, .L56+4
	mov	r3, #31744
	ldr	r2, .L56+8
	mov	r1, #72
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L56+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"%d\000"
	.text
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
	push	{r4, r5, lr}
	ldr	r4, .L72
	sub	sp, sp, #12
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L72+8
	ldr	r3, .L72+12
	ldr	r0, .L72+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #8
	mov	r1, #145
	mov	r0, #107
	str	r2, [sp]
	ldr	r5, .L72+28
	mov	r2, #6
	mov	lr, pc
	bx	r5
	ldr	r3, .L72+32
	mov	r1, #145
	mov	r0, #107
	ldr	r2, .L72+16
	ldr	r5, .L72+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L72+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r2, .L72+44
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L69
.L59:
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L70
	tst	r3, #2
	beq	.L58
	ldr	r3, .L72+44
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L71
.L58:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L70:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L69:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToPause
.L71:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L73:
	.align	2
.L72:
	.word	ballsRemaining
	.word	updateGame
	.word	.LC4
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawRect
	.word	32767
	.word	drawString
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	ldr	r2, .L85
	push	{r4, r7, fp, lr}
	ldr	r0, .L85+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L85+12
	ldr	r6, .L85+16
	str	r2, [r3]
	str	r2, [r6]
	ldr	fp, .L85+20
	ldr	r5, .L85+24
	ldr	r10, .L85+28
	ldr	r9, .L85+32
	ldr	r8, .L85+36
	ldr	r7, .L85+40
	ldr	r4, .L85+44
.L75:
	ldrh	r3, [fp]
.L76:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L76
.L78:
	.word	.L81
	.word	.L80
	.word	.L79
	.word	.L77
	.word	.L77
.L77:
	mov	lr, pc
	bx	r7
.L82:
	ldr	r2, [r6]
	b	.L75
.L79:
	mov	lr, pc
	bx	r8
	b	.L82
.L80:
	mov	lr, pc
	bx	r9
	b	.L82
.L81:
	mov	lr, pc
	bx	r10
	b	.L82
.L86:
	.align	2
.L85:
	.word	1027
	.word	32736
	.word	fillScreen
	.word	seed
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
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
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
