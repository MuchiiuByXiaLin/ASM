;�Ƚ���������С������������max��Ԫ
assume ds:data,cs:code

data segment
     source db 23h,24h
     max db 0
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     
     mov al,source;�����һ��Ϊ���
     cmp al,source+1
     jnc one;��������ת
     mov al,source+1;С���򽫵ڶ������õ�al����one������max��Ԫ
     
 ;���ܳ����Ƿ���ת��Ҫִ��one��Ŵ���
 one:
     mov max,al
code ends

end start