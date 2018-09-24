;call指令调用栈中的数据，修改IP的内容，从而实现近转移;
;retf指令调用栈中的数据，修改cs和ip的内容，从而实现远转移
;CPU执行ret指令时,进行下面两步操作:
;(1) (IP)=((SS)*16+(SP))
;(2) (SP)=(SP)+2                  
;CPU执行retf指令时，进行下面4步操作
;(1) (IP)=((SS)*16+(SP))
;(2) (SP)=(SP)+2
;(3) (CS)=((SS)*16+(SP))
;(4) (SP)=(SP)+2
;CPU执行ret指令相当于进行:
;POP IP
;CPU执行retf指令相当于
;POP IP
;POP CS  

; call [100]相当于下面操作
;push cs
;push ip
;jmp dwrod ptr 内存单元地址

assume cs:code,ss:stack

stack segment
   db 16 dup (0)
stack ends
   
code segment
      ;下面的ret指令执行后，会执行第一句指令
;     mov ax,4c00h
;     int 21h;bios中断
;     
;start:
;     mov ax,stack
;     mov ss,ax;设置栈
;     mov sp,16;指向栈底
;     
;     mov ax,0
;     push ax
;     mov bx,0
;     ret    ;相当于pop ss:0的数据送入ip(为0,执行第一条语句)    
      
      ;下面的retf指令执行后cs:ip=ss:ax
      mov ax,4c00h
      int 21h
start:
      ;mov ax,stack
;      mov ss,ax
;      mov sp,16
;      mov ax,0
;      push ss
;      push ax
;      mov bx,0
;      retf      ;相当于pop ip,pop cs (cs:ip=ss:ax)
    
        mov sp,10h
        mov ax,0123h
        mov ds:[0],ax
        call word ptr ds:[0]
        ;执行后,IP=0123H,SP=0EH
    
       ;mov sp,10h
;       mov ax,0123h
;       mov ds:[0],ax
;       mov word ptr ds:[2],0
;       call dword ptr ds:[0];相当于push cs,push ip,jmp ds:[0]
       ;执行后cs=0h,ip=0123h,sp=0ch
code ends   
   
end start