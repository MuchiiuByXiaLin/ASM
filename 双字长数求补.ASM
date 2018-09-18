;求存放在DX和AX中的双字长数求补
;DX存放高位,AX存放低位
assume cs:abc
abc segment
    mov dx,1234h
    mov ax,4567h  ;设置ax,dx值

    neg dx        ;高位字先求补
    neg ax        ;低位字再求补
    sbb dx,0      ;高位字做带进位减法

    mov ax,4c00h
    int 21h
abc ends          ;安全退出
end