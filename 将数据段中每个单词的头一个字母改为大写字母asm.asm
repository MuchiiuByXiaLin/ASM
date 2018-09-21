;六个单词，每个单词共16个字节
;修改每一行的第四个元素(偏移量3)
assume ds:data,cs:code

data segment
     db '1. filexxxxxxxxx' 
     db '2. editxxxxxxxxx'
     db '3. searchxxxxxxx'
     db '4. viewxxxxxxxxx'
     db '5. optionsxxxxxx'
     db '6. helpxxxxxxxxx'
data ends

code segment
start: 
     mov ax,data
     mov ds,ax;设置数据段
     
     mov cx,6;循环6次
     
   s:
     mov al,[bx+3];定位第4个元素，即第一个英文字符
     and al,11011111b;转大写
     mov [bx+3],al
     
     add bx,16;下一行
     loop s
     
code ends

end  start

