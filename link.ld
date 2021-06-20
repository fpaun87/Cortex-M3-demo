/*
 * This is a ld script. It's needed
 * for creting the various regions of
 * a process memory map
 */

OUTPUT_FORMAT(elf32-littlearm)

ENTRY(_start)  /* our classical main function */

MEMORY
{
	/* flash only stores code */
	flash (RX): ORIGIN = 0x00000000, LENGTH = 64K

	/* ram stores everything else */
	ram   (!X): ORIGIN = 0x20000000, LENGTH = 8K
}

/* Stack size is 4K and it grows downwards, like on x86 */
"STACK_START" = 0x20001000;

/* Data size is 2K */
"DATA_START" = 0x20001000;

/* BSS size is 1K */
"BSS_START" = 0x20001C00;


SECTIONS
{
	/* THE NAMES FOR THE OUTPUT SECTIONS MUST BE THE ONES
     * ACCEPTED BY THE FORMAT OF THE OUTPUT EXECUTABLE!!
	 */
	. = 0x000000B8; /* Account for the vector table */
	.text : { *(.text) } >flash
	.data "DATA_START" : { *(.data) } >ram
	.bss  "BSS_START" : { *(.bss)  } >ram
	.rodata : { *(.rodata) } >flash
}

