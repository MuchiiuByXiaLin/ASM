;��'BaSiC'ת��д,'iNfOrMaTiOn'תСд����ʹ���ж����
;��A(0100 0001)����λΪ0,a(0110 0001)����λΪ1(����λ��ʼ��)
;��2^2+2^1=6,2^2+2^0=4,�պ�Ϊ16���Ƶĵ�1λ(����λ��ʼ��)
;�۲���ɿɵô�Сдת��ֻ��ı����λ�����ּ��� 

;and(��λ��)��������Ҫ��������1�������1
;or(��λ��)������ֻҪһ����1�������1

assume cs:code

data segment
     db 'BaSiC'
     db 'iNfOrMaTiOn'
data ends

code segment
start:
     mov ax,data    
     mov ds,ax;����ds->data
     
     mov bx,0
     mov cx,5 ;��ת��BaSiC 
     
   s:mov al,[bx];alת�����ͻش洢��
     and al,11011111B;��al��ASCII��ĵ�5λ��Ϊ0,��Ϊ��д��ĸ
     mov [bx],al
     inc bx
     loop s 
     
     mov bx,5
     mov cx,11
  s0:mov al,[bx];alת�����ͻش洢��
     or  al,00100000B;��al��ASCII��ĵ�5λ��Ϊ1,��ΪСд��ĸ
     mov [bx],al 
     
     inc bx
     loop s0
     
code ends

end start
