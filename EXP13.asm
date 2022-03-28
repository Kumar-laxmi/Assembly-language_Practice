
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.STACK 100H

.DATA
   NUM1 DB ?
   NUM2 DB ?
   QUO DB ?
   REM DB ?
   
   MSG1 DB 10,13,"ENTER THE DIVIDENT: $"
   MSG2 DB 10,13,"ENTER THE DIVISOR: $"
   MSG3 DB 10,13,"THE QUOTIENT IS: $" 
   MSG4 DB 10,13,"THE REMAINDER IS: $" 

.CODE 
   DIVISION PROC
      MOV AX,@DATA
      MOV DS,AX   
      
      ;======== GETTING FIRST INPUT ===================
      MOV DX,OFFSET MSG1
      MOV AH,09H        ;Write string to STDOUT
      INT 21H
      
      MOV AH,01H        ;Read character from STDIN
      INT 21H
      SUB AL,30H
      MOV NUM1,AL 
      
      ;======== GETTING SECOND INPUT ===================
      MOV DX,OFFSET MSG2
      MOV AH,09H        ;Write string to STDOUT
      INT 21H
      
      MOV AH,01H        ;Read character from STDIN
      INT 21H
      SUB AL,30H
      MOV NUM2,AL  
      
      ;======== PERFORM DIVISION OPERATION =============
      MOV AL,NUM1
      MOV AH,0
      DIV NUM2
      MOV QUO,AL
      MOV REM,AH
      
      ;======== TO PRINT THE RESULT ====================
      MOV AH,09H
      MOV DX,OFFSET MSG3
      INT 21H
      
      MOV AH,02H
      MOV BL, QUO
      ADD BL,30H
      MOV DL,BL
      INT 21H  
      
      
      MOV AH,09H
      MOV DX,OFFSET MSG4
      INT 21H
      
      MOV AH,02H
      MOV BL, REM
      ADD BL,30H
      MOV DL,BL
      INT 21H
      
ret




