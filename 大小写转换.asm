;将'BaSiC'转大写,'iNfOrMaTiOn'转小写。不使用判断语句
;如A(0100 0001)第五位为0,a(0110 0001)第五位为1(从零位开始数)
;即2^2+2^1=6,2^2+2^0=4,刚好为16进制的第1位(从零位开始数)
;观察规律可得大小写转换只需改变第五位的数字即可 

;and(按位与)两个数需要两个都是1结果才是1
;or(按位或)两个数只要一个是1结果就是1

assume cs:code

data segment
     db 'BaSiC'
     db 'iNfOrMaTiOn'
data ends

code segment
start:
     mov ax,data    
     mov ds,ax;设置ds->data
     
     mov bx,0
     mov cx,5 ;先转换BaSiC 
     
   s:mov al,[bx];al转换后送回存储器
     and al,11011111B;将al的ASCII码的第5位置为0,变为大写字母
     mov [bx],al
     inc bx
     loop s 
     
     mov bx,5
     mov cx,11
  s0:mov al,[bx];al转换后送回存储器
     or  al,00100000B;将al的ASCII码的第5位置为1,变为小写字母
     mov [bx],al 
     
     inc bx
     loop s0
     
code ends

end start
