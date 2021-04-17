@ randomNumber.s

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
	bl	time			@ Gets time from clock
	bl	srand			@ Sets seed for srand

	bl	rand			@ Generates random number
	udiv	r0, r0, r9		@ Divides r0 by r9 and stores it in r0
					 @ This avoids an error where the program takes
					 @ such a short time to run that the system 
					 @ clock doesn't tick over and provide multiple
					 @ random numbers. Was only receiving the same
					 @ random number for each iteration

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
