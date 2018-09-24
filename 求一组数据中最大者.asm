;采用循环指令,时间复杂度O(N)
assume cs:code,ds:data

data segment
     db 10 dup(2)
     db 1 dup(20h) 
     db 30 dup(6)
     db 19 dup(4)
     db 40 dup(9)
data ends        

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,100;循环次数
     mov di,0;目的指针
     mov ax,0
     mov al,[di];假设第一个为最大值，暂存al中
     
  s:
    inc di
    cmp al,ds:[di]
    jnc one;大于则跳转
    mov al,ds:[di];小于
one:
    loop s;继续寻找下一个进行比较
code ends

end start