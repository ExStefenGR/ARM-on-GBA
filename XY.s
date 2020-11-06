.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]

	mov r3, #0x0 @Y


	mov r0, #0x6000000
	mov r1, #0x0F @red colour also X

	@Beginning of loop
	mov r2, #0x1 @F is for a row of Pixels Horizontally
Pixels1:
	strh r3, [r0], #480
	strh r1, [r0], #1
	
	subs r2, r2, #1
	bne Pixels1 @end of loop 1
infin:
	b infin
