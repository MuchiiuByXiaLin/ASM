;�ӳ�������
;����(dh)=�к�(ȡֵ��Χ0~24),(dl)=�к�(ȡֵ��Χ0~79),
;(cl)=��ɫ,ds:siָ���ַ������׵�ַ
;����:��

assume ds:data,cs:code

data segment
   MSG  db 'Welcome to masm',0 
   len equ $--MSG  ;��Ϣ����
data ends

code segment
start:
      mov ax,data
      mov ds,ax
      mov si,0  ;Ŀ��ָ��
      mov cx,len;�ַ�������
      mov ah,02 ;����������� 
      call show_str
      
      mov ax,4c00h
      int 21h
      ;����dl=Ҫ��ʾ���ַ�
show_str:
      mov dl,[si]
      int 21h
      inc si
      loop show_str
      ret
   
code ends

end start