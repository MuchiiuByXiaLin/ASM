;��ÿ������ת��Ϊ��д
;���ѭ������ÿ�У�ÿ���ٱ�����0-3��Ԫ��
;��ѭ������ÿһ��
;��ѭ������ÿһ��
;ASM�е�ѭ����do-whileѭ��
assume ds:data,cs:code,ss:stack

data segment
     db 'abc123xxxxxxxxxx'
     db 'bcn234xxxxxxxxxx'
     db 'cwe12wxxxxxxxxxx'
     db 'dwesdwxxxxxxxxxx' 
data ends

stack segment
     dw 0,0,0,0,0,0,0,0                 ;��������Ϊ16�ֽڵ�ջ
stack ends                                  

code segment
    
start:
     mov ax,data
     mov ds,ax                          ;�������ݶ�
     
     mov ax,stack
     mov ss,ax                          ;����ջ
     
     mov bx,0                           ;
     mov sp,16                          ;//ջ��ָ��ָ��ջ��
     mov cx,4                           ;���ѭ������
    
  s0:                                   ;���ѭ��
     push cx                            ;�ȱ������ѭ������
     mov si,0                           ;si����ѭ��0-3��Ԫ��
     mov cx,3                           ;�ڲ�ѭ������ 
     
   s:                                   ;�ڲ�ѭ��
     mov al,[bx+si]
     and al,11011111b                      
     mov [bx+si],al                     ;ת��д 
     inc si                            
     loop s                             ;loop s��ִ������,ӦΪcx=3
     
      
     add bx,16                          ;ת����һ��
     pop cx                             ;����cx=4
     loop s0
     
     mov ax,4c00h                       
     int 21h                            ;����BIOS�ж�
     
code ends  
    
end start

