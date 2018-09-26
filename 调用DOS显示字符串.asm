;子程序描述
;参数(dh)=行号(取值范围0~24),(dl)=列号(取值范围0~79),
;(cl)=颜色,ds:si指向字符串的首地址
;返回:无

assume ds:data,cs:code

data segment
   MSG  db 'Welcome to masm',0 
   len equ $--MSG  ;信息长度
data ends

code segment
start:
      mov ax,data
      mov ds,ax
      mov si,0  ;目的指针
      mov cx,len;字符串长度
      mov ah,02 ;调用输出功能 
      call show_str
      
      mov ax,4c00h
      int 21h
      ;参数dl=要显示的字符
show_str:
      mov dl,[si]
      int 21h
      inc si
      loop show_str
      ret
   
code ends

end start