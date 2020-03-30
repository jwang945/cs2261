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
	.file	"hw01.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L5
.L7:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L7
.L5:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L10
	ldr	lr, .L18
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L12:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L15
.L13:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L13
.L15:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L12
.L10:
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawJ
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawJ, %function
drawJ:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	ldr	ip, [r3]
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	add	r5, ip, #9728
	add	r1, r0, r1, lsl #4
	add	r5, r5, #32
	add	lr, ip, #9600
	add	r5, r5, r1, lsl #1
	lsl	r4, r1, #1
	add	lr, lr, r1, lsl #1
.L21:
	sub	r3, lr, #9600
.L22:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L22
	add	lr, r3, #2
	cmp	lr, r5
	bne	.L21
	add	r1, ip, r1, lsl #1
	add	r1, r1, #47872
	add	lr, r0, #30
	add	r1, r1, #188
	add	r0, r0, #50
.L24:
	sub	r3, r1, #38400
.L25:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L25
	add	lr, lr, #1
	cmp	lr, r0
	add	r1, r3, #2
	bne	.L24
	add	r1, ip, #57600
	add	r0, r1, #100
	add	r0, r0, r4
	add	r1, r1, r4
.L27:
	sub	r3, r1, #9600
.L28:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L28
	add	r1, r1, #2
	cmp	r1, r0
	bne	.L27
	pop	{r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	drawJ, .-drawJ
	.align	2
	.global	drawE
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawE, %function
drawE:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, r0
	ldr	r3, .L58
	ldr	ip, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r5, ip, #9664
	add	r3, r0, r1, lsl #4
	add	r5, r5, #56
	add	r1, ip, #9600
	add	r5, r5, r3, lsl #1
	lsl	r4, r3, #1
	add	r1, r1, r3, lsl #1
.L37:
	sub	r3, r1, #9600
.L38:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L38
	add	r1, r3, #2
	cmp	r1, r5
	bne	.L37
	add	r3, ip, #33536
	add	r1, r3, #64
	add	r3, r3, #184
	add	r1, r1, r4
	add	r5, r3, r4
.L40:
	sub	r3, r1, #9600
.L41:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L41
	add	r1, r3, #2
	cmp	r1, r5
	bne	.L40
	add	r1, ip, #57600
	add	r5, r1, #120
	add	r5, r5, r4
	add	r1, r1, r4
.L43:
	sub	r3, r1, #9600
.L44:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L44
	add	r1, r3, #2
	cmp	r1, r5
	bne	.L43
	add	r1, ip, #23808
	add	r1, r1, #192
	add	r1, r1, r4
	add	r5, r0, #20
.L46:
	sub	r3, r1, #14400
.L47:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L47
	add	r0, r0, #1
	cmp	r0, r5
	add	r1, r1, #2
	bne	.L46
	add	r1, ip, #47872
	add	r1, r1, #128
	add	r1, r1, r4
.L49:
	sub	r3, r1, #14400
.L50:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L50
	add	lr, lr, #1
	cmp	lr, r5
	add	r1, r1, #2
	bne	.L49
	pop	{r4, r5, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.size	drawE, .-drawE
	.align	2
	.global	drawT
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawT, %function
drawT:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	ldr	ip, [r3]
	push	{r4, lr}
	rsb	r1, r1, r1, lsl #4
	add	lr, ip, #9664
	add	r4, r0, r1, lsl #4
	add	lr, lr, #56
	add	r1, ip, #9600
	add	lr, lr, r4, lsl #1
	add	r1, r1, r4, lsl #1
.L61:
	sub	r3, r1, #9600
.L62:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L62
	add	r1, r3, #2
	cmp	r1, lr
	bne	.L61
	add	r1, ip, r4, lsl #1
	add	r1, r1, #57600
	add	ip, r0, #20
	add	r1, r1, #40
	add	r0, r0, #40
.L64:
	sub	r3, r1, #47872
	sub	r3, r3, #128
.L65:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L65
	add	ip, ip, #1
	cmp	r0, ip
	add	r1, r1, #2
	bne	.L64
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.size	drawT, .-drawT
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r7, lr}
	mov	r7, #0
	ldr	r2, .L81
	ldr	r6, .L81+4
	strh	r2, [r3]	@ movhi
	ldr	r5, .L81+8
	ldr	r4, .L81+12
	sub	sp, sp, #16
.L76:
	mov	r2, #0
	mov	r1, #20
	mov	r0, #170
	mov	lr, pc
	bx	r6
	mov	r2, #31
	mov	r1, #20
	mov	r0, #10
	mov	lr, pc
	bx	r5
	ldr	r9, .L81+16
	str	r7, [sp, #12]
.L73:
	ldr	r3, [sp, #12]
	subs	r9, r9, #1
	add	r3, r3, #1
	str	r3, [sp, #12]
	bne	.L73
	mov	r2, r9
	mov	r1, #20
	mov	r0, #10
	mov	lr, pc
	bx	r5
	mov	r2, #992
	mov	r1, #20
	mov	r0, #100
	mov	lr, pc
	bx	r4
	ldr	r8, .L81+16
	str	r9, [sp, #8]
.L74:
	ldr	r3, [sp, #8]
	subs	r8, r8, #1
	add	r3, r3, #1
	str	r3, [sp, #8]
	bne	.L74
	mov	r2, r8
	mov	r1, #20
	mov	r0, #100
	mov	lr, pc
	bx	r4
	mov	r2, #31744
	mov	r1, #20
	mov	r0, #170
	mov	lr, pc
	bx	r6
	str	r8, [sp, #4]
	ldr	r2, .L81+16
.L75:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L75
	b	.L76
.L82:
	.align	2
.L81:
	.word	1027
	.word	drawT
	.word	drawJ
	.word	drawE
	.word	250000
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
