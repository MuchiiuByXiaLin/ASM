;offset:取标号偏移地址
;如 mov ax,offset start 
;start偏移地址为0顾上述指令等价于 mov ax,0
;同理 mov ax,offset s 等价于mov ax,3 

;段内转移:jmm ax,将ip跳转至ip=ax地址处,只修改ip
;段间转移:jmp 1000:0 修改cs:ip=1000:0处
; jmp short s 短转移
assume cs:code

code segment  
    
start:   
     mov ax,offset start    ;执行后ax=0
  s: mov ax,offset s        ;执行后ax=3
     jmp bx                 ;执行后ip=bx
     jmp 1000h:0            ;执行后cs:ip=1000:0
     jmp short s
code ends

end start

