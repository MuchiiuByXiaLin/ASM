;���,ʹ�ô�����ָ���F000H���е����16���ַ����Ƶ�data����
;���͵�ԭʼλ��:F000:FFFF(
;���͵�Ŀ��λ��:data:000F
;���͵ĳ���:16
;���͵ķ���:�����ͣ�����df=1
assume ds:data,cs:code

data segment
     db 16 dup(0)
data ends

code segment
start:   
      mov ax,0f000h
      mov ds,ax;�������ݶ�
      mov es,ax;���ø��Ӷ�(Ҳ�����ݶ���)
      mov si,0ffffh;Դָ��ָ�����16���ַ������һ��
      mov di,15;Ŀ��ָ��ָ��data���е����һ���ַ�
      mov cx,16;���ƴ���
      std      ;df=1���ݼ�di,si
      rep movsb
      
      mov ax,4ch
      int 21h 
code ends

end start