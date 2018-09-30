;编程，接收用户的键盘输入，输入"r"，将屏幕上的字符设置
;为红色;输入"g"，将屏幕上的字符设置为绿色;输入"b"，
;将屏幕上的字符设置为蓝色
assume ds:data,cs:code

data segment
     char db 0
data ends

code segment

start:

     
     mov ah,0;进行输入
     int 16h;输入字符存放在al中
     
     mov ah,1
     cmp al,'r'
     je Red
     cmp al,'g'
     je Grren
     cmp al,'b'
     je Bule  
     
  Red:
      shl ah,1 
  Grren:
      shl ah,1
  Bule:
       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000
       
    s:and byte ptr es:[bx],11111000b
      or es:[bx],ah
      add bx,2
      loop s
   
  sret:
      mov ax,4c00h
      int 21h
  
   
code ends

end start