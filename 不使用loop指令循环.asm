;不使用loop循环
assume cs:code

data segment
     db 100 dup(1)
     
data ends
     
code segment     
    
start:
      mov ax,data
      mov ds,ax;设置数据段
      mov ax,0
      mov dx,0
      mov si,0;数据指针
      mov cx,100
  next:
      add ax,ds:[si]
      adc ax,0;加上可能的进位
      inc si    
      dec cx;计数器减一
      jne next;如果不为0，那么继续累加下一个数据
code ends

end start

