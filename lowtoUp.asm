;Enter four small letters: cdab
;Converted to big letters: CDAB

.model small
.stack 100h
.data
    msg db "Enter four small letters: $" 
    output db "Converted to big letters: $"
    newline db 0ah,0dh,'$'
    
    input1 db ?
    input2 db ?
    input3 db ?
    input4 db ?
    
.code
start:
    mov ax,@data
    mov ds,ax
    
    mov ah,09h ;display
    lea dx,msg
    int 21h
    
    mov ah,01h ;input1
    int 21h
    mov input1,al
    
    mov ah,01h ;input2
    int 21h
    
    mov input2,al
    
    mov ah,01h ;input3
    int 21h
    
    mov input3,al
    
    mov ah,01h ;input4
    int 21h
    
    mov input4,al
    
    SUB input1,32  ;97(a) - 65(A) = 32 
    SUB input2,32  ;98(b) - 66(B) = 32
    SUB input3,32  ;or 20h 
    SUB input4,32

    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,09h
    lea dx,output
    int 21h
    
    mov dl,input1 ;display character
    mov ah,02h
    int 21h
    
    mov dl,input2 ;display character
    mov ah,02h
    int 21h
    
    mov dl,input3 ;display character
    mov ah,02h
    int 21h

    mov dl,input4 ;display character
    mov ah,02h
    int 21h

    
 mov ah,4ch
 int 21h
 
end start