;movsb:串传送字节指令，传送次数:CX
assume ds:data,cs:code

data segment
     oldName db 'LSQ'
     newName db 'LXL' ;将LXL修改为LSQ
data ends

code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov es,ax;设置附加段
     mov ax,offset newName 
     mov di,ax;设置目的指针
     mov si,0;源指针，数据段起始地址
     mov cx,3
     cld        ;递增
     rep movsb
     
code ends

end start