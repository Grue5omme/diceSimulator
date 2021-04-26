@ incArray.s
@ This function takes as input the address of the array at the first index, the
 @ array size, and the number to be considered (2-12). It then matches the number being considered
 @ with the appropriate array index and increments the value stored at that index by 1.

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global incArray
.syntax unified
.type incArray, %function

incArray:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	sub	r2, r2, #2
	mov	r2, r2, LSL #2
	
	ldr	r4, [r0, r2]		@ Loads the value in array[0] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, r2]		@ Stores the value in r4 into array[0]

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
