;将a段的数据和b段的数据依次相加,存放在c段中
assume cs:code

a segment
    db 1,2,3,4,5,6,7,8   
a ends

b segment
    db 1,2,3,4,5,6,7,8   
b ends

c segment
    db 0,0,0,0,0,0,0,0    
c ends

code segment

start:
     mov cx,8
     mov bx,0
     
     mov ax,a
     mov ds,ax;ds->a
     
     mov es,ax;es->b
     
     mov ax,c
     mov ss,ax;ss->c
     s:
     mov ax,ds:[bx]    
     add ax,es:[bx];a+b
     mov ss:[bx],ax;c=a+b
     inc bx;bx=bx+1
     loop s
code ends

end start




