DATAS SEGMENT
    ;�˴��������ݶδ���  
    DB 'Welcome to masm!'
    DB 02H,24H,71H
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
    DW 8 DUP(0);ջ�ռ�
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    MOV AX,STACKS
    MOV SS,AX
    MOV SP,10H;����ջ��
    
    MOV BX,0 ;������ɫ
    MOV AX,0B872H ;�Դ�λ��
    
    MOV CX,3   ;��ѭ��
    
S3:
   push cx ;����ѭ��������
   push ax ;�����Դ��ַ
     
   mov es,ax ;���Դ��ַ�������Ӷ�
   mov si,0
   mov di,0
   mov cx,10h ;��Ϊ�ַ���16���������︳ֵΪ10h
   
S2:
  MOV al,ds:[di]
  mov es:[si],al
  ;���������������ݶ��е��ַ�һһ�����Ƶ��Դ��ż��λ
  inc di
  add si,2
  loop S2
   
  MOV si,1
 
  MOV AL,10H[BX]
  INC BX
  mov cx,10h
   
S1:
  MOV ES:[SI],AL
  ;����ɫ���Ƶ��Դ������λ
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

