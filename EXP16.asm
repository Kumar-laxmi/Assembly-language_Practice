.MODEL SMALL


.DATA  
   NUM1 DB ?
   NUM2 DB ?
   
   MSG1 DB 10,13,"ENTER THE FIRST NUMBER: $"
   MSG2 DB 10,13,"ENTER THE SECOND NUMBER: $" 
   
   AND_OP DB 10,13,"RESULT OF AND OPERATION: $"  
   OR_OP DB 10,13,"RESULT OF OR OPERATION: $"     
  

.CODE
   MOV AX,@DATA
   MOV DS,AX       
   
   ;======== GETTING FIRST INPUT ===================
   MOV AH,09H
   MOV DX,OFFSET MSG1
   INT 21H           ;READ N1 CHARACTER
   
   MOV AH,01H
   INT 21H
   SUB AL,30H        ;CONVERT N1 CHARACTER TO INTEGER IN BL
   MOV NUM1,AL     
   
   ;======== GETTING SECOND INPUT ===================
   MOV AH,09H
   MOV DX,OFFSET MSG2
   INT 21H           ;READ N2 CHARACTER
   
   MOV AH,01H
   INT 21H           
   SUB AL,30H        ;CONVERT N2 CHARACTER TO INTEGER IN AL     
   MOV NUM2,AL
   
   ;======== TO PERFORM AND OPERATION ===============
   MOV AL,NUM1
   MOV AH,NUM2
   
   AND AH,AL
   MOV AL,AH
   ADD AL,30H
   MOV BL,AL    
   
   MOV AH,09H
   MOV DX,OFFSET AND_OP
   INT 21H
   MOV AH,02H
   MOV DL,BL
   INT 21H
   
   ;======== TO PERFORM OR OPERATION ===============
   MOV AL,NUM1
   MOV AH,NUM2
   
   OR AH,AL
   MOV AL,AH
   ADD AL,30H
   MOV BL,AL    
   
   MOV AH,09H
   MOV DX,OFFSET OR_OP
   INT 21H
   MOV AH,02H
   MOV DL,BL
   INT 21H
   
END




