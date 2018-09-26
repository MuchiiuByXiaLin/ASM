;键盘上读取一个键,显示其二进制数
assume ds:data,cs:code

data segment
    
data ends

code segment
start:  
      mov ah,1;读取一个键
      int 21h
      call newline;回车换行
      mov bl,al
      mov cx,8;8位
  next:
      shl bl,1;依次析出高位
      mov dl,30h
      adc dl,0;转换得ABCII码
      
      mov ah,2
      int 21h;显示
      loop next;循环8次 
newline:
      mov dl,10;换行符
      mov ah,02
      int 21h  
      ret 
   
code ends

end start