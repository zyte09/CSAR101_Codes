.model small
.stack 100h
.data
    input1 db 'Enter three digits: $'
    input2 db 'Enter one digits: $'
    output db 'Your digits are: $'
    newline db 0ah,0dh,'$'
    
    user1 db ?
    user2 db ?
    user3 db ?
    user4 db ?
    result db ?

.code
start:
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,input1
    int 21h
    
    mov ah,01h ;1st digit
    int 21h
    sub al,'0' ;convert ascii to digit
    mov user1,al
    
    mov ah,01h ;2nd digit
    int 21h
    sub al,'0'
    mov user2,al
    
    mov ah,01h ;3rd digit
    int 21h
    sub al,'0'
    mov user3,al
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,09h
    lea dx,input2
    int 21h
    
    mov ah,01h ;4th digit
    int 21h
    sub al,'0'
    mov user4,al
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov result,0
    
    mov al,user3
    add al,user4
    cmp al,2
    jb no_result1 ; 2 < 0, no result
    sub al,2 ;to 0
    mov result,1  ;set to 1
    jmp done1
no_result1:
    mov result,0
done1:
    mov user3,al ;store to right
    
    mov al,user2
    add al,result
    cmp al,2
    jb no_result2 ;2 < 0, no result
    sub al,2 ;to 0
    mov result,1
    jmp done2
no_result2:
    mov result,0
done2:
    mov user2,al ;store to middle
    
    mov al,user1
    add al,result 
    cmp al,2
    jb no_result3 
    sub al,2
    mov result,1
    jmp done3
no_result3:
    mov result,0
done3:
    mov user1,al ;store to left
    
    mov ah,09h
    lea dx,output
    int 21h
    
    cmp result,1
    jne skip ;if not equal, skip 
    mov dl,'1'
    mov ah,02h
    int 21h

skip:
    mov dl,user1  ;1st digit
    add dl,'0' ;convert ascii to digit
    mov ah,02h
    int 21h
    
    mov dl,user2 ;2nd digit
    add dl,'0' ;convert ascii to digit
    mov ah,02h
    int 21h
    
    mov dl,user3 ;3rd digit
    add dl,'0' ;convert ascii to digit
    mov ah,02h
    int 21h

    mov ah,09h
    lea dx,newline
    int 21h

mov ah,4ch
int 21h 
end start