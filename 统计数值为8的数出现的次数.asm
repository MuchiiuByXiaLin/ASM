;ͳ����ֵΪ8�������ֵĴ���
assume ds:data,cs:code

data segment
     db 1,8,8,8,4,34,8,9,6,10;10���ֽ�
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov cx,8
     mov si,0;ָ��
     mov bx,0;�����ֵΪ8�������ֵĴ���
     call count
     
     mov ax,4ch
     int 21h
count:
     cmp ds:[si],8
     jne no   ;����ʱ��ת
     inc bx
  no:
     inc si
     loop count
     ret
code ends

end start