;统计数值为8的数出现的次数
assume ds:data,cs:code

data segment
     db 1,8,8,8,4,34,8,9,6,10;10个字节
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,8
     mov si,0;指针
     mov bx,0;存放数值为8的数出现的次数
     call count
     
     mov ax,4ch
     int 21h
count:
     cmp ds:[si],8
     jne no   ;不等时跳转
     inc bx
  no:
     inc si
     loop count
     ret
code ends

end start