.MODEL SMALL

.DATA

.CODE
   MOV AX,5000H
   MOV DS,AX
   MOV SI,1000H
   MOV AX,[SI]
   MOV BX,[SI+2]

   MOV CX,AX
   MOV AX,BX
   MOV BX,CX

   MOV [SI+4],AX
   MOV [SI+6],BX
   HLT
END
