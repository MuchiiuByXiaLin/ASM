;��ȡ������16�������������Ӧ�Ķ�����������Ļ
assume ds:data,cs:code

data segment
   binval  dw 0B39h
data ends

code segment
start:
     mov ax,data          
     mov ds,ax;�������ݶ� 
     
     mov bx,binval
     mov cx,16
  lp1:
     rol bx,1
     mov dl,0
     adc dl,30h
     mov ah,02h
     int 21h
     loop lp1
 over:
     mov ah,4ch
     int 21h
code ends

end start