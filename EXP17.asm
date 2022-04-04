org 100h

.MODEL SMALL
.DATA

num1 DB 5 DUP (0)
num2 DB 5 DUP (0)
                 
msg1 DB 10,13,10H,"Enter Values of Array1 : $"
msg2 DB 10,13,10H,"Enter Values of Array2 : $"
msg3 DB 10,13,10H,"Sum of Array : $"

.CODE
MOV AX,@DATA
MOV DS,AX

MOV CX,5

MOV DX,OFFSET msg1
MOV AH,09H
INT 21H

MOV SI,OFFSET num1
L1:
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV [SI],AL
    
    INC SI
    
    LOOP L1

MOV CX,5

MOV DX,OFFSET msg2
MOV AH,09H
INT 21H

MOV SI,OFFSET num2
L2:
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV [SI],AL
    
    INC SI
    
    LOOP L2

LEA SI,num1
LEA DI,num2
 
MOV CX,5

MOV AH,09H
MOV DX,OFFSET msg3
INT 21H

L3:MOV AL,[SI]
   ADD AL,[DI]
   
   ADD AL,30H
   MOV BL,AL 
   
   MOV AH,02H
   MOV DL,BL
   INT 21H
   
   INC SI
   INC DI
   
   LOOP L3
   
   END

ret