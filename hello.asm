global main
extern puts
extern exit
        
main:
    mov eax,hello
    push eax
    call puts
    add esp,4
    mov eax,0
    push eax
    call exit
    add esp,4
    ret
section .data
hello: db 27,'[43;37mhello world.',10,0
db 0
stdoutss: dd 1
stdinss: dd 2
readsss: dd 0
writesss: dd 1
readwritesss: dd 2
enters: db 10
clearsss: db 27,"c",0
