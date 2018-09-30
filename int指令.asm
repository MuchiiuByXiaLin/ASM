;CPU执行int n指令，相当于引发一个n号中断的中断过程，执行如下：
;1：取中断类型码n
;2：标志寄存器入栈，IF=0,TF=0
;3：cs，ip入栈
;4：ip=n*4,cs=n*4+2
;可以在程序中使用int指令调用任何一个中断的中断处理程序
;例如下面的程序:
assume cs:code

code segment
    
start:
     mov ax,0b800h
     mov es,ax
     mov byte ptr es:[12*160+40*2],'!'
     int 0

code ends

end start
;这个程序在DOS方式下执行将会在屏幕中间显示一个！
;然后显示"Divide overflow"后返回系统。"!"是我们变成显示,
;二"Divide overflow"是从哪里来的呢?,我们的程序汇总又没有
;做除法，不可能产生除法移除

;程序是没有做除法，但是咋结尾使用了int 0指令。cpu执行int 0
;指令时，将引发中断过程，而系统设置的0号中断处理程序的
;功能是显示"Divide overflow",然后返回系统