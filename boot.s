#### Welcome to a very basic OS by Ankush Sharma. This is a starting step for any CS engineer interested to know how the 
#### OS loads and works. To know more about the code and software, follow ankush sharma on github , https://github.com/ScorchingShade
#### and on medium, https://medium.com/@ankushsharma_70830. Connect with me on Linkedin, linkedin.com/in/ankush-sharma-a9b24a37/.
#### Read the licensing and documentation before use.

#First we will set the magic number of multiboot, see the bootloader.png for details.
.set MAGIC,		0x1BADB002		

# Next set flags to 0
.set FLAGS,		0

#set checksum
.set CHECKSUM, -(MAGIC + FLAGS)

#other fields are not needed for such a basic os

#set the multiboot section
.section .multiboot

#we need to set types for MAGIC, FLAGS etc.
.long MAGIC
.long FLAGS
.long CHECKSUM

#stacking kernel functions is next
#stack will grow from higher memory to lower
#First we have to define bottom of stack

stackBottom:

#if we need 512 stack size
.skip 512

#set stack top
stackTop:

#set sections
.section .text
.global _start
.type _start, @function

#now we create a starting point

_start:

	#get the current stack pointer from esp
	mov $stackTop, %esp

	#call the main kernel function
	call KERNEL_MAIN

	#clear the interrupts
	cli

#to get it working, it must be put in an infinte loop
hltLoop:
	hlt
	jmp hltLoop

.size _start, . - _start
	
