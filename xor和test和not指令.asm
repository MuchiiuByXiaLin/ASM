;xor异或操作，两个操作数的位中，相同则结果为0，不同则结果为1
;test 测试指令
;格式：TEST DEST，SRC
;功能：目的操作数和源操作数按位进行逻辑与操作
;结果不回送目的操作数。源操作数可以为通用寄存器、存储器或立即数。目的操作数可以为通用寄存器或存储器操作数。
;会改变ZF标志位
;not指令，按位取反
assume cs:code

code segment
start:
     mov ax,01010101b
     mov bx,ax
     xor ax,bx 
     
     test al,01000100b;检查al中的第二位和第六位是否有一位为1
     ;如果6和2全为0，则ZF被置1，否则ZF被清0
code ends

end start

