;计算如下表达式的值:(X*Y+Z-1024)/75
;假设其中的X,Y和Z均为16位带符号数
;分别存放在名为XXX,YYY和ZZZ的变量单元中
;再假设计算结果的商存放在AX中,余数保存在DX中
assume cs:abc

abc segment
    str dw 'ad'
    xxx dw 1234h
    yyy dw 2345h
    zzz dw 3456h;定义xxx,yyy,zzz字变量
    
    mov ax,xxx
    imul yyy;计算x*y(16位,结果为32位。AX存放低16位,DX存放高16位)
    mov cx,ax
    mov bx,dx;积保存在BX:CX中
    
    mov ax,zzz
    cwd;扩展z为32位
    
    add ax,cx
    adc dx,bx;计算X*Y-Z(低位做减法,高位做进位减法)
    
    sub ax,1024
    sbb dx,0;做减法
    
    mov cx,75
    idiv cx;最后计算商和余数
    
    mov ax,4c00h
    int 21h
abc ends

end   
