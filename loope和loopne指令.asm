;loope/loopz指令 
;loope和loopne就是比loop多了一个测试ZF标志位的东西
;loope是只有在CX不等于0和ZF=1(结果相等)的情况下才执行循环
;loopne是只有在CX不等于0和ZF=0(结果不等)的情况下才执行循环

assume ds:data,cs:code
   
data segment
     db 'AAe e'
data ends

code segment
    ;将字符串第一个非a字符保存在bx中
start:
;     mov ax,data
;     mov ds,ax;设置数据段
;     mov cx,5;循环次数
;     
;     mov al,'A'
;     mov di,0;目的指针
;  s:
;    cmp al,[di]
;    inc di
;    loope s     ;如果结果(zf=1)相等且cx!=0则循环(指向的字符与'A')
;    
;    mov bx,[si]
;    jne ok     
;    
;    mov bx,-1
; ok:
;    mov ax,4c00h
;    int 21h
 

     ;找到字符串中第一个出现的空格
     mov ax,data
     mov ds,ax                
     mov bx,0                   ;存放空格
     mov cx,5                   ;循环次数
     mov di,0                   ;目的指针
     mov al,20h                 ;空格
  s:
    cmp al,ds:[di]
    inc di
    loopne s                    ;cmp结果不相等且cx!=0时循环
    jnz not_fount               ;找不到空格字符
    mov bx,[di-1]               ;找到则存入bx
not_fount:
    mov bx,-1
code ends

end start

