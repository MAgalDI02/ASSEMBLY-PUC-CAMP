TITLE LUCAS VALERIO BERTI 22007440 E LUCAS MAGALDI 22004139

.model SMALL
.stack 100h

PULALINHA MACRO             ;macro que pula linha
    MOV AH,02
    MOV DL,10 
    INT 21h
ENDM

ESPACO MACRO                ;macro para printar um espaco em branco
    MOV AH,02
    MOV DL,32
    INT 21h    
ENDM

MENSAGEM MACRO              ;macro que faz print de mensagem do data
    MOV AH,09h    
    INT 21h
ENDM

READ MACRO                  ;macro que chama a funcao de leitura
    MOV AH,01h    
    INT 21h
ENDM

CLEAR MACRO                 ;macro que limpa a tela e define o modo de video
    MOV AH,00      
    MOV AL,03h      
    INT 10h         

    MOV AH,09      
    MOV AL,20h      
    MOV BH,00       
    MOV BL,070h     
    MOV CX,800h     
    INT 10h

    MOV AH,06h  
    XOR AL,AL     
    XOR CX,CX
    MOV DX,184Fh 
    MOV BH,10  
    INT 10h
ENDM
      
PUSHREG MACRO               ;macro que salva o conteudo dos registradores na memoria
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
ENDM

POPREG MACRO                ;macro que puxa conteudos de registradores guardados na memoria
    POP AX
    POP BX
    POP CX
    POP DX
    POP SI
ENDM

ZERA MACRO                  ;macro que zera o conteudo de todos os registradores
    XOR AX,AX
    XOR BX,BX
    XOR CX,CX
    XOR DX,DX
    XOR SI,SI
ENDM


.data
    MS1 db 10, 13,'REGRAS DO JOGO:','$'
    MS2 db 10, 13,'1- MAXIMO DE 5 ERROS','$'
    MS3 db 10, 13,'2- DIGITE AS COORDENADAS DA POSICAO QUE DESEJA PREENCHER','$'
    MS4 db 10, 13,'3- EXISTEM DUAS DIFICULDADES, UMA NORMAL E UMA DIFICIL','$'
    MS5 db 10,13,'DIGITE 1 PARA NORMAL E 2 PARA DIFICIL','$'
    MS6 db 10, 13,'ERROS DE 5: ','$'
    MSL db 10, 13,'DIGITE UMA LINHA: ','$'
    MSC db 10, 13,'DIGITE UMA COLUNA: ','$'
    MSN db 10, 13,'DIGITE UM NUMERO: ','$'
    MSF db 10,13,'Voce perdeu!','$'
    MSI db 10,13,'FOI INSERIDO UM CARACTER INVALIDO, TENTE NOVAMENTE','$'
 
    CERTO db ?
    ERRO  db ? 

    linha equ 9 
    coluna equ 9

    nnormal db ?,?,?,8,?,?,7,?,?
            db 8,3,7,?,?,?,?,?,?
            db ?,?,4,?,?,3,?,?,1
            db 9,?,1,?,5,?,6,?,?
            db ?,2,6,4,?,8,9,7,?
            db ?,?,5,?,9,?,1,?,4
            db 2,?,?,5,?,?,8,?,?
            db ?,?,?,?,?,?,4,1,2
            db ?,?,9,?,?,7,?,?,?
            
    respn   db 1,9,2,8,6,5,7,4,3
            db 8,3,7,1,2,4,5,6,9
            db 6,5,4,9,7,3,2,8,1
            db 9,4,1,7,5,2,6,3,8
            db 3,2,6,4,1,8,9,7,5
            db 7,8,5,3,9,6,1,2,4
            db 2,6,3,5,4,1,8,9,7
            db 5,7,8,6,3,8,4,1,2
            db 4,1,9,2,8,7,3,5,6           

    ddificil    db ?,7,?,?,9,?,?,5,2
                db ?,?,?,?,?,?,?,?,?
                db 3,?,9,?,8,?,?,?,?
                db ?,?,?,7,?,9,4,?,?
                db ?,5,?,?,3,?,9,?,?
                db ?,?,8,6,5,?,?,3,7
                db ?,8,2,?,?,?,5,7,?
                db ?,4,?,?,2,?,6,?,8
                db 6,?,?,1,?,?,3,?,4

    respd   db 8,7,4,3,9,6,1,5,2
            db 5,6,1,2,4,7,8,9,3
            db 3,2,9,5,8,1,7,4,6
            db 2,3,6,7,1,9,4,8,5
            db 4,5,7,8,3,2,9,6,1
            db 9,1,8,6,5,4,2,3,7
            db 1,8,2,4,6,3,5,7,9
            db 7,4,3,9,2,5,6,1,8
            db 6,9,5,1,7,8,3,2,4
.code

main PROC
    MOV AX,@DATA            ;inicializacao do data
    MOV DS,AX
    MOV ES,AX 

    MOV ERRO,0              ;definindo os erros iniciais como 0
    MOV CERTO,0             ;definindo acertos iniciais como 0
    CLEAR
    CALL MENU               ;chamada proceimento do menu

    JMP IGNORA              ;pula o aviso de caracter invalido
    VOLTA:
         LEA DX,MSI         ;mensagem de caracter invalido
         MENSAGEM
    IGNORA:
    ZERA                    ;zerando os registradores para fazer leitura sem conflito
    READ
    AND AL,0Fh              ;transformando numero em caracter

    CMP AL,1                ;comparacao para definir a dificuldade
    JE NORMAL               ;
    CMP AL,2                ;
    JE DIFICIL              ;

    CMP AL,1                ;comparacao para verificar se o que foi lido e invalido 
    JB VOLTA                ;
    CMP AL,2                ;
    JA VOLTA                ;

