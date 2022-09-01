.MODEL SMALL
.DATA
.CODE
    MAIN PROC
;ALFABETO DE A Z
;PART 1 LETRAS DE A ATE J
        MOV CL, 0       ;CONTADOR COMEÇA EM 0
        MOV DL, 97      ;DL RECEBE O CARACTER A  
        MOV AH, 02      ;AH RECEBE A FUNÇÃO 02
        VOLTA:          ;LOOP QUE PRINTA DE A ATE J
            INT 21H     ;CHAMA A FUNÇÃO QUE PRINTA O QUE ESTÁ EM DL
            MOV BL, DL  ;BL GUARDA O VALOR DE DL
            MOV DL, 10  ;DL RECEBE ENTER
            INT 21H     ;PRINTA O QUE ESTÁ DL    
            MOV DL, BL  ;DL RECEBE SEU VALOR DE VOLTA
            ADD DL, 1   ;DL SOMA 1
            ADD BL, 1   ;BL SOMA 1
            INC CL      ;FUNCAO PARA SOMA DE +1 COMO UM I++ EM C
            CMP CL, 10  ;COMPARA CL ATÉ FOR IGUAL A 10
            JNZ VOLTA   ;CASO NÃO CL NÃO SEJA IGUAL A 10 FAZ A FUNÇÃO VOLTA
        MOV AH, 07      ;AH RECEBE A FUNÇÃO 07
        INT 21H         ;CHAMA A FUNÇÃO QUE LE UM CARACTER, NESSE CASO COM A INTENÇÃO DE DEIXAR DEIXAR O CÓDIGO VISUALMENTE MELHOR
        MOV DL, BL      ;DL RECEBE SEU VALOR DE VOLTA
        
        
;PART 2 LETRAS DE K ATE T        
        MOV AH, 02      ;AH RECEBE A FUNÇÃO 02
        MOV CL, 0       ;RESETA O CONTADOR
        RESET:         ;REPETE UM LOOP PARECIDO COM VOLTA, PRINTANDO AS LETRAS DE K A T
            INT 21H
            MOV BL, DL
            MOV DL, 10
            INT 21H
            MOV DL, BL
            ADD DL, 1
            ADD BL, 1
            INC CL
            CMP CL, 10 
            JNZ RESET
         MOV AH, 07
         INT 21H
         MOV DL, BL
         
;PART 3 LETRAS DE U ATE Z         
         MOV AH, 02
         MOV CL, 0
         LOP:         ;REPETE UM LOOP PARECIDO COM VOLTA, PRINTANDO AS LETRAS DE U A Z
            INT 21H
            MOV BL, DL
            MOV DL, 10
            INT 21H
            MOV DL, BL
            ADD DL, 1
            ADD BL, 1
            INC CL
            CMP CL, 6
            JNZ LOP
         MOV AH, 07
         INT 21H
         MOV AH, 02
         
         MOV AH,02    
         MOV CL,0 
         MOV DL,65
       
       VOLTA4:
            INT 21H
            MOV BL,DL
            MOV DL,10   
            INT 21H 
            MOV DL,BL   
            ADD DL,1
            ADD BL,1
            INC CL
            CMP CL,10   
            JNZ VOLTA4
       MOV AH,07
       INT 21H  
      
       MOV AH,02    
       MOV CL,0 
     VOLTA5:
        INT 21H
            MOV BL,DL
            MOV DL,10   
            INT 21H 
            MOV DL,BL   
            ADD DL,1
            ADD BL,1
            INC CL
            CMP CL,10   
            JNZ VOLTA5
         MOV AH,07
         INT 21H   
     
       MOV AH,02    
       MOV CL,0 
       VOLTA6:
        INT 21H
            MOV BL,DL
            MOV DL,10   
            INT 21H 
            MOV DL,BL   
            ADD DL,1
            ADD BL,1
            INC CL
            CMP CL,6   
            JNZ VOLTA6
         MOV AH,07
         INT 21H
        
 ;NUMEROS DE 0 A 9           
        MOV AH,02
        MOV CL,0
        MOV DL,48
        
        REST:      ;REPETE UM LOOP PARECIDO COMO O VOLTA, MAS DESSA VEZ PRINTANDO OS NUMEROS DE 0 A 9
            INT 21H
            MOV BL, DL
            MOV DL, 10
            INT 21H
            MOV DL, BL
            ADD DL, 1
            INC CL
            CMP CL, 10
            JNZ REST
        MOV AH,07
        MOV AH,04CH
        INT 21H
        
        
        
    MAIN ENDP
END MAIN
