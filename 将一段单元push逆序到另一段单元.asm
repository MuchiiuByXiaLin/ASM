;��a�ε�ǰ8����������push,����洢��b����
assume cs:code
   
a segment
    dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16    
a ends
    
b segment
    dw 0,0,0,0,0,0,0,0   
b ends
   
code segment 
    
start:
      mov ax,a
      mov ds,ax;����dsָ��a
    
      mov cx,b
      mov ss,cx    
      mov sp,16;����ss:spָ��ջ�������һ����
      mov cx,8
      mov bx,0
      s:
      push ds:[bx]
      add bx,2
      loop s

code ends  
  
end  start