NORMAL:                     ;dificuldade normal
    CLEAR                   ;limpa a tela
    LEA BX,nnormal          
    CALL CONTADOR          
    CALL PRINTN             
    CALL RESPOSTA           
    MOV DL,ERRO             
    CMP DL,5                ;verificando se o usuario ja errou todas as vezes permitidas
    JL NORMAL
    JMP FIM

DIFICIL:                    ;dificuldade dificil
    CLEAR
    LEA BX,ddificil
    CALL CONTADOR
    CALL PRINTD
    CALL RESPOSTAD
    MOV DL, ERRO
    CMP DL,5                ;verificando se o usuario ja errou todas as vezes permitidas
    JL DIFICIL
    JMP FIM

FIM:
    LEA DX,MSF              ;print da mensagem de derrota
    MENSAGEM
    MOV AH,4Ch
    INT 21h
MAIN ENDP

MENU PROC                   ;procedimento que explica como funciona o jogo
    LEA DX,MS1
    MENSAGEM
    LEA DX,MS2
    MENSAGEM
    LEA DX,MS3
    MENSAGEM
    LEA DX,MS4
    MENSAGEM
    PULALINHA
    LEA DX,MS5
    MENSAGEM
    RET
MENU ENDP

CONTADOR PROC               ;procedimento que conta os erros 
    PUSHREG
    CLEAR
    LEA DX,MS6
    MENSAGEM
    MOV DL,ERRO
    ADD DL,30h
    MOV AH,02
    INT 21h
    PULALINHA
    POPREG
    RET
CONTADOR ENDP

PRINTN PROC             ;procedimento que printa a matriz da dificuldade normal
    PUSHREG
    XOR BX,BX
    XOR DI,DI
    MOV AH,02
    MOV CX,linha
OUTER:
        MOV DI,coluna
        XOR SI,SI
INNER: 
        MOV DL,nnormal[BX][SI]
        ADD DL,30h              ;transformando numero em caracter
        INT 21h
        ESPACO
        INC SI
        DEC DI
        JNZ INNER
        PULALINHA
        ADD BX,coluna
        LOOP OUTER
    POPREG
    RET
PRINTN ENDP

PRINTD PROC             ;procedimento que printa a matriz da dificuldade dificil
    PUSHREG
    XOR BX,BX
    XOR DI,DI
    MOV AH,02
    MOV CX,linha
OUTERD: 
        MOV DI,coluna
        XOR SI,SI
INNERD: 
        MOV DL,ddificil[BX][SI]
        ADD DL,30h              ;transformando numero em caractwer
        INT 21h
        ESPACO
        INC SI
        DEC DI
        JNZ INNERD
        PULALINHA
        ADD BX,coluna
        LOOP OUTERD
    POPREG
    RET
PRINTD ENDP

RESPOSTA PROC           ;procedimento que verifica se o que foi inserido esta correto ou errado
    PUSHREG
    ZERA

    LEA DX,MSL          ;pedido e leitura da linha que sera alterada
    MENSAGEM
    READ
    AND AL,0Fh          ;transformando caracter em numero
    MOV CX, 9
    MUL CX
    XOR AH,AH
    MOV BX,AX 
    SUB BX,9

    LEA DX,MSC          ;pedido e leitura da coluna que sera alterada
    MENSAGEM
    READ
    DEC AL              ;diminuindo al para si apontar para a coluna correta
    AND AL,0Fh           ;transformando caracter em numero
    XOR AH,AH
    MOV SI,AX
    
    LEA DX,MSN          ;pedido e leitura do numero que sera aplicado
    MENSAGEM
    READ
    AND AL,0Fh          ;transformando caracter em numero

    CMP AL,respn[BX][SI]        ;verificando se o numero inserido esta correto ou errado
    JE CORRETO

    PUSH DX             ;aumentando a quantidade de erros 
    XOR DL,DL           ;zerando dl para nao haver conflito
    MOV DL,ERRO         ;colocando a quantidade de erros em dl
    INC DL              ;aumentando a quantidade de erros
    MOV ERRO,DL         ;colocando a quantidade atualizada de erros na variavel erro
    POP DX              ;
    XOR AX,AX           

CORRETO:
    MOV nnormal[BX][SI],AL      ;colocando o numero correto na matriz do jogo 
    PUSH DX                     ;aumentando a quantidade de acertos
    XOR DL,DL   
    MOV DL,CERTO
    INC DL
    MOV CERTO,DL
    POP DX
    POPREG
    RET
RESPOSTA ENDP

RESPOSTAD PROC              ;igual ao procedimento RESPOSTA mas para a dificuldade dificil, entao os comentarios sao os mesmos
    PUSHREG
    ZERA

    LEA DX,MSL
    MENSAGEM
    READ
    AND AL,0Fh
    MOV CX, 9
    MUL CX
    XOR AH,AH
    MOV BX,AX 
    SUB BX,9

    LEA DX,MSC
    MENSAGEM
    READ
    AND AL,0Fh             
    XOR AH,AH
    MOV SI,AX

    LEA DX,MSN
    MENSAGEM
    READ
    SUB AL,30h
    
    ;----comparing the user answer with the correct answer----
    CMP AL,respd[BX][SI]
    JE CORRETO1

    PUSH DX;----saving the dx register----
    XOR DL,DL
    MOV DL,ERRO
    INC DL
    MOV ERRO,DL
    POP DX
    XOR AX,AX   

CORRETO1:
    MOV ddificil[BX][SI],AL
    PUSH DX
    XOR DL,DL
    MOV DL,CERTO
    INC DL
    MOV CERTO,DL
    POP DX
    POPREG
    RET
RESPOSTAD ENDP
END MAIN