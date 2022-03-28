.model small
 
.data
   num1 db 08h
   num2 db 02h
   sum db 00
 
.code
start:    
       mov AX,@data
       mov DS,AX
       mov AL,num1
       add AL,num2
       mov sum,AL
       mov AH,4ch
       int 21H
       end start
end



