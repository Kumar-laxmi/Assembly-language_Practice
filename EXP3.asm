.model small
 
.data
 
.code
start:
       MOV AL,00H
       ADD AL,25H
       ADD AL,12H
       ADD AL,15H
       ADD AL,1FH
       ADD AL,2BH
       MOV AH,4ch
       int 21h
       end start
end



