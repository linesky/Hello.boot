bits 16
org 0x7c00
boots:
jmp _start
nop
oem             db      'MY OEM  '
bsector         dw      200h
scluster        db      1h 
rsector         dw      1h
tfat            db      2h
rent            dw      0e0h
tsectors        dw      0b40h
media           db      0f0h 
sfat            dw      9h
strak           dw      12h
head            dw      2h
hidden          dd      0h
large           dd      0h
drive           db      0h
flag            db      0h
sig             db      29h
vol             dd      0ffffffffh
label           db      'MY LABEL    '
id              db      'FAT12   '
;--------------------------------------------------------
eess            dw      0
ees1            dw      0
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

