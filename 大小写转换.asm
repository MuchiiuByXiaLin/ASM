;��'BaSiC'ת��д,'iNfOrMaTiOn'תСд����ʹ���ж����
;��A(0100 0001)����λΪ0,a(0110 0001)����λΪ1(����λ��ʼ��)
;��2^2+2^1=6,2^2+2^0=4,�պ�Ϊ16���Ƶĵ�1λ(����λ��ʼ��)
;�۲���ɿɵô�Сдת��ֻ��ı����λ�����ּ��� 

;and(��λ��)��������Ҫ��������1�������1
;or(��λ��)������ֻҪһ����1�������1

assume ds:data,cs:code

data segment
     db 'SKjsdisKiO'
     db 'dsdwekJSIE'
data ends           

code segment 
    
start:
     mov ax,data
     mov ds,ax;�������ݶ�
     
     mov bx,0
     mov cx,10
     
    s:
     mov al,ds:[bx]
     and al,11011111b;//��λ�룬������λת��Ϊ0(ת��д)
     mov ds:[bx],al
     
     mov al,ds:[bx+10]
     or al,00100000b;//��λ�򣬽�����λת��Ϊ1(תСд)
     mov ds:[bx+10],al
     
     inc bx
     loop s
     
     mov ax,4c00h
     int 21h
     
code ends

end  start
