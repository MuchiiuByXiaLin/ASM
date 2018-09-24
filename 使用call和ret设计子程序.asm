;子程序设计
;参数和结果传递的问题  
;编程计算data段中的第一组数据的3次方,保留在后面一组dword单元中
assume cs:code   

data segment
     dw 1,2,3,4,5,6,7,8
     dw 0,0,0,0,0,0,0,0
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov si,0
     mov di,16;变址，用于定位第二组数据
     mov cx,8
   s:
     mov bx,ds:[si]
     call cube  
     mov ds:[16+si],dx;将结果送入第二组对应的字单元上
     mov ds:[16+si+1],ax
     add si,2
     loop s
     
     mov ax,4c00h
     int 21h
     
     ;说明:计算N的3次方
     ;参数:bx=N
     ;结果:dx:ax=N^3
 cube:
     mov ax,bx
     mul bx
     mul bx
     ret;ret指令将call指令推入栈中的cs:ip取出重新设置cs:ip
        ;返回call指令处
code ends
   
end start

