
assume ds:data,cs:code

data segment
     db 'HU DAMING','$';��������(HU DAMING)�޸�Ϊ������(HU DANING)
data ends
      
code segment
start:
     mov ax,data
     mov ds,ax  
     mov es,ax
     cld        ;�������
     mov di,0;offset name;Ŀ��ָ��
     mov cx,09  ;�ַ�������
     mov al,'M' ;Ҫ�޸ĵ��ַ�
     
     repne scasb;����ʱ��cx��=0ʱ��ѭ��:DI+1,CX-1  
     
     jne disp   ;����ʱ��ת��disp
     dec di     ;ָ�����ҵ�Mʱdi�Ѿ�ָ��M�����һ���ַ�
     mov byte ptr [di],'N' ;�޸�MΪN
disp:
     mov ax,4ch
     int 21h
    
code ends

end start

