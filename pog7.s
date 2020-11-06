.arm
.text
.global main
main:
	mov r0, #0x4000000
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]

	mov r0, #0x6000000
	mov r1, #0x37 @COLOUR


	@Beginning of loop
	mov r2, #0x1 @F is for a row of Pixels Horizontally
	add r2,  #5

pixeldelay:
	str r1, [r0], #2
	subs r2,r2,#20
	
	mov r0, #0x6000000
	mov r1, #0x0 @black colour
	
	mov r2, #0x1
	add r2, #0x1
	mov r1, #0x30
	add r1, #100
		bne pixeldelay

	mov r2, #0xF @F is for a row of Pixels Horizontally
	add r2,  #2
	
Pixels1:

	strh r1, [r0], #1
	subs r2, r2, #2
	bne Pixels1 @end of Pixels1




infin:
	b infin
