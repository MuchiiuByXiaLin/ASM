DISP_STR MACRO X ;宏定义.
MOV DX, OFFSET X
MOV AH, 9
INT 21H
ENDM
;----------------------
DATA SEGMENT ;数据段.
MSG1 DB 13, 10, 'Please Input : $'
MSG3 DB 13, 10, 'The HEX is : $'
x DW ? ;存放新输入数据.
DATA ENDS
;----------------------
CODE SEGMENT ;代码段.
ASSUME CS: CODE, DS: DATA
START:
MOV AX, DATA
MOV DS, AX
;--------------------------------
IN_LOOP:
DISP_STR MSG1 ;宏调用，提示 Please Input :
;--------------------------------
MOV x, 0 ;数据清零.
_INX:
MOV AH, 1 ;输入字符.
INT 21H
;--------------------------------
CMP AL, 13 ;回车?
JE _IN_END ;是则结束输入.

CMP AL, '0'
JB IN_LOOP ;小于'0'，不是数字.
CMP AL, '9'
JA IN_LOOP ;大于'9'，不是数字.

SUB AL, '0'
MOV CL, AL
MOV CH, 0

MOV AX, x
MOV BX, 10 ;老数据乘以10
MUL BX
ADD AX, CX ;加上新数据.
MOV x, AX ;保存.
CMP AX, 99
JA IN_LOOP
JMP _INX
;--------------------------------
_IN_END:
DISP_STR MSG3 ;宏调用，提示 The HEX is :
MOV AX, x
MOV BX, 16
MOV CX, 0
D_1:MOV DX, 0
DIV BX
ADD DL, '0'
CMP DL, 3AH
JB ZZZ
ADD DL, 7
ZZZ:
PUSH DX
INC CX
CMP AX, 0
JNE D_1
MOV AH, 2
D_2:POP DX
INT 21H
LOOP D_2
;--------------------------------
MOV AH, 4CH
INT 21H
;--------------------------------
CODE ENDS
END START
;===================== 

