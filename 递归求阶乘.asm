;�ӳ�������FACT
;���ܣ�����n��
;��ڲ���:(AX)=n
;���ڲ���(AX)=n!
;˵��:(1)���õݹ��㷨ʵ�ֽ׳�;
;(2)n���ܳ���8
assume ds:data,cs:code

data segment
    
data ends

code segment
start:
      mov ax,5 
      
FACT proc 
     push dx
     mov dx,ax
     cmp ax,0;nΪ0?
     jz done;�ǣ���ת
     dec ax;����n-1
call FACT       ;��(n-1)!
     mul dx     ;n*(n-1)
     pop dx       
     ret           
done:
     mov ax,1;0!=1
     pop dx   
     ret    
FACT endp 

code ends

end start