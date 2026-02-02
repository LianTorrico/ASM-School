.MODEL SMALL
.STACK 100H


.DATA

    nuovalinea DB 0AH,0DH,"$"

.CODE


.STARTUP

                ;Leggiamo carattere dell'utente

MOV AH, 01H

INT 21H

PUSH AX         ;Salva nello stack un valore AX che e' formato da AH e AL

                ;Leggiamo secondo carattere                
MOV AH, 01H

INT 21H

PUSH AX
 
MOV AH, 01H

INT 21H

PUSH AX

MOV AH, 01H

INT 21H

PUSH AX

;Fine input
MOV DX, offset nuovalinea
MOV AH, 09H
INT 21H


POP AX
MOV DL, AL
MOV AH, 02H
INT 21H

POP AX
MOV DL, AL
MOV AH, 02H
INT 21H

POP AX
MOV DL, AL
MOV AH, 02H
INT 21H

POP AX
MOV DL, AL
MOV AH, 02H
INT 21H



.EXIT