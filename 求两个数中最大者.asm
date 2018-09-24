;比较两个数大小，将大数存入max单元
assume ds:data,cs:code

data segment
     source db 23h,24h
     max db 0
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     
     mov al,source;假设第一个为最大
     cmp al,source+1
     jnc one;大于则跳转
     mov al,source+1;小于则将第二个设置到al，在one中送入max单元
     
 ;不管程序是否跳转都要执行one标号代码
 one:
     mov max,al
code ends

end start