;ͳ��1���ֵĴ���
assume ds:data,cs:code,ss:stack

data segment
     db 10 dup(10101101b)
     db 100 dup(10001111b)
     db 50 dup(00001110b)
     db 40 dup(11110110b)
     db 55 dup(10001111b)
data ends                      

stack segment
      db 16 dup(0)
stack ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov ax,stack
     mov ss,ax;����ջ
     mov sp,16;ջ��ָ��
     mov di,0;Ŀ��ָ��  
     mov bx,0;��¼1�ĸ���
     mov cx,10;���ѭ��
  s:push cx
    mov cx,8 ;�ڲ�ѭ��
 s0:ror [si],1
    jnc no
    inc bx
 no:
    inc di
    loop s0
    
    pop cx
    loop s 
    
    mov ax,4c00h
    int 21h
    
     
code ends

end start