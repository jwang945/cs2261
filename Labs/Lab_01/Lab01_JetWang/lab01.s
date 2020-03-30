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
	.file	"lab01.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
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
	ldr	r1, .L17
	str	lr, [sp, #-4]!
	strh	r1, [r2]	@ movhi
	mov	lr, #0
	mvn	r1, #32768
	ldr	r3, .L17+4
	ldr	r0, [r3]
	add	ip, r0, #4800
	add	r2, r0, #9600
	add	ip, ip, #20
	add	r2, r2, #20
.L2:
	mov	r3, ip
.L3:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L3
	add	lr, lr, #1
	add	ip, ip, #480
	cmp	lr, #10
	add	ip, ip, #2
	add	r2, r3, #2
	bne	.L2
	mov	lr, #0
	mvn	r1, #32768
	add	ip, r0, #47872
	add	r2, r0, #52736
	add	ip, ip, #228
	add	r2, r2, #164
.L4:
	mov	r3, ip
.L5:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L5
	add	lr, lr, #1
	add	ip, ip, #480
	cmp	lr, #10
	add	ip, ip, #2
	add	r2, r3, #2
	bne	.L4
	mvn	r1, #32768
	add	r0, r0, #38656
	add	r2, r0, #44
	add	r0, r0, #64
.L8:
	sub	r3, r2, #9600
.L7:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L7
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L8
.L9:
	b	.L9
.L18:
	.align	2
.L17:
	.word	1027
	.word	.LANCHOR0
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	add	r2, r3, #4800
	add	r0, r3, r1, lsl #1
	add	r2, r2, r1, lsl #1
	mov	ip, #0
	mvn	r1, #32768
.L23:
	mov	r3, r0
.L24:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L24
	add	ip, ip, #1
	add	r0, r0, #480
	cmp	ip, #10
	add	r0, r0, #2
	add	r2, r3, #2
	bne	.L23
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r2, r0, r1, lsl #4
	mvn	r1, #32768
	ldr	r3, .L34
	ldr	r3, [r3]
	add	r3, r3, #9600
	add	r2, r3, r2, lsl #1
	add	ip, r0, #10
.L30:
	sub	r3, r2, #9600
.L31:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L31
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r3, #2
	bne	.L30
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
