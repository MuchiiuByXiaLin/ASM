;�������ʣ�ÿ�����ʹ�16���ֽ�
;�޸�ÿһ�еĵ��ĸ�Ԫ��(ƫ����3)
assume ds:data,cs:code

data segment
     db '1. filexxxxxxxxx' 
     db '2. editxxxxxxxxx'
     db '3. searchxxxxxxx'
     db '4. viewxxxxxxxxx'
     db '5. optionsxxxxxx'
     db '6. helpxxxxxxxxx'
data ends

code segment
start: 
     mov ax,data
     mov ds,ax;�������ݶ�
     
     mov cx,6;ѭ��6��
     
   s:
     mov al,[bx+3];��λ��4��Ԫ�أ�����һ��Ӣ���ַ�
     and al,11011111b;ת��д
     mov [bx+3],al
     
     add bx,16;��һ��
     loop s
     
code ends

end  start

