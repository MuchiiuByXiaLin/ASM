;�޷���:
;jae ok ���ڵ���ʱת�Ƶ�ok
;jbe ok ���ڵ���ʱת�Ƶ�ok
;�з���:
;jge ok ���ڵ���ʱת�Ƶ�ok
;jle ok С�ڵ���ʱת�Ƶ�ok
assume cs:code
   
code segment 
    ;��ax��bx����������cx��
    mov ax,0003h
    mov bx,0004h
    cmp ax,bx
    jae ok      ;ax>=bxʱת��
    xchg ax,bx
    mov ax,cx
 ok:
    mov cx,ax   
    
    mov ax,0fffeh
    mov bx,010eh
    cmp ax,bx
    jge ok1      ;ax>bxʱת��(�з��űȽ�)
    xchg ax,bx
    mov cx,ax                        
 ok1:
    mov cx,ax                        
    
    mov ax,1000h
    mov bx,1000h
    
     
code ends

end

