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
;load into 1000h:100h
    mov ax,1000h
    mov bx,100h
    mov es,ax
    mov al,0x70
    mov ch,0
    mov cl,2
    mov dh,0
    mov ah,2
    mov dl,0
;int load sectores into memory
    int 13h
    mov sp,0xffff
    mov ax,0x2000
    mov ss,ax
    mov ax,1000h
    mov es,ax
    mov ds,ax
    mov ax,1000h
    mov es,ax
    mov ds,ax
    mov ax,0x1000
    push ax
    mov ax,0x100
    push ax

;start ax bx cx dx to enter on program
    mov ax,0
    mov bx,0
    mov cx,0x8000
    mov dx,0
    mov si,0
    mov di,0
;jump to 1000h:100h
    retf
    

spere:
times  510-(spere-boots) db 0 
signature:
dw 0xaa55

