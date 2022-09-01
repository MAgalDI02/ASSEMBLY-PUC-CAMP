.model small
.data
.code
    main proc
;ALFABETO DE A Z
;PART 1 LETRAS DE A ATE J
        MOV CL, 0       ;Contador começa em 0
        mov dl, 97      ;DL recebe o caracter a  
        mov ah, 02      ;Ah recebe a função 02
        VOLTA:          ;Loop que printa de a ate j
            int 21h     ;Chama a função que Printa o que está em DL
            mov bl, dl  ;Bl guarda o valor de DL
            mov dl, 10  ;DL recebe enter
            int 21h     ;Printa o que está DL    
            mov dl, bl  ;Dl recebe seu valor de volta
            add dl, 1   ;Dl soma 1
            add bl, 1   ;BL soma 1
            INC CL      ;Funcao para soma de +1 como um i++ em C
            CMP CL, 10  ;Compara Cl até for igual a 10
            JNZ VOLTA   ;Caso não Cl não seja igual a 10 faz a função volta
        mov ah, 07      ;Ah recebe a função 07
        int 21h         ;Chama a função que le um caracter, nesse caso com a intenção de deixar deixar o código visualmente melhor
        mov dl, bl      ;DL recebe seu valor de volta
        
        
;PART 2 LETRAS DE K ATE T        
        mov ah, 02      ;Ah recebe a função 02
        mov cl, 0       ;Reseta o contador
        RESET:         ;Repete um loop parecido com VOLTA, printando as letras de k a t
            int 21h
            mov bl, dl
            mov dl, 10
            int 21h
            mov dl, bl
            add dl, 1
            add bl, 1
            INC CL
            CMP CL, 10 
            JNZ RESET
         mov ah, 07
         int 21h
         mov dl, bl
         
;PART 3 LETRAS DE U ATE Z         
         mov ah, 02
         mov cl, 0
         LOP:         ;Repete um loop parecido com VOLTA, printando as letras de u a z
            int 21h
            mov bl, dl
            mov dl, 10
            int 21h
            mov dl, bl
            add dl, 1
            add bl, 1
            INC CL
            CMP CL, 6
            JNZ LOP
         mov ah, 07
         int 21h
         mov ah, 02
         
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
        mov cl, 0
        mov dl, 48
        
        REST:      ;Repete um loop parecido como o VOLTA, mas dessa vez printando os numeros de 0 a 9
            int 21h
            mov bl, dl
            mov dl, 10
            int 21h
            mov dl, bl
            add dl, 1
            INC CL
            CMP CL, 10
            JNZ REST
        mov ah, 4Ch
        int 21h
        
        
        
    main endp
end main
 
    
