;写一个判别字符是否为数字符的子程序
;并利用该子程序把一个字符串中的所有字符删除
assume ds:data,cs:code

data segment
     db " 2ae2re2r3"
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,10;10个字符，循环10次
     mov si,0;目的指针
     call num  
     
     mov cx,4c00h
     int 21h
 num:
     cmp ds:[si],39h;是否大于数字9的ASCII码
     ja no
     cmp ds:[si],30h;是否是小于数字1的ASCII码
     jb no
     mov ds:[si],0;如果执行到这步说明是数字，置0
  no:
     inc si
     loop num 
     ret 
     
 
    
code ends

end start