;将0-16中的字变量依次累加到ax中
assume cs:code
;不可以pop cs
code segment
     dw 0123h,0456h,0789h,0abch,0bcdh,0cdeh,0defh,0987h;定义字变量,一个字两个存储单元
     ;用debug查看内存cs:0-cs:16发现并没有指令,而是存放定义的字变量数据,从16号开始存放指令代码
     ;start定义程序入口,本质是修改CS:IP指向
start: mov ax,0
       mov bx,0

       mov cx,8
       s:add ax,cs:[bx]
       add bx,2
       loop s
     
       mov ax,4c00h
       int 21h

code ends

end  start