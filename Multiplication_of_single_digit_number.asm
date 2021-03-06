.MODEL LARGE

.DATA
     N1 DB "ENTER FIRST NUMBER:$"
     N2 DB 10D,"ENTER SECOND NUMBER:$" 
     MSG DB 10D,"THE PRODUCT IS:$"
     
.CODE
     MOV AX,@DATA
     MOV DS,AX
     MOV AH,09H
     MOV DX,OFFSET N1
     INT 21H           ;READ N1 CHARACTER
     
     MOV AH,01H
     INT 21H
     MOV BL,AL         ;STORE N1 CHARACTER IN BL
     SUB BL,30H        ;CONVERT N1 CHARACTER TO INTEGER IN BL
     
     MOV AH,09H
     MOV DX,OFFSET N2
     INT 21H           ;READ N2 CHARACTER
                                          
     MOV AH,01H
     INT 21H
     SUB AL,30H        ;CONVERT N2 CHARACTER TO INTEGER IN AL
     
     MUL BL
     AAM                ;ASCII ADJUST AFTER MULTIPLICATION
     ADD AH,30H
     ADD AL,30H
     
     MOV BX,AX
     
     MOV AH,09H
     MOV DX,OFFSET MSG     
     INT 21H               ;TO PRINT RESULT MESSAGE
     
     MOV AH,02H
     MOV DL,BL             ;TO PRINT THE MULTIPLICATION RESULT
     INT 21H
END
