@ incArray.s
@ This function takes as input the address of the array at the first index, the
 @ array size, and the number to be considered (2-12). It then matches the number being considered
 @ with the appropriate array index and increments the value stored at that index.

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

	cmp	r2, #2			@ Compares random number to #2
	bne	outloop2		@ If they're not equal, jumps to outloop2
	
	ldr	r4, [r0]		@ Loads the value in array[0] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0]		@ Stores the value in r4 into array[0]

outloop2:

	cmp	r2, #3			@ Compares random number to #3
	bne	outloop3		@ If they're not equal, jumps to outloop3
	
	ldr	r4, [r0, #4]		@ Loads the value in array[1] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #4]		@ Stores the value in r4 into array[1]

outloop3:

	cmp	r2, #4			@ Compares random number to #4
	bne	outloop4		@ If they're not equal, jumps to outloop4
	
	ldr	r4, [r0, #8]		@ Loads the value in array[2] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #8]		@ Stores the value in r4 into array[2]

outloop4:


	cmp	r2, #5			@ Compares random number to #5
	bne	outloop5		@ If they're not equal, jumps to outloop5
	
	ldr	r4, [r0, #12]		@ Loads the value in array[3] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #12]		@ Stores the value in r4 into array[3]

outloop5:


	cmp	r2, #6			@ Compares random number to #6
	bne	outloop6		@ If they're not equal, jumps to outloop6
	
	ldr	r4, [r0, #16]		@ Loads the value in array[4] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #16]		@ Stores the value in r4 into array[4]

outloop6:


	cmp	r2, #7			@ Compares random number to #7
	bne	outloop7		@ If they're not equal, jumps to outloop7
	
	ldr	r4, [r0, #20]		@ Loads the value in array[5] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #20]		@ Stores the value in r4 into array[5]

outloop7:

	cmp	r2, #8			@ Compares random number to #8
	bne	outloop8		@ If they're not equal, jumps to outloop8
	
	ldr	r4, [r0, #24]		@ Loads the value in array[6] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #24]		@ Stores the value in r4 into array[6]

outloop8:


	cmp	r2, #9			@ Compares random number to #9
	bne	outloop9		@ If they're not equal, jumps to outloop9
	
	ldr	r4, [r0, #28]		@ Loads the value in array[7] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #28]		@ Stores the value in r4 into array[7]

outloop9:

	cmp	r2, #10			@ Compares random number to #10
	bne	outloop10		@ If they're not equal, jumps to outloop10
	
	ldr	r4, [r0, #32]		@ Loads the value in array[8] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #32]		@ Stores the value in r4 into array[8]

outloop10:

	cmp	r2, #11			@ Compares random number to #11
	bne	outloop11		@ If they're not equal, jumps to outloop11
	
	ldr	r4, [r0, #36]		@ Loads the value in array[9] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #36]		@ Stores the value in r4 into array[9]

outloop11:

	cmp	r2, #12			@ Compares random number to #12
	bne	outloop12		@ If they're not equal, jumps to outloop12
	
	ldr	r4, [r0, #40]		@ Loads the value in array[10] into r4
	add	r4, r4, #1		@ Increments the value of r4 by 1
	str	r4, [r0, #40]		@ Stores the value in r4 into array[10]

outloop12:

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
