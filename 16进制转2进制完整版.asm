;16进制数转二进制
assume ds:data,cs:code,ss:stack

stack segment
      db 16 dup(0)
stack ends

data segment
   TIP  db 'INPUT THE NUMBER: ',0AH,0DH,'$'
data ends

code segment  
    
start:
     mov ax,data
     mov ds,ax;设置数据段 
     
     mov dx,offset TIP;输出提示信息
     mov ah,09h
     int 21h                       
     
     mov ch,4;记录数字次数
     mov cl,4;一次左移位数
     mov bx,0;记录左移之后的数字
     mov dh,16;输出十六位二进制数字控制
     
input:
     mov ah,1
     int 21h
     ;判断是否存在0-9之间
     cmp al,30h
     jb exit;比0小则退出
     cmp al,39h
     ja comper1;比9大则判断与A的大小
     ;若进行到下一步则说明这次输入的是0-9之间
     jmp change1
     
comper1:
     cmp al,41h;判断与A的大小
     jb exit;若小于A则退出
     cmp al,46h;判断与F的大小
     ja comper2;若比F大则判断与a的大小
     jmp change2;进行到这一步则说明输入的是A-F
comper2:
     cmp al,61h;判断与a的大小
     jbe exit;小于a则退出
     cmp al,66h;判断与f的大小
     ja exit;大于f则退出
     jmp change3;进行到这一步则说明输入的是a-f之间
change1:
     sub al,30h;转换0-9
     shl bx,cl;左移四位
     or bl,al;进行或运算得到四位二进制
     dec ch;输入数字次数自减1
     jz ent;四位十六进制全部输入完毕则打印，否则继续输入
     jmp input
change2:
     sub al,37h;此时al中是A-F，减去37h是0AH,0BH...0FH
     shl bx,cl
     or bl,al
     dec ch
     jz ent
     jmp input
change3:
     sub al,57h;此时al中是a-f，减去57h就是0AH,0BH..0FH
     shl bx,cl
     or bl,al
     dec ch
     jz ent
     jmp input
;所有的change1,2,3道理都是一样的
ent:
    mov dl,0dh;0d是回车符的ASCII码
    mov ah,02h;输出单个字符
    int 21h;输出
    mov dl,0ah;0A是换行符的ASCII码
    mov ah,02h
    int 21h
    ;这里0DH,和0AH要一起使用，单独使用会报错
    jmp print
print:
    shl bx,1
    jnc l1;判断进位，如果是0，则跳到了l1
    mov dl,'1';输出1
    mov ah,02h
    int 21h
    dec dh
    jz exit
    jmp print
l1:
    mov dl,'0';输出0
    mov ah,02h
    int 21h
    dec dh
    jz exit
    jmp print
exit:
    mov ah,4ch
    int 21h
code ends

end start
