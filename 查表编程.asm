;对于一些固定计算的值，我们可以将其计算结果存储起来，
;用存储空间换取运算速度,例如求角度的正弦值如下编程
assume ds:data,cs:code

data segment
    
    
data ends
     
code segment

start:
      call showsin
      mov ax,30
     
     
  ;程序功能：计算角度的正弦值
  ;入口参数:ax=角度
  ;出口参数
showsin:jmp short show
        table dw ag0,ag30,ag60,ag90,ag120,ag150,ag180;字符串偏移地址表
        ag0 db '0',0 ;sin(0)对于的字符串'0'
        ag30 db '0.5',0  ;sin(30)对于的字符串0.5
        ag60 db '0.886',0;sin(60)对于的字符串
        ag90 db '1',0
        ag120 db '0.866',0
        ag150 db '0.5',0
        ag180 db '0',0
    show:
        push bx
        push es
        push si
        mov bx,0b800h
        mov es,bx
        
        ;以下用角度值/30作为相对于table的偏移，取得对于的字符的
        ;偏移地址，放在bx中
        mov ah,0
        mov bl,30
        div dl
        mov bl,al
        mov bh,0
        add bx,bx
        mov bx,table[bx]
        
        ;以下显示sin(x)对于的字符串
        mov si,160*12+40*2
   shows:
        mov ah,cs:[bx]
        cmp ah,0
        je showret
        mov es:[si],ah
        inc bx
        add si,2
        jmp short shows
  showret:
        pop si
        pop es
        pop bx
        ret
        
code ends

end start

