;loope/loopzָ�� 
;loope��loopne���Ǳ�loop����һ������ZF��־λ�Ķ���
;loope��ֻ����CX������0��ZF=1(������)������²�ִ��ѭ��
;loopne��ֻ����CX������0��ZF=0(�������)������²�ִ��ѭ��

assume ds:data,cs:code
   
data segment
     db 'AAe e'
data ends

code segment
    ;���ַ�����һ����a�ַ�������bx��
start:
;     mov ax,data
;     mov ds,ax;�������ݶ�
;     mov cx,5;ѭ������
;     
;     mov al,'A'
;     mov di,0;Ŀ��ָ��
;  s:
;    cmp al,[di]
;    inc di
;    loope s     ;������(zf=1)�����cx!=0��ѭ��(ָ����ַ���'A')
;    
;    mov bx,[si]
;    jne ok     
;    
;    mov bx,-1
; ok:
;    mov ax,4c00h
;    int 21h
 

     ;�ҵ��ַ����е�һ�����ֵĿո�
     mov ax,data
     mov ds,ax                
     mov bx,0                   ;��ſո�
     mov cx,5                   ;ѭ������
     mov di,0                   ;Ŀ��ָ��
     mov al,20h                 ;�ո�
  s:
    cmp al,ds:[di]
    inc di
    loopne s                    ;cmp����������cx!=0ʱѭ��
    jnz not_fount               ;�Ҳ����ո��ַ�
    mov bx,[di-1]               ;�ҵ������bx
not_fount:
    mov bx,-1
code ends

end start

