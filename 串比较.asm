;�ַ�������ָ���У��б�ַ�Ĵ���SIָ��Դ������(��),�ɱ�ַ�Ĵ���DIָ��Ŀ�Ĳ���
;��(��)���涨Դ������ڵ�ǰ���ݶ��У�Ŀ�Ĵ�����ڵ�ǰ���Ӷ���
;������ָ��ִ��ʱ���Զ�������Ϊָ��ʹ�õļĴ���SI��DIֵ֮
;�ַ��������ķ���(�����ַ����е�Ԫ�Ĵ���)�ɱ�־�Ĵ����еķ����־DF����
;�������־DF��λʱ(Ϊ0)ʱ����������ʽ�����Ĵ���SI��DIֵ
;�������־DF��λʱ(Ϊ1)ʱ�����ݼ���ʽ�����Ĵ���SI��DIֵ
assume ds:data,cs:code
       
data segment
     str1 db '123hh'
     str2 db '312hh'
data ends

code segment

start: 
    ;�Ƚ�str1��str2,��ͬʱ��dx����Ϊ1111h,��ͬʱdx����Ϊffffh
     mov ax,data
     mov ds,ax;�������ݶ�
     
     cld      ;�������DI,SI
     mov si,offset str1;Դ��
     mov di,offset str2;Ŀ�Ĵ�
     mov cx,5 ;�ַ�����Ϊ5��ѭ��5��
     repe cmpsb;�Ƚ��ַ�ָ�����cxѭ����Ӱ���־λZF
     je over;���ʱ��ת 
     mov dx,0ffffh;����ʱ���ô�����Ϣ
     jmp disp                            
     
  over:
     mov dx,1111h
  disp:
     mov ax,4c00h
     int 21h
     
code ends

end start

