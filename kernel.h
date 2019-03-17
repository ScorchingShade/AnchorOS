#ifndef KERNEL_H
#define KERNEL_H

//we define a VGA address here (Video Graphics Array) Refer to VGA.png
#define VGA_ADDRESS 0xB8000

//We also need to define a default display color
#define WHITE_COLOR 15

//Define a 16 bit unsigned type
typedef unsigned short UINT16;

//Define a buffer that points to a VGA
//This shall be our VGA buffer
UINT16 *TERMINAL_BUFFER;

#endif
