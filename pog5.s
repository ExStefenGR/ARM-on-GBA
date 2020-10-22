.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]

	mov r0, #0x6000000
	mov r1, #0x0F @red colour

	@Beginning of loop
	mov r2, #0xF0 @F is for a row of Pixels Horizontally
Pixels1:
	strh r1, [r0], #2
	subs r2, r2, #1
	bne Pixels1 @end of loop 1
infin:
	b infin
