;BubbleSort time:O(N^2)
assume cs:code,ds:data

data segment
     buffer dw 2301h,2302h,3200h
data ends

code segment
start:
     mov ax,data
     mov ds,ax;ds->data
     mov cx,3;loopCount
     mov si,0;pointr
  s:
     push cx
 s0: mov ax,buffer;ȡ��һ������
     cmp ax,buffer+si
     jnc one
     xchg ax,buffer+si;����
 one:
     loop s0
     pop cx
     loop s
code ends

end start

