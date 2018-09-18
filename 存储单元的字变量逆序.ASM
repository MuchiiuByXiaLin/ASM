;将0-16存储单元的字变量逆序
assume ds:data,cs:code,ss:stack

data segment;数据
     dw 0123h,0456h,0789h,0abch,0bcdh,0cdeh,0defh,0987h
data ends

stack segment;栈
      dw 0,0,0,0,0,0,0,0  
stack ends

code segment;代码
start:  
     mov ax,stack
     mov ss,ax
     mov sp,20h;设置栈顶,SS:SP指向CS:30H
     
     mov ax,data
     mov ds,ax;ds指向data 
     
     mov cx,8;循环次数
     mov bx,0;ds:bx指向data段的第一个单元
     
     s:
     push cs:[bx]
     add bx,2
     loop s;入栈

     mov cx,8
     mov bx,0
    
     p:
     pop cs:[bx]
     add bx,2
     loop p ;出栈

     mov ax,4c00h
     int 21;BIOS中断

code ends

end start