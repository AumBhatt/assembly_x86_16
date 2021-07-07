;ml /Bl link16.exe p1.asm
.model small
.stack 20
.data
    msg db "Hello World (in text video mode)$"
.code
start:
    mov ax, @data
    mov ds, ax
; Video Mode (Text)
    mov ah, 00
    mov al, 12h
    int 10h
; Video Page No.
    mov bh, 0
; Funcn Code for Setting Cursor Position
    mov ah, 02h
; row
    mov dh, 12
; column
    mov dl, 20
    int 10h
; Display Msg using string print cmd
    lea dx, msg
    mov ah, 09
    int 21h
; move cursor to end of screen
    mov ax, 0
    mov ah, 02
    mov bh, 0
    mov dh, 24
    mov dl, 78
    int 10h
    mov dl, "@"
    mov ah, 02h
    int 21h
    mov ah, 01h
    int 21h

; exit
    mov ah, 4ch
    int 21h
end start