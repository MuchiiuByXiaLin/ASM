;offset:ȡ���ƫ�Ƶ�ַ
;�� mov ax,offset start 
;startƫ�Ƶ�ַΪ0������ָ��ȼ��� mov ax,0
;ͬ�� mov ax,offset s �ȼ���mov ax,3 

;����ת��:jmm ax,��ip��ת��ip=ax��ַ��,ֻ�޸�ip
;�μ�ת��:jmp 1000:0 �޸�cs:ip=1000:0��
; jmp short s ��ת��
assume cs:code

code segment  
    
start:   
     mov ax,offset start    ;ִ�к�ax=0
  s: mov ax,offset s        ;ִ�к�ax=3
     jmp bx                 ;ִ�к�ip=bx
     jmp 1000h:0            ;ִ�к�cs:ip=1000:0
     jmp short s
code ends

end start

