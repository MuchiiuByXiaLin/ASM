;统计1出现的次数
assume ds:data,cs:code,ss:stack

data segment
     db 10 dup(10101101b)
     db 100 dup(10001111b)
     db 50 dup(00001110b)
     db 40 dup(11110110b)
     db 55 dup(10001111b)
data ends                      

stack segment
      db 16 dup(0)
stack ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov ax,stack
     mov ss,ax;设置栈
     mov sp,16;栈顶指针
     mov di,0;目的指针  
     mov bx,0;计录1的个数
     mov cx,10;外层循环
  s:push cx
    mov cx,8 ;内层循环
 s0:ror [si],1
    jnc no
    inc bx
 no:
    inc di
    loop s0
    
    pop cx
    loop s 
    
    mov ax,4c00h
    int 21h
    
     
code ends

end start