;and指令:逻辑与指令,按位进行与运算。两个都是1结果才为1
;or指令:逻辑或指令,按位进行或运算。只要一个为1结果为1
assume cs:code

code segment
     mov al,01100011B
     or  al,00111011B;结果为al=01111011B
     
     mov al,01100011B
     and al,00111011B;结果为al=00100011B
      
     and al,10111111B;将第6位设置为0
     and al,01111111B;将第7位设置为0
     
     or  al,01000000B;将第6位设置为1
     or  al,10000000B;将第7位设置为1
     
     mov ax,4c00h
     int 21h
    
code ends


end