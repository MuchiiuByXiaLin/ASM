;16������ת������
assume ds:data,cs:code,ss:stack

stack segment
      db 16 dup(0)
stack ends

data segment
   TIP  db 'INPUT THE NUMBER: ',0AH,0DH,'$'
data ends

code segment  
    
start:
     mov ax,data
     mov ds,ax;�������ݶ� 
     
     mov dx,offset TIP;�����ʾ��Ϣ
     mov ah,09h
     int 21h                       
     
     mov ch,4;��¼���ִ���
     mov cl,4;һ������λ��
     mov bx,0;��¼����֮�������
     mov dh,16;���ʮ��λ���������ֿ���
     
input:
     mov ah,1
     int 21h
     ;�ж��Ƿ����0-9֮��
     cmp al,30h
     jb exit;��0С���˳�
     cmp al,39h
     ja comper1;��9�����ж���A�Ĵ�С
     ;�����е���һ����˵������������0-9֮��
     jmp change1
     
comper1:
     cmp al,41h;�ж���A�Ĵ�С
     jb exit;��С��A���˳�
     cmp al,46h;�ж���F�Ĵ�С
     ja comper2;����F�����ж���a�Ĵ�С
     jmp change2;���е���һ����˵���������A-F
comper2:
     cmp al,61h;�ж���a�Ĵ�С
     jbe exit;С��a���˳�
     cmp al,66h;�ж���f�Ĵ�С
     ja exit;����f���˳�
     jmp change3;���е���һ����˵���������a-f֮��
change1:
     sub al,30h;ת��0-9
     shl bx,cl;������λ
     or bl,al;���л�����õ���λ������
     dec ch;�������ִ����Լ�1
     jz ent;��λʮ������ȫ������������ӡ�������������
     jmp input
change2:
     sub al,37h;��ʱal����A-F����ȥ37h��0AH,0BH...0FH
     shl bx,cl
     or bl,al
     dec ch
     jz ent
     jmp input
change3:
     sub al,57h;��ʱal����a-f����ȥ57h����0AH,0BH..0FH
     shl bx,cl
     or bl,al
     dec ch
     jz ent
     jmp input
;���е�change1,2,3������һ����
ent:
    mov dl,0dh;0d�ǻس�����ASCII��
    mov ah,02h;��������ַ�
    int 21h;���
    mov dl,0ah;0A�ǻ��з���ASCII��
    mov ah,02h
    int 21h
    ;����0DH,��0AHҪһ��ʹ�ã�����ʹ�ûᱨ��
    jmp print
print:
    shl bx,1
    jnc l1;�жϽ�λ�������0����������l1
    mov dl,'1';���1
    mov ah,02h
    int 21h
    dec dh
    jz exit
    jmp print
l1:
    mov dl,'0';���0
    mov ah,02h
    int 21h
    dec dh
    jz exit
    jmp print
exit:
    mov ah,4ch
    int 21h
code ends

end start
