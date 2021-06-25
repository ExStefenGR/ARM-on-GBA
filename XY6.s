.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]


	mov r7, #0x4000000 @register for Input
	mov r8, #0x130 
	add r7, r8 @Adds R8 to R7

	mov r3, #12 @ X cordinates

	mov r4, #480 @ vertical axis (one line)
	mov r5, #3 @ Y cord (follows r4)

	mov r0, #0x6000000
	mov r1, #0x520 @Green

	@Beginning of loop
 
infin:
	add r5, r5, #1
	mov r3, #0x9600 @Loop delayer
delay:
	subs r3, r3, #1

	bne delay
	
	bl sub1




	b infin

sub1: 
	stmed r13!, {r0-r6,r14}	@Provides the range of registers used as well as how to move back at the end of each subroutine
	mov r0, #0x6000000 @
	
	add r0, r0, r3, lsl #1  @Moved calculation here instead of the main function

	mul r6, r4, r5  
	add r0, r0, r6 

	

	strh r3, [r0]
	strh r1, [r0]

	ldmed r13!, {r0-r6,r14} @Goes back in the beginning of the subroutine
	mov pc, r14 @Returns to calling program
