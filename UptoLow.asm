.model small
.stack 100h
.data
    input db 'Enter three letters: $'
    output db 'Your letters are: $'
    newline db 0ah,0dh,'$'
    
    input1 db ?
    input2 db ?
    input3 db ?

.code
start:
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, input
    int 21h
    
    ;get input
    mov ah, 01h
    int 21h
    mov input1, al
    
    mov ah, 01h
    int 21h
    mov input2, al
    
    mov ah, 01h
    int 21h
    mov input3, al
    
    ;input1
    mov al, input1
    cmp al, 'A'
    jb check_lower1
    cmp al, 'Z'
    ja check_lower1
    add al, 32
    mov input1, al
    jmp done1

check_lower1:
    cmp al, 'a'
    jb done1
    cmp al, 'z'
    ja done1
    sub al, 32
    mov input1, al

done1:
    ;input2
    mov al, input2
    cmp al, 'A'
    jb check_lower2
    cmp al, 'Z'
    ja check_lower2
    add al, 32
    mov input2, al
    jmp done2

check_lower2:
    cmp al, 'a'
    jb done2
    cmp al, 'z'
    ja done2
    sub al, 32
    mov input2, al

done2:
    ;input3
    mov al, input3
    cmp al, 'A'
    jb check_lower3
    cmp al, 'Z'
    ja check_lower3
    add al, 32
    mov input3, al
    jmp done3

check_lower3:
    cmp al, 'a'
    jb done3
    cmp al, 'z'
    ja done3
    sub al, 32
    mov input3, al

done3:
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, output
    int 21h
   
    ;display letters
    mov dl, input1
    mov ah, 02h
    int 21h
    
    mov dl, input2
    mov ah, 02h
    int 21h
    
    mov dl, input3
    mov ah, 02h
    int 21h
    
mov ah, 4Ch
int 21h

end start
