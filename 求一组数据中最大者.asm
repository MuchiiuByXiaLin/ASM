;����ѭ��ָ��,ʱ�临�Ӷ�O(N)
assume cs:code,ds:data

data segment
     db 10 dup(2)
     db 1 dup(20h) 
     db 30 dup(6)
     db 19 dup(4)
     db 40 dup(9)
data ends        

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov cx,100;ѭ������
     mov di,0;Ŀ��ָ��
     mov ax,0
     mov al,[di];�����һ��Ϊ���ֵ���ݴ�al��
     
  s:
    inc di
    cmp al,ds:[di]
    jnc one;��������ת
    mov al,ds:[di];С��
one:
    loop s;����Ѱ����һ�����бȽ�
code ends

end start