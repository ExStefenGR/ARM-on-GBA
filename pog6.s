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
	mov r2, #0xF @F is for a row of Pixels Horizontally
	add r2,  #0x1A
Pixels1:
	strh r1, [r0], #0x1
	subs r2, r2, #0x1
	bne Pixels1 @end of Pixels1


	mov r1, #0xFF00 @loop2 colour
	add r1, #0x2A
Pixels2:
	strh r1, [r0], #0x2
	subs r2, r2, #0x1A
		mov r1, #0xFF00 @loop2 colour
		add r1, #0x2A

infin:
	b infin
