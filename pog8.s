.arm @instructs the assembler to use ARM mode instructions
.text @Tells the assembler that the following code is in text format
.global main @Makes the main function which runs first also available to any code that needs to be linked to it (public)
main:
	mov r0, #0x4000000											 @Assigns value 0x4000000 in r0 which is the LCD controller or the REG_DISPCNT
	mov r1, #0x400
	add r1, r1, #3
	str r1, [r0]
	mov r0, #0x6000000
	mov r1, #0x12 @red colour
	mov r4, #0x0
	mov r2, #0x9600

loop1:
	
	strh r1, [r0]
	mov r3, #0xFF00 @Loop delayer
delay:
	subs r3, r3, #1
	bne delay
	strh r1, [r0], #2
	subs r2, r2, #1
	bne loop1
infin:
	b infin
