;将'BaSiC'转大写,'iNfOrMaTiOn'转小写。不使用判断语句
;如A(0100 0001)第五位为0,a(0110 0001)第五位为1(从零位开始数)
;即2^2+2^1=6,2^2+2^0=4,刚好为16进制的第1位(从零位开始数)
;观察规律可得大小写转换只需改变第五位的数字即可 

;and(按位与)两个数需要两个都是1结果才是1
;or(按位或)两个数只要一个是1结果就是1

assume ds:data,cs:code

data segment
     db 'SKjsdisKiO'
     db 'dsdwekJSIE'
data ends           

code segment 
    
start:
     mov ax,data
     mov ds,ax;设置数据段
     
     mov bx,0
     mov cx,10
     
    s:
     mov al,ds:[bx]
     and al,11011111b;//按位与，将第五位转换为0(转大写)
     mov ds:[bx],al
     
     mov al,ds:[bx+10]
     or al,00100000b;//按位或，将第五位转换为1(转小写)
     mov ds:[bx+10],al
     
     inc bx
     loop s
     
     mov ax,4c00h
     int 21h
     
code ends

end  start
