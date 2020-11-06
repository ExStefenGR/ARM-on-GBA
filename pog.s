.arm									@instructs the assembler to use ARM mode instructions
.text									@Tells the assembler that the following code is in text format
.global main							@Makes the main function which runs first also available to any code that needs to be linked to it (public)
main:
	mov r0, #0x4000000					@Assigns value 0x4000000 in r0 which is the LCD controller or the REG_DISPCNT
	mov r1, #0x400						@This assigns r1 to the address shown, later on we change the mode to 3 and enable BG 2 on the Graphics hardware
	add r1, r1, #3						@This adds 3 to r1, the reason we cannot assign 403 straight away is because odd numbers are not easily accepted by the assembler
	str r1, [r0]						@stores r1 from the pointer r0 to write to the address
	mov r0, #0x6000000					@Address to VRAM
	mov r1, #0x12						@red colour, Colours are displayed by on/off hexadecimal numbers that turn colours on and off, not to be confused with Web development whose colours are pre-assigned
	mov r2, #0x9600						@How many pixels to draw, in this case. the entire screen
loop1:									@label indicating a loop
	strh r1, [r0],						#2 @Stores r1 a 16bitvalue into r0 then adds 2 to r0 strh stands for store half, and so it stores half a pixel
	subs r2, r2, #1						@subtracts 1 from r2, the S is to set the flag in CPSR based on the result
	bne loop1							@Loop will keep going until the result of the instruction is 0
infin:									@infinite loop so that the code does not freeze
	b infin 
