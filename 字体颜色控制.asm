DATAS SEGMENT
    ;此处输入数据段代码  
    DB 'Welcome to masm!'
    DB 02H,24H,71H
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
    DW 8 DUP(0);栈空间
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    MOV AX,STACKS
    MOV SS,AX
    MOV SP,10H;设置栈顶
    
    MOV BX,0 ;控制颜色
    MOV AX,0B872H ;显存位置
    
    MOV CX,3   ;外循环
    
S3:
   push cx ;多重循环处理方法
   push ax ;保存显存地址
     
   mov es,ax ;将显存地址赋给附加段
   mov si,0
   mov di,0
   mov cx,10h ;因为字符有16个所以这里赋值为10h
   
S2:
  MOV al,ds:[di]
  mov es:[si],al
  ;上面这两步将数据段中的字符一一给复制到显存的偶数位
  inc di
  add si,2
  loop S2
   
  MOV si,1
 
  MOV AL,10H[BX]
  INC BX
  mov cx,10h
   
S1:
  MOV ES:[SI],AL
  ;将颜色复制到显存的奇数位
  ADD SI,2
  loop S1
  
   POP AX
   ADD AX,0AH
   POP CX
   LOOP S3
    
   MOV AH,4CH
   INT 21H  
   
CODES ENDS
    END START

