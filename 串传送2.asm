;编程,使用串传送指令，将F000H段中的最后16个字符复制到data段中
;传送的原始位置:F000:FFFF(
;传送的目的位置:data:000F
;传送的长度:16
;传送的方向:逆序传送，设置df=1
assume ds:data,cs:code

data segment
     db 16 dup(0)
data ends

code segment
start:   
      mov ax,0f000h
      mov ds,ax;设置数据段
      mov es,ax;设置附加段(也在数据段中)
      mov si,0ffffh;源指针指向最后16个字符的最后一个
      mov di,15;目的指向指向data段中的最后一个字符
      mov cx,16;复制次数
      std      ;df=1，递减di,si
      rep movsb
      
      mov ax,4ch
      int 21h 
code ends

end start