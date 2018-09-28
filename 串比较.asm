;字符串操作指令中，有变址寄存器SI指向源操作数(串),由变址寄存器DI指向目的操作
;数(串)。规定源串存放在当前数据段中，目的串存放在当前附加段中
;串操作指令执行时会自动调整作为指针使用的寄存器SI或DI之值
;字符串操作的方向(处理字符串中单元的次序)由标志寄存器中的方向标志DF控制
;当方向标志DF复位时(为0)时，按递增方式调整寄存器SI或DI值
;当方向标志DF置位时(为1)时，按递减方式调整寄存器SI或DI值
assume ds:data,cs:code
       
data segment
     str1 db '123hh'
     str2 db '312hh'
data ends

code segment

start: 
    ;比较str1和str2,相同时将dx设置为1111h,不同时dx设置为ffffh
     mov ax,data
     mov ds,ax;设置数据段
     
     cld      ;正向递增DI,SI
     mov si,offset str1;源串
     mov di,offset str2;目的串
     mov cx,5 ;字符长度为5，循环5次
     repe cmpsb;比较字符指令，根据cx循环，影响标志位ZF
     je over;相等时跳转 
     mov dx,0ffffh;错误时设置错误信息
     jmp disp                            
     
  over:
     mov dx,1111h
  disp:
     mov ax,4c00h
     int 21h
     
code ends

end start

