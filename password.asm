.model small
.stack 100h
.data
    msg db 'Enter your password: $'
    output db 'Your password is: $'
    newline db 0ah,0dh,'$'
    
    input1 db ?
    input2 db ?
    input3 db ?

.code
start:
    mov ax,@data
    mov ds,ax
    
    mov ah,09h ;print string
    lea dx,msg
    int 21h
    
    mov ah,07h ;nahingi input
    int 21h
    
    mov input1,al ;para hindi maoverride
    
    mov ah,02h ;print character
    mov dl,'*' 
    int 21h
    
    mov ah,07h ;nahingi input
    int 21h
    
    mov input2,al ;para hindi maoverride
    
    mov ah,02h ;print character
    mov dl,'*' 
    int 21h
    
    mov ah,07h ;nahingi input
    int 21h
    
    mov input3,al ;para hindi maoverride
    
    mov ah,02h ;print character
    mov dl,'*' 
    int 21h
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,09h
    lea dx,output
    int 21h
    
    mov dl,input1 ;display character
    mov ah,02h
    int 21h
    
    mov dl,input2  ;display character
    mov ah,02h
    int 21h
    
    mov dl,input3  ;display character
    mov ah,02h
    int 21h
    
    
 mov ah,4ch
 int 21h
 
end start