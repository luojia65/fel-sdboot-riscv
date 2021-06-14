OUTPUT_ARCH(riscv)
ENTRY(start)

MEMORY
{
	ram : org = 0x00020000, len = 0x00008000	/* 32KB */
}

SECTIONS
{
	.text :
	{
		*(.text*)
	} > ram

	.rodata ALIGN(8) :
	{
		*(.rodata*)
		*(.srodata*)
	} > ram

	.data ALIGN(8) :
	{
		PROVIDE(__global_pointer$ = . + 0x800);
		*(.sdata*)
		*(.data*)
		. = ALIGN(8);
	} > ram

	.bss ALIGN(8) (NOLOAD) :
	{
		*(.bss*)
		*(.sbss*)
		. = ALIGN(8);
	} > ram

}
