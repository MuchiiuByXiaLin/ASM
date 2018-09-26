;子程序名：FACT
;功能：计算n！
;入口参数:(AX)=n
;出口参数(AX)=n!
;说明:(1)采用递归算法实现阶乘;
;(2)n不能超过8
assume ds:data,cs:code

data segment
    
data ends

code segment
start:
      mov ax,5 
      
FACT proc 
     push dx
     mov dx,ax
     cmp ax,0;n为0?
     jz done;是，跳转
     dec ax;否，则n-1
call FACT       ;求(n-1)!
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