printf "\x1bc\x1b[43;37m"
nasm -o /tmp/boot.bin boot.asm
nasm -o /tmp/program.bin program.asm
cp -f /tmp/boot.bin ./
dd if=/tmp/program.bin of=./boot.bin seek=1 conv=notrunc
/usr/bin/qemu-system-x86_64 -boot a -fda boot.bin
