include 'emu8086.inc'

.STACK 100H

.MODEL SMALL

.DATA
   ARR DB 10 DUB(?)
   MSG1 DB 10,13,"ENTER THE 10 NUMBERS WITHOUT SPACE: $"
   MSG2

.CODE
   MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV CX,10
        MOV SI,OFFSET ARR
        
        PRINT 'ENTER 10 VALUES: '
        
        INPUT:
            MOV AH,01H
            INT 21H
            
            MOV [SI],AL
            INC SI         ;i++
            LOOP INPUT         
        
        MOV DL,10
        MOV AH,02H
        INT 21H
        
        MOV DL,13
        MOV AH,02H
        INT 21H
        
        PRINT 'VALUES IN ARRAY: '
        
        MOV SI,OFFSET ARR
        MOV CX,10
        
        OUTPUT:
            MOV DL,[SI]
            MOV AH,02H
            INT 21H
            
            MOV DL,32
            MOV AH,02H
            INT 21H
            
            INC SI
            LOOP OUTPUT
    
   MAIN ENDP
END MAIN
