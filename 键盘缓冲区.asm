;��̣������û��ļ������룬����"r"������Ļ�ϵ��ַ�����
;Ϊ��ɫ;����"g"������Ļ�ϵ��ַ�����Ϊ��ɫ;����"b"��
;����Ļ�ϵ��ַ�����Ϊ��ɫ
assume ds:data,cs:code

data segment
     char db 0
data ends

code segment

start:

     
     mov ah,0;��������
     int 16h;�����ַ������al��
     
     mov ah,1
     cmp al,'r'
     je Red
     cmp al,'g'
     je Grren
     cmp al,'b'
     je Bule  
     
  Red:
      shl ah,1 
  Grren:
      shl ah,1
  Bule:
       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000
       
    s:and byte ptr es:[bx],11111000b
      or es:[bx],ah
      add bx,2
      loop s
   
  sret:
      mov ax,4c00h
      int 21h
  
   
code ends

end start