.model small
.stack 100h
.data
    input1 db 'Enter three digits: $'
    input2 db 'Enter one digit: $'
    output db 'Result: $'
    newline db 0ah,0dh,'$'
    
    user1 db ?
    user2 db ?
    user3 db ?
    user4 db ?
    borrow db ?
.code
start: 
    mov ax,@data
    mov ds,ax
    
    mov ah,09h 
    lea dx,input1
    int 21h
    
    ; Read first binary digit
    mov ah,01h
    int 21h
    sub al,'0' ; convert ascii to digit
    mov user1,al
    
    ; Read second binary digit
    mov ah,01h
    int 21h
    sub al,'0'
    mov user2,al
    
    ; Read third binary digit
    mov ah,01h
    int 21h
    sub al,'0'
    mov user3,al
    
    ; Newline
    mov ah,09h
    lea dx,newline
    int 21h
    
    ; Prompt for one binary digit
    mov ah,09h
    lea dx,input2
    int 21h
    
    ; Read fourth binary digit
    mov ah,01h
    int 21h
    sub al,'0'
    mov user4,al
    
    ; Newline
    mov ah,09h
    lea dx,newline
    int 21h
    
    ; Initialize borrow to 0
    mov borrow,0
    
    ; Subtract user4 from user3
    mov al,user3
    sub al,user4
    jnb no_borrow1  ;if AL >= 0, no burrow
    add al,2     ; if borrow, add 2
    mov borrow,1 ; set to 1 if borrow
    jmp done1 
no_borrow1:
    mov borrow,0   ;no borrow set to 0
done1:  
    mov user3,al
    
    ; Subtract borrow from user2
    mov al,user2
    sub al,borrow
    jnb no_borrow2 ;if AL < 0
    add al,2
    mov borrow,1
    jmp done2
no_borrow2:
    mov borrow,0
done2:
    mov user2,al
    
    ; Subtract borrow from user1
    mov al,user1
    sub al,borrow
    jnb no_borrow3
    add al,2
    mov borrow,1
    jmp done3
no_borrow3:
    mov borrow,0
done3:
    mov user1,al
    
    ; Display result
    mov ah,09h
    lea dx,output
    int 21h
    
    ; Display user1
    mov dl,user1
    add dl,'0'
    mov ah,02h
    int 21h
    
    ; Display user2
    mov dl,user2
    add dl,'0'
    mov ah,02h
    int 21h
    
    ; Display user3
    mov dl,user3
    add dl,'0'
    mov ah,02h
    int 21h
    
    ; Newline
    mov ah,09h
    lea dx,newline
    int 21h
    
    ; Terminate program
    mov ah,4Ch
    int 21h
end start