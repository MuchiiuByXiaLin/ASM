;��ʹ��loopѭ��
assume cs:code

data segment
     db 100 dup(1)
     
data ends
     
code segment     
    
start:
      mov ax,data
      mov ds,ax;�������ݶ�
      mov ax,0
      mov dx,0
      mov si,0;����ָ��
      mov cx,100
  next:
      add ax,ds:[si]
      adc ax,0;���Ͽ��ܵĽ�λ
      inc si    
      dec cx;��������һ
      jne next;�����Ϊ0����ô�����ۼ���һ������
code ends

end start

