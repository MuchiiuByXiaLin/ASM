;将每个单词转换为大写
;外层循环遍历每行，每行再遍历第0-3号元素
;内循环处理每一行
;外循环处理每一列
;ASM中的循环是do-while循环
assume ds:data,cs:code,ss:stack

data segment
     db 'abc123xxxxxxxxxx'
     db 'bcn234xxxxxxxxxx'
     db 'cwe12wxxxxxxxxxx'
     db 'dwesdwxxxxxxxxxx' 
data ends

stack segment
     dw 0,0,0,0,0,0,0,0                 ;定义容量为16字节的栈
stack ends                                  

code segment
    
start:
     mov ax,data
     mov ds,ax                          ;设置数据段
     
     mov ax,stack
     mov ss,ax                          ;设置栈
     
     mov bx,0                           ;
     mov sp,16                          ;//栈顶指针指向栈底
     mov cx,4                           ;外层循环次数
    
  s0:                                   ;外层循环
     push cx                            ;先保存外层循环次数
     mov si,0                           ;si用于循环0-3号元素
     mov cx,3                           ;内层循环次数 
     
   s:                                   ;内层循环
     mov al,[bx+si]
     and al,11011111b                      
     mov [bx+si],al                     ;转大写 
     inc si                            
     loop s                             ;loop s会执行三遍,应为cx=3
     
      
     add bx,16                          ;转到下一行
     pop cx                             ;设置cx=4
     loop s0
     
     mov ax,4c00h                       
     int 21h                            ;调用BIOS中断
     
code ends  
    
end start

