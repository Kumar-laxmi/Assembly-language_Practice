.MODEL SMALL
 
.DATA
 
.CODE
   MOV AX,5000H
   MOV DS,AX
   MOV SI,1000H
   MOV AX,[SI]
   MOV BX,[SI+2]
   ADD AX,BX                                                  ;AX = AX + BX  (10,20)+(30,40)
   MOV [SI+4],AX
   HLT
END


