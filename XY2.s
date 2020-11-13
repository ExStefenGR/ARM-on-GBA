.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]

	mov r3, #0 @ X cordinates

	mov r4, #480 @ vertical axis (one line)
	mov r5, #0 @ Y cord (follows r4)

	mov r0, #0x6000000
	mov r1, #0x520 @red colour

	@Beginning of loop

	add r0, r0, r3

	mul r6, r4, r5
	add r0, r0, r6 

	
	mov r2, #0x1 @ Amount of pixels
Pixels1:
	strh r3, [r0]
	strh r1, [r0]
	
	subs r2, r2, #1
	bne Pixels1 @end of loop 1
infin:
	b infin
