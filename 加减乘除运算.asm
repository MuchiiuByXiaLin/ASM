;�������±��ʽ��ֵ:(X*Y+Z-1024)/75
;�������е�X,Y��Z��Ϊ16λ��������
;�ֱ�������ΪXXX,YYY��ZZZ�ı�����Ԫ��
;�ټ�����������̴����AX��,����������DX��
assume cs:abc

abc segment
    str dw 'ad'
    xxx dw 1234h
    yyy dw 2345h
    zzz dw 3456h;����xxx,yyy,zzz�ֱ���
    
    mov ax,xxx
    imul yyy;����x*y(16λ,���Ϊ32λ��AX��ŵ�16λ,DX��Ÿ�16λ)
    mov cx,ax
    mov bx,dx;��������BX:CX��
    
    mov ax,zzz
    cwd;��չzΪ32λ
    
    add ax,cx
    adc dx,bx;����X*Y-Z(��λ������,��λ����λ����)
    
    sub ax,1024
    sbb dx,0;������
    
    mov cx,75
    idiv cx;�������̺�����
    
    mov ax,4c00h
    int 21h
abc ends

end   
