;假定串行通讯口的输入数据寄存器的端口地址为50h,状态寄存器的端口
;地址为51h,状态寄存器各位为1时含义如下，请编一程序输入一串字符并
;存入缓存区BUFF,同时教研输入的正确性，如有错则转出错处理程序
;含义:
; 0~7位:
;0:输出寄存器空,1:输入数据准备好,3:奇偶校验错,4:溢出错,5:格式错
;其它位无意义

assume ds:data,cs:code

data segment
     BUFF db 80 dup(0)
data ends

code segment
start:                 
     mov bx,0;记录错误次数
     mov di,0 ;目的指针
     mov cx,80;80个字符
 one:in al,51h
     test al,02h;测试51h端口是否输入数据准备好(00000010),第2位
     jz one;未准备好则一直循环测试状态 
     
     ;执行到这里说明输入数据寄存器准备好了
     in al,50h
     mov buff[di],al;将第一个字符送入缓存区第一位位置
     inc di;转向下一个字符
     in al,51h;输入第一个字符后应该检查其它位是否有错误
     test al,38h;检测(00111000)格式错误，溢出错误，奇偶检验错误
     jz err
     loop one;循环读取
     
     mov cx,4ch
     int 21h;暂停程序
 err:
     inc bx;更新错误次数
     loop one;                                      
     
code ends

end start