;�ӳ������
;�����ͽ�����ݵ�����  
;��̼���data���еĵ�һ�����ݵ�3�η�,�����ں���һ��dword��Ԫ��
assume cs:code   

data segment
     dw 1,2,3,4,5,6,7,8
     dw 0,0,0,0,0,0,0,0
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov si,0
     mov di,16;��ַ�����ڶ�λ�ڶ�������
     mov cx,8
   s:
     mov bx,ds:[si]
     call cube  
     mov ds:[16+si],dx;���������ڶ����Ӧ���ֵ�Ԫ��
     mov ds:[16+si+1],ax
     add si,2
     loop s
     
     mov ax,4c00h
     int 21h
     
     ;˵��:����N��3�η�
     ;����:bx=N
     ;���:dx:ax=N^3
 cube:
     mov ax,bx
     mul bx
     mul bx
     ret;retָ�callָ������ջ�е�cs:ipȡ����������cs:ip
        ;����callָ�
code ends
   
end start

