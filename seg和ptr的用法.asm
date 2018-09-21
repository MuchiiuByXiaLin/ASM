;mov ax,word ptr [bx]意思是显示声明将ds:[bx]字节声明为字
;用于两个操作数位数不一样时
;修改DEC公司部分信息,排名字段改为38,收入字段增加70，
;著名产品修改为VAX
;ASCII码：一个英文字母等于一个字节；一个字节一个存储单元
;db指令告诉编译器把每个字符当做字节,DB 'ABC'占3个存储单元
;dw指令告诉编译器把每个字符当做字的低位
;例如 dw 'p'占用两个存储单元，db 'p'占一个存储单元。
; dw 'abc'开辟四个存储单元
assume ds:data,cs:code

data segment
     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     ;DEC公司记录所在内存地址:ds:60
     db 'DEC' ;公司名称
     db 'Ken Oslen' ;总裁名称
     db 137 ;富豪排名榜
     db 40  ;收入(40亿美元)
     db 'VPN' ;著名产品
data ends

code segment
start:
    mov ax,data
    mov ds,ax;设置数据段
    
    mov bx,60;基址
    mov si,0;变址
    
    mov [bx+12],38;修改排名字段
    add [bx+13],70;修改收入字段
    
    mov [bx+14+si],'V'
    inc si
    mov [bx+14+si],'A'
    inc si
    mov [bx+14+si],'X'
    
    
    
    mov ax,word ptr [bx]
     
code ends

end start

