#we need to first assemble boot.s file
as --32 boot.s -o boot.o

#compile kernel.c file
gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#linking the kernel with kernel.o and boot.o files
ld -m elf_i386 -T linker.ld kernel.o boot.o -o AnchorOS.bin -nostdlib

#check AnchorOS.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot AnchorOS.bin

#building the iso file
#because grub requires it to load the menuentry
#and when option will be selected, then load the AnchorOS.bin file
mkdir -p isodir/boot/grub
cp AnchorOS.bin isodir/boot/AnchorOS.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o AnchorOS.iso isodir

#run it in qemu
qemu-system-x86_64 -cdrom AnchorOS.iso
