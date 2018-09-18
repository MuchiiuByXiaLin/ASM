;除法指令,无符号除div,有符号除idiv
;被除数总是隐含在AX(除数为8位)或DX和AX中(除数为16位)
;另一个操作数可以是立即数的任何一种
;8位除数时；被除数必须是16位的AX，商放在AL，余数放在AH
;16位除数时；被除数必须是32位的(DX,AX)，商放在AX，余数放在DX
assume cs:abc

abc segment
    mov ax,0038h
    mov bl,0034h
    div bl ;即 al=ax/bl,ah=ax%bl，不考虑符号的8位除法

    mov ax,1238h
    mov bx,1234h
    div bx;即ax=(dx,ax)/bx,dx=(dx,ax)%bx，不考虑符号的16位除法

    mov ax,00e8h
    mov bl,00e9h
    idiv bl;即al=ax/bl,ah=ax%bl，考虑符号的8位除法

    mov ax,0e34h
    mov bx,0e30h
    idiv bx;即ax=(dx,ax)/bx,dx=(dx,ax)%bx,考虑符号的16位除法

    mov ax,4c00h
    int 21h

abc ends

end