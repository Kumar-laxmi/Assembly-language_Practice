.MODEL LARGE
.DATA
 N1 DB "ENTER FIRST NUMBER: $"
 N2 DB "ENTER SECOND NUMBER: $"
 MSG1 DB "NUMBERS ARE EQUAL$"
 MSG2 DB "NUMBERS ARE NOT EQUAL$"
.CODE
 MOV AX,@DATA
 MOV DS,AX
 MOV AH,09H
 MOV DX,OFFSET N1
 INT 21H
 
 MOV AH,01H
 INT 21H
 MOV BL,AL
 
 MOV AH,09H
 MOV DX,OFFSET N2
 INT 21H
 
 MOV AH,01H
 INT 21H
 MOV CL,AL
 
 CMP BL,CL
 JE EQ1
 MOV AH,09H
 MOV DX,OFFSET MSG2
 INT 21H
 JMP EXIT
 
EQ1:
 MOV AH,09H
 MOV DX,OFFSET MSG1
 INT 21H
EXIT:
 MOV AH,4CH
 INT 21H
 END
