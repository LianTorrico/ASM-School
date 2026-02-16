.MODEL SMALL
.STACK 100H
.DATA

stringavuota db ?,?,?,?,?,?,?,"$"
messaggio db 0AH,0DH,"CODICE PULITO: ","$"
.CODE
.STARTUP  ;La prego di non chiedermi di controllarlo
          ;In quanto a me stesso risulta illeggibile e confusorio
          ;Pero funziona

MOV CX, 7
MOV SI, 0
input1:
MOV BL, 30H    
MOV AH, 01H
INT 21H
CMP AL, BL
JGE controllo1
JMP inizio1
                 ;41 - 5A Maiuscole
                 ;61 - 7A Minuscole (122H)
controllo1:
MOV BL, 39H
CMP AL, BL
JG inizio1
ADD stringavuota[SI], '-'
INC SI
jmp ritornoloop
        
         
                                                                                      
inizio1:
MOV BL, 61H
CMP AL, BL
JGE conversione1
JMP inizio2
inizio2:
ADD stringavuota[SI], AL
INC SI 
jmp ritornoloop


conversione1:
MOV BL, 7Ah
CMP AL, BL
JGE inizio2
SUB AL, 20H
ADD stringavuota[SI], AL
INC SI
jmp ritornoloop

ritornoloop:
LOOP input1

MOV DX, offset messaggio
MOV AH, 09H
INT 21H

MOV DX, offset stringavuota
MOV AH, 09H
INT 21H
                
.EXIT