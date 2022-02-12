.model small
.data
.code

start:
        MOV AL,0
        MOV BX,0200H
        ADD AL,[BX]
        INC BX           ;same as "ADD BX,1"
        ADD AL,[BX]
        INC BX
        ADD AL,[BX]
        INC BX
        ADD AL,[BX]
        mov AH,4ch
        int 21h
        end start
end
