;读取缓冲区16进制数，输出对应的二进制数到屏幕
assume ds:data,cs:code

data segment
   binval  dw 0B39h
data ends

code segment
start:
     mov ax,data          
     mov ds,ax;设置数据段 
     
     mov bx,binval
     mov cx,16
  lp1:
     rol bx,1
     mov dl,0
     adc dl,30h
     mov ah,02h
     int 21h
     loop lp1
 over:
     mov ah,4ch
     int 21h
code ends

end start