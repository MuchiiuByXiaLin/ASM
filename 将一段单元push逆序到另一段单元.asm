;将a段的前8个字型数据push,逆序存储到b段中
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
      mov ds,ax;设置ds指向a
    
      mov cx,b
      mov ss,cx    
      mov sp,16;设置ss:sp指向栈顶的最后一个字
      mov cx,8
      mov bx,0
      s:
      push ds:[bx]
      add bx,2
      loop s

code ends  
  
end  start

