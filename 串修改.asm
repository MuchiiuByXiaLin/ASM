
assume ds:data,cs:code

data segment
     db 'HU DAMING','$';将胡大明(HU DAMING)修改为胡大宁(HU DANING)
data ends
      
code segment
start:
     mov ax,data
     mov ds,ax  
     mov es,ax
     cld        ;正向递增
     mov di,0;offset name;目的指针
     mov cx,09  ;字符串长度
     mov al,'M' ;要修改的字符
     
     repne scasb;不等时且cx！=0时串循环:DI+1,CX-1  
     
     jne disp   ;不等时跳转到disp
     dec di     ;指向完找到M时di已经指向M后面的一个字符
     mov byte ptr [di],'N' ;修改M为N
disp:
     mov ax,4ch
     int 21h
    
code ends

end start

