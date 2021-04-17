@ printHist.s
@ This function prints a horizontal histogram for the empirical distribution of
 @ numbers generated.

.cpu cortex-a53
.fpu neon-fp-armv8

.data
	output1: .asciz	"\n%d: "
	output2: .asciz	"*"
	newline: .asciz "\n"

.text
.align 2
.global printHist
.syntax unified
.type printHist, %function

printHist:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r4, r0			@ Moves address in r0 into r4
	ldr	r5, [r4]		@ Moves the value in r4 into r5

	mov	r8, #2			@ Moves #2 into r8

loop1:
	cmp	r8, #13			@ Compares r8 to #13
	bge	outloop1		@ If it is greater than or equal to, exit loop
	ldr	r0, =output1		@ Stores output string into r0
	mov	r1, r8			@ Moves the value in r8 into r1
	bl	printf			@ Branches to printf

	mov	r6, #0			@ Moves #0 into r6

	loop2:
		cmp	r6, r5			@ Compares r6 with the value at the array index
		bge	outloop2		@ If it is greater than or equal to the value in the array, exit loop
		ldr	r0, =output2		@ Store output2 in r0
		bl	printf			@ Branches to printf
		add	r6, r6, #1		@ Increments r6
		bl	loop2			@ Return to the top of loop2

	outloop2:

	add	r4, r4, #4			@ Adds #4 to r4, moving the memory location up one
	ldr	r5, [r4]			@ Move the memory location pointer up one and store its value in r4
	add	r8, r8, #1			@ Increments r8
	bl	loop1				@ Return to the top of loop1

outloop1:

	ldr	r0, =newline			@ Loads a newline into r0 for ease of reading
	bl	printf

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
