;movsb:�������ֽ�ָ����ʹ���:CX
assume ds:data,cs:code

data segment
     oldName db 'LSQ'
     newName db 'LXL' ;��LXL�޸�ΪLSQ
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov es,ax;���ø��Ӷ�
     mov ax,offset newName 
     mov di,ax;����Ŀ��ָ��
     mov si,0;Դָ�룬���ݶ���ʼ��ַ
     mov cx,3
     cld        ;����
     rep movsb
     
code ends

end start