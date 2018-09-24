assume cs:code,ds:data

data segment
     db 'DdsdKoosdw'
data ends

code segment
start:
main:
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,10;循环次数(字符串长度)
     mov bx,0
     call str
     
     mov ax,4c00h
     int 21h
     ;功能：将字符串转大写
     ;参数:cx:字符串长度
     ;参数:bx:字符串首地址
 str:
     and byte ptr [bx],11011111b
     inc bx
     loop str
     ret
code ends


end start