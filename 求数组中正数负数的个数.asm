;�������͸����ĸ���
assume ds:data,cs:code

data segment
     db 20 dup(1)
     db 20 dup(-1)
     db 20 dup(2)
     db 20 dup(1)
     db 20 dup(0)
data ends
     mov ax,data
     mov ds,ax;�������ݶ�
     mov cx,100;ѭ������(�ֽڸ���)
     mov si,0;�����������
     mov di,0;��Ÿ�������
     mov bx,0;ָ��
     
again:
     cmp ds:[bx],0
     jle less       ;<=0��ת
     inc si         ;����������1
     jmp short next         
     
     mov ax,4c00h
     int 21h
less:
     jl next        ;С����ת
     inc di         ;����������1
next:
     inc bx
     dec cx
     jnz again      ;cx��Ϊ0ʱ��ת
     
code segment
    
code ends

end