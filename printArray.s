@ printArray.s
@ This function prints a horizontal histogram for the empirical distribution of
 @ numbers generated.

.cpu cortex-a53
.fpu neon-fp-armv8

.data
	header:	 .asciz "Sum of the dice	Number of Occurrences\n"
	output1: .asciz	"     %d			  %d\n"
	newline: .asciz "\n"

.text
.align 2
.global printArray
.syntax unified
.type printArray, %function

printArray:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r4, r0			@ Moves address in r0 into r4
	ldr	r5, [r4]		@ Moves the value in r4 into r5

	mov	r8, #2			@ Moves #2 into r8
	ldr	r0, =header		@ Moves header text into r0
	bl	printf

loop1:
	cmp	r8, #13			@ Compares r8 to #13
	bge	outloop1		@ If it is greater than or equal to, exit loop
	ldr	r0, =output1		@ Stores output string into r0
	mov	r2, r5			@ Moves r5 into r2
	mov	r1, r8			@ Moves the value in r8 into r1
	bl	printf			@ Branches to printf

	add	r4, r4, #4		@ Adds #4 to r4, moving the memory location up one
	ldr	r5, [r4]		@ Move the memory location pointer up one and store its value in r4
	add	r8, r8, #1		@ Increments r8
	bl	loop1			@ Return to the top of loop1

outloop1:

	ldr	r0, =newline		@ Loads a newline into r0 for ease of reading
	bl	printf

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
