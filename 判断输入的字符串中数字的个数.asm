DISP_STR MACRO X ;�궨��.
MOV DX, OFFSET X
MOV AH, 9
INT 21H
ENDM
;----------------------
DATA SEGMENT ;���ݶ�.
MSG1 DB 13, 10, 'Please Input : $'
MSG3 DB 13, 10, 'The HEX is : $'
x DW ? ;�������������.
DATA ENDS
;----------------------
CODE SEGMENT ;�����.
ASSUME CS: CODE, DS: DATA
START:
MOV AX, DATA
MOV DS, AX
;--------------------------------
IN_LOOP:
DISP_STR MSG1 ;����ã���ʾ Please Input :
;--------------------------------
MOV x, 0 ;��������.
_INX:
MOV AH, 1 ;�����ַ�.
INT 21H
;--------------------------------
CMP AL, 13 ;�س�?
JE _IN_END ;�����������.

CMP AL, '0'
JB IN_LOOP ;С��'0'����������.
CMP AL, '9'
JA IN_LOOP ;����'9'����������.

SUB AL, '0'
MOV CL, AL
MOV CH, 0

MOV AX, x
MOV BX, 10 ;�����ݳ���10
MUL BX
ADD AX, CX ;����������.
MOV x, AX ;����.
CMP AX, 99
JA IN_LOOP
JMP _INX
;--------------------------------
_IN_END:
DISP_STR MSG3 ;����ã���ʾ The HEX is :
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

