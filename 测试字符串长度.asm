;�������ַ���ַ�Ͷε�ַ,������0��β 
;��֪�������ַ������Ȳ�����ʹ��loopneָ��(cx=0 or cf=0ʱloop)
assume ds:data,cs:code

data segment
     db 'reerij34eewewerekekre0'
data ends

code segment
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     mov dx,0  
     mov di,0;Ŀ��ָ��  
     call str
     
     mov ax,4c00h
     int 21h
     ;�����ܣ������ַ�������
     ;��ڲ���:
     ;���ڲ���DX=�ַ�������
 str:
     cmp ds:[di],'0'
     je zore
     inc di
     inc dx
     loopne str
zore:   ;Ϊ0ʱֱ�ӷ���
     ret
code ends

end start