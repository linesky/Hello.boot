bits 16
org 0x7c00
boots:
jmp _start
_start:
    mov si,hello
    call puts
hltas:
    jmp hltas
puts:
    ds
    mov al,[si]
    call putc
    inc si
    cmp al,0
    jnz puts
ret
putc:
    mov ah,0x0e
    mov bl,0x7
    int 0x10
ret

hello:
db "hello world.\n",0,0
spere:
times  510-(spere-boots) db 0 
signature:
dw 0xaa55

