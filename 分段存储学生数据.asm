;设有10个学生的乘积分别为76,69,88,99,63,100,88,65,93,87
;编写一个子程序分别统计0-69分,70-79分,80-89,90-99,及100分的人数
;分别存放到S6,S7,S8,S9,S10单元中 

assume ds:data,cs:code
         
data segment
      db 76,69,88,99,63,100,88,65,93,87
   S6 db 0
   S7 db 0
   S8 db 0
   S9 db 0
  S10 db 0
    
data ends         
 
code segment
start:
     mov ax,data
     mov ds,ax;设置数据段
     mov cx,10;10个学生，循环10次
     mov di,0;目的指针
     call student
     
     mov ax,4c00h
     int 21h
     ;程序功能:统计学生分数区间分布情况
     ;入口参数:cx=10,di=0
     ;出口参数:S6,S7,S8,S9,S10字节单元
student:
     cmp ds:[di],100
     je sb1        ;100
     cmp ds:[di],69
     jb sb2        ;0-69
     cmp ds:[di],79
     jb sb3        ;70-79
     cmp ds:[di],89
     jb sb4        ;80-89
     cmp ds:[di],99
     jb sb5        ;90-99
 sb1:
     inc S10
     inc di
     loop student
     ret
 sb2:
     inc S6
     inc di 
     loop student 
     ret
 sb3:
     inc S7 
     inc di 
     loop student 
     ret
 sb4:
     inc S8
     inc di 
     loop student
     ret
 sb5:
     inc S9
     inc di 
     loop student
     ret
code ends

end start