;��д������ʾ"overflow!"���жϴ������:do0
;��do0�����ڴ�0000:0200��
;��do0����ڵ�ַ0000:0200�洢���ж�������0�ű�����
assume ds:data,cs:code

data segment
    
data ends

code segment
start:
     mov ax,data
     mov ds,ax
     
code ends

end start