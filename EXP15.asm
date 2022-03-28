; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.STACK 100H

.DATA    
     NUM DB ?   
     CUBE DB ?
     MSG1 DB 10,13,"ENTER THE NUMBER: $" 
     MSG2 DB 10,13,"THE RESULT IS:$"
.CODE
   SQUR PROC
      MOV AX,@DATA
      MOV DS,AX      
      
      ;============== TAKING INPUT ===================
      
      MOV DX,OFFSET MSG1
      MOV AH,09H
      INT 21H  
      
      MOV AH,01H    ;Take character input from STDIN
      INT 21H  
      SUB AL,30H
      MOV NUM,AL      
      
      ;============== CUBING =======================
      MOV AL,NUM
      MUL AL
      MOV BL,AL
      MOV AL,NUM
      MUL BL
      AAM
      
      ADD AL,30H
      ADD AH,30H
      
      MOV BX,AX
                 
      ;============== TO PRINT CUBE ================
      MOV AH,09H
      MOV DX,OFFSET MSG2     
      INT 21H               ;TO PRINT RESULT MESSAGE
       
      MOV AH,02H
      
      MOV DL,BH
      INT 21H
      
      MOV AH,02H
      MOV DL,BL
      INT 21H
      
      MOV AH,4CH
      INT 21H
      END
ret