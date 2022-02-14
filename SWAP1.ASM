.MODEL SMALL

.DATA

.CODE
   MOV AX,5000H
   MOV DS,AX
   MOV SI,1000H
   MOV AX,[SI]
   MOV BX,[SI+2]

   MOV [SI],BX
   MOV [SI+2],AX
   HLT
END
