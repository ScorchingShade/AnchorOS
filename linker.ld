/* first we need to set the entry point of our bootloader main function */

ENTRY(_start)

SECTIONS
{
	/*We need minimum 1MB of Size*/
	.text BLOCK(4K)	: ALIGN(4K)
	{
		*(.rodata)
	}

	/* data section */

	.data BLOCK(4K)	: ALIGN(4K)
	{
		*(.data)
	}

	/* bss section */
	.bss BLOCK(4K)	: ALIGN(4K)
	{
		*(.COMMON)
		*(.bss)
	}

}
