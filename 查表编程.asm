;����һЩ�̶������ֵ�����ǿ��Խ���������洢������
;�ô洢�ռ任ȡ�����ٶ�,������Ƕȵ�����ֵ���±��
assume ds:data,cs:code

data segment
    
    
data ends
     
code segment

start:
      call showsin
      mov ax,30
     
     
  ;�����ܣ�����Ƕȵ�����ֵ
  ;��ڲ���:ax=�Ƕ�
  ;���ڲ���
showsin:jmp short show
        table dw ag0,ag30,ag60,ag90,ag120,ag150,ag180;�ַ���ƫ�Ƶ�ַ��
        ag0 db '0',0 ;sin(0)���ڵ��ַ���'0'
        ag30 db '0.5',0  ;sin(30)���ڵ��ַ���0.5
        ag60 db '0.886',0;sin(60)���ڵ��ַ���
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
        
        ;�����ýǶ�ֵ/30��Ϊ�����table��ƫ�ƣ�ȡ�ö��ڵ��ַ���
        ;ƫ�Ƶ�ַ������bx��
        mov ah,0
        mov bl,30
        div dl
        mov bl,al
        mov bh,0
        add bx,bx
        mov bx,table[bx]
        
        ;������ʾsin(x)���ڵ��ַ���
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

