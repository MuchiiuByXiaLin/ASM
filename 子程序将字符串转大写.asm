assume cs:code,ds:data

data segment
     db 'DdsdKoosdw'
data ends

code segment
start:
main:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov cx,10;ѭ������(�ַ�������)
     mov bx,0
     call str
     
     mov ax,4c00h
     int 21h
     ;���ܣ����ַ���ת��д
     ;����:cx:�ַ�������
     ;����:bx:�ַ����׵�ַ
 str:
     and byte ptr [bx],11011111b
     inc bx
     loop str
     ret
code ends


end start