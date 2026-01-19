.MODEL SMALL
 .STACK 100H        ;Dimensione stack
 .DATA              ; Inizializza le variabili
 
 Richiesta DB 'Inserirsci la tua eta (0-9)$'    ;Variabile Iniziale, Il dollaro e la fine della stringa
 
 SogliaMaggiorenne DB '7'
 Maggiorenne DB 'Sei maggiorenne$'
 Minorene DB 'Sei minorenne$'  
 nuovalinea DB 0AH,0DH,"$"
 
 
 .CODE
 
 .STARTUP           ;Inizio programma
                                     
                                     
                                     
 MOV DX, offset Richiesta
 MOV AH, 09H      
 
 INT 21H
 
 MOV AH, 01H ;Input
 INT 21H
 
 CMP AL, SogliaMaggiorenne ;Condizione maggiore di var
 JLE Minorennejmp         ; LE (JMP Less or Equal) 
 JNB Maggiorennejmp       ; NB (JMP !Below)
 
 Minorennejmp:
    MOV DX, offset nuovalinea
    MOV AH, 09H
    INT 21H
    MOV DX, offset Minorene
    MOV AH, 09H
    INT 21H
    JMP uscita   ;Incondizionale
 
 Maggiorennejmp:
    MOV DX, offset nuovalinea
    MOV AH, 09H
    INT 21H
    MOV DX, offset Maggiorenne
    MOV AH, 09H
    INT 21H
    JMP uscita
    
    
    
    
 uscita:      
       
 .EXIT              ;Fine programma