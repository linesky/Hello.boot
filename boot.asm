bits 16
org 0x7c00
boots:
jmp _start
_start:
    push ds
    mov ax,0xb800
    mov si,1
    mov ds,ax
    mov al,0x67
    mov cx,2000
    mov dx,2
    call fill
    pop ds
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
fill:
    cmp cx,0
    jz fill3
    fill2:
        ds
        mov [si],al
        add si,dx
        dec cx
        jnz fill2
fill3:
ret        
hello:
db "hello world.",13,10,0,0
spere:
times  510-(spere-boots) db 0 
signature:
dw 0xaa55

