;�����϶�ȡһ����,��ʾ���������
assume ds:data,cs:code

data segment
    
data ends

code segment
start:  
      mov ah,1;��ȡһ����
      int 21h
      call newline;�س�����
      mov bl,al
      mov cx,8;8λ
  next:
      shl bl,1;����������λ
      mov dl,30h
      adc dl,0;ת����ABCII��
      
      mov ah,2
      int 21h;��ʾ
      loop next;ѭ��8�� 
newline:
      mov dl,10;���з�
      mov ah,02
      int 21h  
      ret 
   
code ends

end start