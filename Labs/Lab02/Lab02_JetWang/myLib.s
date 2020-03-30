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
	.file	"myLib.c"
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
	subs	r4, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	lr, .L13
	add	r3, r1, r2
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [lr]
	add	r3, r0, r3, lsl #4
	sub	lr, r2, r2, lsl #4
	add	r4, r4, r0
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L7:
	cmp	r2, #0
	addgt	r3, r1, lr
	ble	.L10
.L8:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r2, .L19+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L16:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L16
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L22:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L22
	mov	r2, #67108864
.L23:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L23
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	r3, r1, r3
	cmp	r3, lr
	add	ip, lr, ip
	movlt	r3, #0
	movge	r3, #1
	cmp	r1, ip
	movgt	r3, #0
	cmp	r3, #0
	mov	r1, r0
	ldr	r0, [sp, #4]
	moveq	r0, r3
	beq	.L27
	ldr	r3, [sp, #12]
	add	r2, r1, r2
	add	ip, r0, r3
	cmp	r2, r0
	movlt	r0, #0
	movge	r0, #1
	cmp	r1, ip
	movgt	r0, #0
.L27:
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
