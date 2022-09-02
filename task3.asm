[org 0x0100]

jmp s

s1:
    add cx,1
    push bp
    mov  bp,sp
    sub  sp, 2
    mov  ax,[bp+4]
    cmp  ax,2
    je   e
    cmp  ax,1
    je   e
    dec ax
    push ax
    call s1
    mov [bp-2], ax
    dec word [sp]
    call s1
    add sp, 2
    add ax, [bp-2]
    jmp done

e:
    mov eax, 1          
done:
    mov sp, bp
    pop bp
    ret

s:
mov cx,0
    push 10             
    call s1            
    add esp, 4          

    mov ah,0x1
    int 0x21
