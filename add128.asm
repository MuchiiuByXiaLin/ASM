;��дһ���ӳ��򣬶�����128λ���ݽ������
;����:add128
;����:����128λ���ݽ������
;����:ds:siָ��洢��һ�����ڴ�ռ䣬������Ϊ128λ��������Ҫ8���ֵ�Ԫ
;�ɵ͵�ַ��Ԫ���ߵ�ַ��Ԫ���δ��128λ�����ɵ͵��ߵĸ����֡��������洢��
;��һ�����Ĵ洢�ռ���
assume ds:data,cs:code

data segment

data ends

code segment

start:
     mov ax,data
     mov ds,ax;�������ݶ�
     
     mov si,0;Դָ��
 
add128:
     push ax
     push cx
     push si
     push di;�淶�������ӳ���ǰ�ȱ������ݣ�����popͬ���ָ�����
     
     sub ax,ax;CF��0
     
     mov cx,8
  s:
     mov ax,[si]
     adc ax,[di]
     mov [si],ax
     inc si      ; ��Ϊ��Ϊ�ֵ�Ԫ����Ϊ��2
     inc si      ; ��ʹ��add��Ϊ�˷�ֹӰ��CF���´�ִ��adc ʱ���ܻ����
     inc di
     inc di
     loop s
     
     pop di
     pop si
     pop cx
     pop ax
     ret;����    
    
code ends

end start
