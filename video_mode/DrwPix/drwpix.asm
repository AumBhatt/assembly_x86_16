;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;   Drawing Pixel in 13h Video Mode     ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;       Resolution : 320x200            ;
;       Interrupt : 10h                 ;
;       Text Resolution : 40x25         ;
;       Pixel Box : 8x8                 ;
;                       ~ Aum Bhatt     ;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
.model small
.stack 20
.code
start:
    mov ax, @data
    mov ds, ax
    
; Set 13h Graphics mode 
    mov ah, 00h ; Function code for setting video mode
    mov al, 13h ; 13h Graphics mode
    mov bh, 00h ; Select Page 0
    int 10h

; Drawing Pixel at (159, 99) [Center of the screen]
    mov ah, 0ch ; Write Graphics Pixel
    mov al, 0fh ; Pixel color : 00h (Black) - 0fh (White)
    mov cx, 159d ; cx = x - coordinate (Row)
    mov dx, 99d ; dx = y - coordinate (column)
    int 10h

; Wait for user input to exit
    mov ah, 01h
    int 21h

; Exit to DOS
    mov ah, 4ch
    int 21h
end start