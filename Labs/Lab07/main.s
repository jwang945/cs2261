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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #56320
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #4352
	mov	r1, #3
	mov	r2, #0
	mov	r7, #38
	mov	r6, #88
	mov	ip, #64
	mov	r0, #1
	mov	r4, #134
	mov	lr, #172
	strh	r3, [r5]	@ movhi
	ldr	r3, .L4+44
	add	r5, r5, #256
	ldrh	r5, [r5, #48]
	str	r1, [r3, #40]
	ldr	r1, .L4+48
	strh	r5, [r1]	@ movhi
	ldr	r1, .L4+52
	str	r7, [r3]
	stm	r1, {r4, lr}
	str	r6, [r3, #4]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	ACbgPal
	.word	6384
	.word	ACbgTiles
	.word	100720640
	.word	ACbgMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	villager
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r7, .L27
	ldr	r3, .L27+4
	sub	sp, sp, #12
	mov	fp, r7
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+8
	ldr	r5, .L27+12
	ldr	r10, .L27+16
	ldr	r9, .L27+20
	ldr	r8, .L27+24
	ldr	r6, .L27+28
	b	.L17
.L25:
	mov	r1, #3
	ldr	r3, [r5]
	sub	r0, r3, #1
	str	r0, [r5]
	ldrh	r0, [r6, #48]
	tst	r0, #16
	str	r1, [r4, #28]
	bne	.L15
.L12:
	mov	r1, #2
	str	r3, [r5]
	str	r1, [r4, #28]
.L15:
	ldr	r1, [r4, #36]
	ldr	r3, [r4, #28]
	add	r2, r2, #1
	str	r2, [r4, #24]
	add	r2, r3, r1, lsl #5
.L16:
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r1, [r4]
	lsl	r2, r2, #3
	strh	r2, [r7, #4]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r1, [r7]	@ movhi
	mov	lr, pc
	bx	r10
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, fp
	mov	r0, #3
	mov	lr, pc
	bx	r9
	mov	r3, #67108864
	ldrh	r1, [r5]
	ldrh	r2, [r5, #4]
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
.L17:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	movne	r2, #4
	strne	r2, [r4, #28]
	ldr	r2, [r4, #24]
	strne	r3, [r4, #32]
	rsb	r3, r2, r2, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, r2, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #3
	add	r3, r3, r8
	cmp	r8, r3, ror #1
	bcc	.L8
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	str	r2, [sp, #4]
	ldr	r3, .L27+32
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	str	r1, [r4, #36]
.L8:
	ldrh	r3, [r6, #48]
	tst	r3, #64
	moveq	r1, #1
	ldreq	r3, [r5, #4]
	subeq	r3, r3, #1
	streq	r3, [r5, #4]
	ldrh	r3, [r6, #48]
	streq	r1, [r4, #28]
	ands	r3, r3, #128
	ldreq	r1, [r5, #4]
	streq	r3, [r4, #28]
	ldrh	r3, [r6, #48]
	addeq	r1, r1, #1
	streq	r1, [r5, #4]
	tst	r3, #32
	beq	.L25
	ldrh	r3, [r6, #48]
	tst	r3, #16
	beq	.L26
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L15
	mov	r3, #0
	ldr	r2, [r4, #32]
	str	r3, [r4, #36]
	str	r2, [r4, #28]
	b	.L16
.L26:
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L12
.L28:
	.align	2
.L27:
	.word	shadowOAM
	.word	initialize
	.word	villager
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	238609294
	.word	67109120
	.word	__aeabi_idivmod
	.size	main, .-main
	.comm	villager,44,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
