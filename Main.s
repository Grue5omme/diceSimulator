@ Main.s

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.syntax unified
.type main, %function

main:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r0, #13			@ Moves the size of the array + 2 (13) into r0
	mov	r0, r0, LSL #2		@ Multiplies r0 by 4 and moves that into r0
					 @ This is the amount of memory needed
	sub	sp, sp, r0		@ Moves the stack pointer to point to the start of the array
	mov	r10, sp			@ Moves the stack pointer address into r10
	str	sp, [fp, #-8]		@ Stores the stack pointer address into the first available memory address	
	mov	r0, #11			@ Moves #11 into r0
	str	r0, [fp, #-12]		@ Stores array size into second available memory address	
	ldr	r1, [fp, #-12]		@ Loads size of array into r1


	mov 	r4, #0			@ Stores #0 into r4
	mov 	r0, #0			@ Stores #0 into r0

loop:
	cmp	r4, #11			@ Compares r4 with #11
	bge	outloop1		@ If it is equal to or greater than 11, exit loop

	mov	r5, r4, LSL #2		@ Multiplies r4 by 4 and stores it in r5
	str	r0, [sp, r5]		@ Stores #0 into the stack pointer array[r4]
	add	r4, r4, #1		@ Increments r4 by 1
	bl	loop			@ Branches back to the start of the loop

outloop1:				@ Exit for the loop

	mov	r9, #0			@ Moves #0 into r9
	bl	time			@ Gets time from clock
	bl	srand			@ Sets seed for srand

loop2:
	cmp	r9, #25			@ Compares r9 with #25
	bge	outloop2		@ If it is equal to or greater than 25, exit loop
	
	bl 	randomNumber		@ Branches to random number generator function
	ldr	r0, [fp, #-8]		@ Loads address of first array index into r0
	ldr	r1, [fp, #-12]		@ Loads array size into r1

	bl	incArray		@ Calls the function to increment the correct array index

	add	r9, r9, #1		@ Increments r9
	bl	loop2			@ Branches back to the start of the loop

outloop2:

	ldr	r0, [fp, #-8]		@ Loads address of first array index into r0
	ldr	r1, [fp, #-12]		@ Loads array size into r1
	bl	printHist		@ Calls the function to print the histogram

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack