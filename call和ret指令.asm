;callָ�����ջ�е����ݣ��޸�IP�����ݣ��Ӷ�ʵ�ֽ�ת��;
;retfָ�����ջ�е����ݣ��޸�cs��ip�����ݣ��Ӷ�ʵ��Զת��
;CPUִ��retָ��ʱ,����������������:
;(1) (IP)=((SS)*16+(SP))
;(2) (SP)=(SP)+2                  
;CPUִ��retfָ��ʱ����������4������
;(1) (IP)=((SS)*16+(SP))
;(2) (SP)=(SP)+2
;(3) (CS)=((SS)*16+(SP))
;(4) (SP)=(SP)+2
;CPUִ��retָ���൱�ڽ���:
;POP IP
;CPUִ��retfָ���൱��
;POP IP
;POP CS  

; call [100]�൱���������
;push cs
;push ip
;jmp dwrod ptr �ڴ浥Ԫ��ַ

assume cs:code,ss:stack

stack segment
   db 16 dup (0)
stack ends
   
code segment
      ;�����retָ��ִ�к󣬻�ִ�е�һ��ָ��
;     mov ax,4c00h
;     int 21h;bios�ж�
;     
;start:
;     mov ax,stack
;     mov ss,ax;����ջ
;     mov sp,16;ָ��ջ��
;     
;     mov ax,0
;     push ax
;     mov bx,0
;     ret    ;�൱��pop ss:0����������ip(Ϊ0,ִ�е�һ�����)    
      
      ;�����retfָ��ִ�к�cs:ip=ss:ax
      mov ax,4c00h
      int 21h
start:
      ;mov ax,stack
;      mov ss,ax
;      mov sp,16
;      mov ax,0
;      push ss
;      push ax
;      mov bx,0
;      retf      ;�൱��pop ip,pop cs (cs:ip=ss:ax)
    
        mov sp,10h
        mov ax,0123h
        mov ds:[0],ax
        call word ptr ds:[0]
        ;ִ�к�,IP=0123H,SP=0EH
    
       ;mov sp,10h
;       mov ax,0123h
;       mov ds:[0],ax
;       mov word ptr ds:[2],0
;       call dword ptr ds:[0];�൱��push cs,push ip,jmp ds:[0]
       ;ִ�к�cs=0h,ip=0123h,sp=0ch
code ends   
   
end start