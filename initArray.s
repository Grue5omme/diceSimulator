@ initArray.s
@ This function takes as input the address of the first array index and the size
 @ of the array and then sets the initial array value at each index to 0

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global initArray
.syntax unified
.type initArray, %function

initArray:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov 	r4, #0			@ Stores #0 into r4
	mov	r6, r0			@ Stores the address in r0 into r6
	mov 	r0, #0			@ Stores #0 into r0

loop:
	cmp	r4, #11			@ Compares r4 with #11
	bge	outloop1		@ If it is equal to or greater than 11, exit loop

	mov	r5, r4, LSL #2		@ Multiplies r4 by 4 and stores it in r5
	str	r0, [r6, r5]		@ Stores #0 into the stack pointer array[r5]
	add	r4, r4, #1		@ Increments r4 by 1
	bl	loop			@ Branches back to the start of the loop

outloop1:				@ Exit for the loop

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
