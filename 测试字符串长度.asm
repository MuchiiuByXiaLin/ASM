;给出首字符地址和段地址,假设以0结尾 
;不知道给出字符串长度不可以使用loopne指令(cx=0 or cf=0时loop)
assume ds:data,cs:code

data segment
     db 'reerij34eewewerekekre0'
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov dx,0  
     mov di,0;目的指针  
     call str
     
     mov ax,4c00h
     int 21h
     ;程序功能，测试字符串长度
     ;入口参数:
     ;出口参数DX=字符串长度
 str:
     cmp ds:[di],'0'
     je zore
     inc di
     inc dx
     loopne str
zore:   ;为0时直接返回
     ret
code ends

end start