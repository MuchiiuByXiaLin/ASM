;дһ���б��ַ��Ƿ�Ϊ���ַ����ӳ���
;�����ø��ӳ����һ���ַ����е������ַ�ɾ��
assume ds:data,cs:code

data segment
     db " 2ae2re2r3"
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov cx,10;10���ַ���ѭ��10��
     mov si,0;Ŀ��ָ��
     call num  
     
     mov cx,4c00h
     int 21h
 num:
     cmp ds:[si],39h;�Ƿ��������9��ASCII��
     ja no
     cmp ds:[si],30h;�Ƿ���С������1��ASCII��
     jb no
     mov ds:[si],0;���ִ�е��ⲽ˵�������֣���0
  no:
     inc si
     loop num 
     ret 
     
 
    
code ends

end start