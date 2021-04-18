@ randomNumber.s
@ This function generates a random number, modulos it with 11, adds 2 to it, and 
 @ then returns it to the calling program.

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global randomNumber
.syntax unified
.type randomNumber, %function

randomNumber:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r0, #0			@ Stores #0 into r0

	bl	rand			@ Generates random number
	mov	r1, #11			@ Moves #11 into r1
	bl	modulo			@ Calls modulo function
	add	r2, r0, #2		@ Adds #2 to number returned by modulo and moves it into r2

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
