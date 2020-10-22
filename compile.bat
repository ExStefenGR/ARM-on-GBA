set path=G:\My Drive\University Work\Architecture Programming\ARM on GBA\bin;%PATH%

arm-eabi-gcc -mthumb-interwork -specs=gba.specs %1.s
arm-eabi-objcopy -O binary a.out %1.gba