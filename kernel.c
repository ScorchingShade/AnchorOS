#include"kernel.h"

//we need to have a functionality that returns value of each 16bit pixel of the characters that we want to display on the screen with color
//to do so we must return a 16 bit value, since our terminal buffer is of 16 bit type
static UINT16 VGA_DefaultEntry(unsigned char ch_to_print)
{	//I have used a left shift to covert the white color value to some drawable character value in pixel format encoding with that character that we want to print.
	//This is why I have taken a bitwise or of it, not and
	return (UINT16)ch_to_print | (UINT16)WHITE_COLOR << 8;
}

//Time to write the main fuction that is being called in boot.s file
void KERNEL_MAIN()
{
	//We need to create a TERMINAL_BUFFER pointer pointing to the VGA address
	//but before that we need to cast it into UINT16 type
	TERMINAL_BUFFER = (UINT16*)VGA_ADDRESS;

	//as we can  access a VGA using a simple array accessing using an index
	//like we normally do in an array. e.g. int a[1]=233; 
	//We will do something like that, only instead we will initialise pixels in array
	 TERMINAL_BUFFER[0] = VGA_DefaultEntry('H');
 	 TERMINAL_BUFFER[1] = VGA_DefaultEntry('e');
 	 TERMINAL_BUFFER[2] = VGA_DefaultEntry('l');
  	 TERMINAL_BUFFER[3] = VGA_DefaultEntry('l');
 	 TERMINAL_BUFFER[4] = VGA_DefaultEntry('o');
  	 TERMINAL_BUFFER[5] = VGA_DefaultEntry(' ');
  	 TERMINAL_BUFFER[6] = VGA_DefaultEntry('W');
  	 TERMINAL_BUFFER[7] = VGA_DefaultEntry('o');
  	 TERMINAL_BUFFER[8] = VGA_DefaultEntry('r');
  	 TERMINAL_BUFFER[9] = VGA_DefaultEntry('l');
  	 TERMINAL_BUFFER[10] = VGA_DefaultEntry('d');
}
