.MODEL SMALL
.DATA
     NUM1 DB 93H
     NUM2 DB 23H
     MSG DB "EQUAL$"
     MSG1 DB "LESS THAN $"
     MSG2 DB "GREATER THAN$"

.CODE
     MOV AX,@DATA
     MOV DS,AX
     MOV AH,NUM1
     MOV CH,NUM2
     CMP AH,CH
     JE L1  ;If AH and CH are equal
     JB L2  ;If AH is less than CH
     JA L3  ;If AH is greater than CH
L1:
     MOV DX,OFFSET MSG
     MOV AH,09H  ; print the msg STDOUT
     INT 21H
     RET

L2:
     MOV DX,OFFSET MSG1
     MOV AH,09H
     INT 21H
     RET               

L3:
     MOV DX,OFFSET MSG2
     MOV AH,09H
     INT 21H
     RET
END