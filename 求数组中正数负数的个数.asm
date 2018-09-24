;求正数和负数的个数
assume ds:data,cs:code

data segment
     db 20 dup(1)
     db 20 dup(-1)
     db 20 dup(2)
     db 20 dup(1)
     db 20 dup(0)
data ends
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,100;循环次数(字节个数)
     mov si,0;存放正数个数
     mov di,0;存放负数个数
     mov bx,0;指针
     
again:
     cmp ds:[bx],0
     jle less       ;<=0跳转
     inc si         ;正数个数加1
     jmp short next         
     
     mov ax,4c00h
     int 21h
less:
     jl next        ;小于跳转
     inc di         ;负数个数加1
next:
     inc bx
     dec cx
     jnz again      ;cx不为0时跳转
     
code segment
    
code ends

end