
include 'emu8086.inc'
 
.model small

.data
   a1 db 5,2,5,6,2
   a2 db 1,2,1,2,6
   result db 0,0,0,0,0
   
.code               
   
   mov ax,@data
   mov ds,ax
   
   mov si,offset a1 
   mov di,offset a2   
   
   mov cx,5  
   addloop:
      mov dl,[si]
      add dl,[di]
      mov [si],dl
      inc si
      inc di
      loop addloop
   
   
   mov si,offset a1
   mov di,offset result
             

   mov cx,5    
   moving:  
      mov dl,[si]
      mov [di],dl
      inc si
      inc di
      loop moving
             
             
   mov si,offset result          
   
   
   mov cx,5
   print 'Final array: '
   printing:
        MOV dl,[si]
        add dl,48  
        
        mov ah,02h
        int 21h
        
        mov dl,32
        mov ah,02h
        int 21h 
         
        INC si
          
      loop printing
   
   mov ah,4ch
   int 21h
   ret

