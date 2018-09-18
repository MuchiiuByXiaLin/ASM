;符号扩展
;CBW(Convert Byte to Word),字符转字节,这条指令把AL中的符号扩展到寄存器AH中
;例如 MOV ax,2487h
;     cbw
;     al=87h扩展16位FF87H，所以最后ax=ff87
;CWD(Convert Word to Double word),字转双字,将AX的符号扩展到DX中
;例如 MOV AX,EE87H
;     CWD
;     AX=EE87扩展32位FFFFEE87H,所以最后AX=EE87H,DX=FFFFH
assume cs:abc

abc segment

    mov ax,2487h
    cbw  ;结果AX=FF87H

    mov ax,9999h
    cwd ;结果AX=EE87H,DX=FFFFH
    
    mov ax,4c00h
    int 21h
abc ends

end