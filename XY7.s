.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]




	mov r3, #5 @ X cordinates

	mov r4, #480 @ vertical axis (one line)
	mov r5, #10 @ Y cord (follows r4)

	mov r0, #0x6000000
	mov r1, #0x520 @Green

	@Beginning of loop
 
infin:

	mov r7, #0x4000000 @register for key inputs
	add r7, r7, #0x130
	ldr r7, [r7]
	mov r8, #0x0080 @Key Down

	tst r8, r7 @Checks if r8 is the same as r7 value
	bne Down_input
	add r5, r5, #1
Down_input:
 	mov r8, #0x0040 @Key Up

	tst r8, r7 @Checks if r8 is the same as r7 value
	bne Up_input
	subs r5, r5, #1
Up_input:
 	mov r8, #0x0020 @Left Key

	tst r8, r7 @Checks if r8 is the same as r7 value
	bne leftinput
	subs r3, r3, #1
leftinput:
  	mov r8, #0x0010 @right Key

	tst r8, r7 @Checks if r8 is the same as r7 value
	bne rightinput
	add r3, r3, #1
rightinput:

mov r8, #0x9600 @Loop delayer
delay:
	subs r8, r8, #1

	bne delay
	
	bl sub1




	b infin

sub1: 
	stmed r13!, {r0-r6,r14}	@Provides the range of registers used as well as how to move back at the end of each subroutine
	mov r0, #0x6000000 @Display register
	
	add r0, r0, r3, lsl #1  @Moved calculation here instead of the main function

	mul r6, r4, r5  
	add r0, r0, r6 

	

	@strh r3, [r0]
	strh r1, [r0]

	ldmed r13!, {r0-r6,r14} @Goes back in the beginning of the subroutine
	mov pc, r14 @Returns to calling program
