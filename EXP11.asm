; Write a ASP to add two numbers
ORG 100H

.DATA
     C1 DB "ENTER FIRST CHARACTER:$"
     C2 DB 10D,"ENTER SECOND CHARACTER:$" 
     MSG DB 10D,"THE RESULT IS:$"         

.CODE  
     MOV AX,@DATA
     MOV DS,AX
     MOV AH,09H
     MOV DX,OFFSET C1
     INT 21H     ;READ CHAR FROM KEYBOARD   
     
     MOV AH,01H
     INT 21H
     MOV BL,AL   ;STORE CHAR IN BL  

     
     MOV AH,09H
     MOV DX,OFFSET C2     
     INT 21H
     
     MOV AH,01H 
     INT 21H     ;READ CHAR FROM KEYBOARD
     MOV CL,AL   ;STORE CHAR IN CL    
     
     MOV AH,09H
     MOV DX,OFFSET MSG
     INT 21H
     
     SUB BL,30H  ;CONVERT CHAR TO NUMBER
     SUB CL,30H  ;CONVERT CHAR TO NUMBER
     
     ADD BL,CL   ;ADD BOTH NUMBERS TOGETHER  
     ADD BL,30H  ;CONVERT NUMBER TO CHARACTER    
     MOV DL,BL   
     MOV AH,02H
     INT 21H
           
     MOV AH,4CH
     INT 21H     ; DISPLAY RESULT
RET



