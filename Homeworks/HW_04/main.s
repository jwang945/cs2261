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
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	junglePal
	.word	DMANow
	.word	jungleBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
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
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r5, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+24
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	state
	.word	flipPage
	.size	start, .-start
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
	ldr	r2, .L20
	ldr	r3, .L20+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	ldr	r4, .L38
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L36:
	mov	r2, #1
	ldr	r3, .L38+12
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L37:
	pop	{r4, lr}
	b	goToStart
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
	.size	pause, .-pause
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"You Win!\000"
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
	mov	r0, #3
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	ldr	r2, .L42+8
	mov	r1, #70
	mov	r0, #100
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r4, .L42+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L42+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	fillScreen4
	.word	tigerPal
	.word	.LC0
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC1:
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L58
	ldr	r4, .L58+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L58+12
	ldr	r3, .L58+16
	ldr	r0, .L58+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L58+24
	mov	r3, #3
	mov	r1, #145
	mov	r0, #101
	ldr	r2, .L58+20
	mov	lr, pc
	bx	r5
	ldr	r6, .L58+28
	ldr	r5, .L58+32
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	ldr	r3, .L58+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L58+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L55
.L45:
	ldr	r2, [r4]
	cmp	r2, #29
	bgt	.L56
	tst	r3, #2
	beq	.L44
	ldr	r3, .L58+40
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L57
.L44:
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L55:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L58+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L57:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r3, .L58+44
	str	r2, [r3]
	b	.L44
.L59:
	.align	2
.L58:
	.word	updateGame
	.word	bunniesEaten
	.word	drawGame
	.word	.LC1
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	state
	.size	game, .-game
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
	ldr	r3, .L67
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L60:
	pop	{r4, lr}
	bx	lr
.L66:
	pop	{r4, lr}
	b	goToStart
.L68:
	.align	2
.L67:
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
	mov	r2, #67108864
	ldr	r1, .L80
	push	{r4, r7, fp, lr}
	ldr	r3, .L80+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L80+8
	ldr	fp, .L80+12
	ldr	r5, .L80+16
	ldr	r10, .L80+20
	ldr	r9, .L80+24
	ldr	r8, .L80+28
	ldr	r7, .L80+32
	ldr	r4, .L80+36
.L70:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L71:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L71
.L73:
	.word	.L76
	.word	.L75
	.word	.L74
	.word	.L72
	.word	.L72
.L72:
	mov	lr, pc
	bx	r7
	b	.L70
.L74:
	mov	lr, pc
	bx	r8
	b	.L70
.L75:
	mov	lr, pc
	bx	r9
	b	.L70
.L76:
	mov	lr, pc
	bx	r10
	b	.L70
.L81:
	.align	2
.L80:
	.word	1044
	.word	goToStart
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
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L84+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	flipPage
	.word	state
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
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
