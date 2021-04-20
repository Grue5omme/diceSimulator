@ rollDie.s
@ This function generates a random number, modulos it with 6, adds 1 to it, thus
 @ generating a random number between 1 and 6, and then returns it to the calling function.

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global rollDie
.syntax unified
.type rollDie, %function

rollDie:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r0, #0			@ Stores #0 into r0

	bl	rand			@ Generates random number
	mov	r1, #6			@ Moves #6 into r1
	bl	modulo			@ Calls modulo function
	add	r0, r0, #1		@ Adds #1 to number returned by modulo and moves it into r0

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
