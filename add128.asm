;编写一个子程序，对两个128位数据进行相加
;名称:add128
;功能:两个128位数据进行相加
;参数:ds:si指向存储第一个的内存空间，因数据为128位，所以需要8个字单元
;由低地址单元到高地址单元依次存放128位数据由低到高的各个字。运算结果存储在
;第一个数的存储空间中
assume ds:data,cs:code

data segment

data ends

code segment

start:
     mov ax,data
     mov ds,ax;设置数据段
     
     mov si,0;源指针
 
add128:
     push ax
     push cx
     push si
     push di;规范，进入子程序前先保存数据，后面pop同理，恢复数据
     
     sub ax,ax;CF置0
     
     mov cx,8
  s:
     mov ax,[si]
     adc ax,[di]
     mov [si],ax
     inc si      ; 因为它为字单元，因为加2
     inc si      ; 不使用add，为了防止影响CF，下次执行adc 时可能会出错。
     inc di
     inc di
     loop s
     
     pop di
     pop si
     pop cx
     pop ax
     ret;返回    
    
code ends

end start
