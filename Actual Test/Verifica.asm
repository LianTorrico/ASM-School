.MODEL SMALL
.STACK 100h
.DATA
    DATI DB ?,?,?,?,?,?,"$"
    DATIOUTPUT DB ?,?,?,?,?,?,"$"
.CODE
.STARTUP

    MOV CX, 6  ;Inizializza il contatore LOOP
    MOV BX, 0  ;Pulisce i registri (In una macchina normale e' possibile che i registri siano gia stati utilizzati, questa istruzione in un computer normale si presenterebbe dopo 7C00, ovvero l'avvio del sistema)
    MOV AX, 0
    MOV SI, 0
   
   inserimento:
   MOV AH, 01H ;Input 
   INT 21H
   
   CMP AL, 41H ;Controlla se l'Input e' A (inizio delle lettere maiuscole)
   JGE Maggiore1
   MOV AH, 0  
   PUSH AX ;Immagazzina AL (AH e' stato svuotato)
   MOV DATI[SI], AL ;Immagazzina AL nell'array
   INC SI ;Aumento contatore
   ritorno:
   LOOP inserimento
   MOV CX, 6  ;Valori dedicati al prossimo jump (ciclo LOOP)
   MOV SI, 0  ;Reset del contatore per immagazzinare i valori di AL al contrario
   JMP FINE
  
   Maggiore1:
   CMP AL, 61H     ;41 sarebbe A, 61 sarebbe a, cosi controlliamo se e una lettera maiuscola
   JL Maggiore2
   MOV AH, 0
   PUSH AX
   JMP ritorno ;Salta al loop per cambiare il val di CX, per motivi di ottimizzazione e flessibilita' usiamo il jump al posto di cambiarlo manualmente
   
   Maggiore2:
   MOV AL, "*" ;Rimpiazza le lettere maiuscole con *
   MOV AH, 0
   PUSH AX
   JMP ritorno
   
   FINE:
   POP AX
   MOV DATIOUTPUT[SI], AL ;Immagazzino i valori gia inseriti in precedenza al contrario
   INC SI      
   LOOP FINE
   
   outputfinale:       ;Riporta l'array al contrario come output
   MOV DX, offset DATIOUTPUT
   MOV AH, 09H
   INT 21H
    
   .EXIT
     