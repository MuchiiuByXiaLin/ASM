;编写可以显示"overflow!"的中断处理程序:do0
;将do0送入内存0000:0200处
;将do0的入口地址0000:0200存储在中断向量表0号表项中
assume ds:data,cs:code

data segment
    
data ends

code segment
start:
     mov ax,data
     mov ds,ax
     
code ends

end start