.model small
.stack 100h
.data
    title db 'Add$'
    input1 db 'Enter three digit: $'
    input2 db 'Enter one digit: $'
    output db 'Result: $'
    newline db 0ah,0dh,'$'
    
    user1 db ?
    user2 db ?
    user3 db ? 
    user4 db ?
    carry1 db ?
.code
start: 
    mov ax,@data
    mov ds,ax
    
    mov ah,09h 
    lea dx,title
    int 21h
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,09h 
    lea dx,input1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0' ;convert ascii to digit
    mov user1,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov user2,al
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov user3,al
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,09h
    lea dx,input2
    int 21h
    
    mov ah,01h
    int 21h
    sub al,'0'
    mov user4, al
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov carry1,0 ;set carry to 0
    
    mov al,user3
    add al,user4
    cmp al,2
    jl no_carry1 ; jump if al < 2
    sub al,2      ; If AL >= 2, subtract 2 (to keep the sum 1 or 0)
    mov carry1,1  ; set carry to 1 for carry
    jmp done1
no_carry1:
    mov carry1,0 ;set to 0
done1: 
    mov user3,al ;store to result to user3(rightmost digit)
    
    mov al,user2
    add al,carry1
    cmp al,2
    jl no_carry2 ; jump if al < 2
    sub al, 2     ; If al >= 2, subtract 2 (to keep the sum 1 or 0)
    mov carry1,1
    jmp done2
no_carry2:
    mov carry1,0 ;set to 0 if no carry
done2:
    mov user2,al ;store to middle
    
    mov al,user1
    add al,carry1
    cmp al,2     
    jl no_carry3 ; jump if al < 2
    sub al,2 ; If al >= 2, subtract 2 (to keep the sum 1 or 0)
    mov carry1,1
    jmp done3
no_carry3:
    mov carry1,0 ;set carry to 0
done3:
    mov user1,al ;store to left

    mov ah,09h
    lea dx,output
    int 21h
    
    cmp carry1,1
    jne skip ;if not equal to 1, skip
    mov dl,'1' ;If there's a carry (carry == 1), 
    mov ah,02h  ;it prints 1 before the digits.
    int 21h
    
skip:
    mov dl,user1
    add dl,'0'
    mov ah,02h
    int 21h
    
    mov dl,user2
    add dl,'0'
    mov ah,02h
    int 21h
    
    mov dl,user3
    add dl,'0'
    mov ah,02h
    int 21h
   
mov ah, 4ch
int 21h

end start 