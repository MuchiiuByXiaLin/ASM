;pushf��popf:����־�Ĵ�����ֵѹջ�ͳ�ջ
assume ds:data,cs:code

data segment
     db 16 dup(0)
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     
     mov ax,0
     push ax
     popf
     mov ax,0fff0h
     add ax,0010h
     pushf
     pop ax
     and al,11000101b
     and ah,00001000b
code ends

end start

