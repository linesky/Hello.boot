printf "\x1bc\x1b[43;37m give me the .c file name of kernel ? "
read a1
nasm -o /tmp/boot.bin boot.asm
bcc -c -Md libdos.c -o libdos.a
bcc -x -i -L -Md "$a1" -o hello.com
cp -f /tmp/boot.bin ./
dd if=./hello.com of=./boot.bin seek=1 conv=notrunc
/usr/bin/qemu-system-x86_64 -boot a -fda boot.bin
