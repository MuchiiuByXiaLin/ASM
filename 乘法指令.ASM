;无符号数乘法指令:MUL
;无符号数乘法指令:IMUL
;单操作数,另一个操作数隐含在AX或AL中
;16位乘16位等于32位低位存放在AL，高位存放在DL
;8位乘8位时高位存放在AX，低位存放在AL
;显示的操作数必须是除立即数以外
assume cs:abc

abc segment
start:
      mov ax,9999h
      mov bx,9999h
      mul bx;;结果为:5C283D71。即AX=3D71,DX=5C28H

      mov dx,0
      mov ax,9999h
      mov bx,ax
      imul ax ;结果为:28F63D71。即AX=3D71H,DX=28F6H
      mov ax,4c00h
      int 21h
abc ends

end start
