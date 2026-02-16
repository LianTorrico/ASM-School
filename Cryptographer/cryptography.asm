.MODEL SMALL
.STACK 100H
.DATA

BUFFER db ?,?,?,?,?,?,?,"$"
messaggio db 0AH,0DH,"CODICE PULITO: ","$"
.CODE
.STARTUP  ;La prego di non chiedermi di controllarlo
          ;In quanto a me stesso risulta illeggibile e confusorio
          ;Pero funziona

MOV CX, 6
MOV SI, 0
input1:    
MOV AH, 01H
INT 21H
INC AL
MOV BUFFER[SI], AL
LOOP input
MOV DX, offset BUFFER
MOV AH, 09H
INT 21H


.EXIT
