;无符号:
;jae ok 高于等于时转移到ok
;jbe ok 低于等于时转移到ok
;有符号:
;jge ok 大于等于时转移到ok
;jle ok 小于等于时转移到ok
assume cs:code
   
code segment 
    ;将ax和bx中最大的送入cx中
    mov ax,0003h
    mov bx,0004h
    cmp ax,bx
    jae ok      ;ax>=bx时转移
    xchg ax,bx
    mov ax,cx
 ok:
    mov cx,ax   
    
    mov ax,0fffeh
    mov bx,010eh
    cmp ax,bx
    jge ok1      ;ax>bx时转移(有符号比较)
    xchg ax,bx
    mov cx,ax                        
 ok1:
    mov cx,ax                        
    
    mov ax,1000h
    mov bx,1000h
    
     
code ends

end

