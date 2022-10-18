*** Settings ***
Documentation        Neste documento constara os exercicios propostos na aula da 2 semana da Prime Hero Academy
Library    Collections
Library    OperatingSystem

*** Variables ***
# Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionario
&{PESSOA}    
...    nome=Jose da Silva
...    idade=67
...    endereco=rua Santa Luzia
...    numero=118
...    cep=36404-000
...    bairro=Belo Horizonte
...    cidade=Congonhas
...    estado=Minas Gerais

# Criar uma keyword que receba idade e retorne o ano de nascimento. Se o ano for menor que 2000, exibir mensagem dizendo que nasceu no seculo passado
${ANO_NASCIMENTO}  
${ANO_ATUAL}    2022
${CONTA_PAR}

# Exiba cada uma das frutas de uma lista usando um For Simples

${LISTA_CONFERE_COMPARA}

# A partir da lista ["A", 1, "B", 2, "C" e 3], adicionar somente os números numa nova lista, 
#   tratar os caracteres como exceção e exibir a nova lista a cada iteração usando Finally.

@{NUM_STRING}    'A'    1    'B'    2    'C'    3
@{LISTA_STRING}
@{LISTA_NUMERO}

*** Test Cases ***
Cenario de teste 01 - Dicionário
    [Tags]    PESSOA
    Exibir pessoa no Console

Cenario de teste 02 - Argumentos e Retornos + If Simples
    [Tags]    SECULO PASSADO
    Verifica Ano de nascimento do usuario    67    

Cenario de teste 03 - For Simples + Lista
    [Tags]    ESCOLHA_FRUTA
    Exibir lista escolha de fruta

Cenario de teste 04 - If Inline + For in Range
     [Tags]    CONTA_PAR
     Exibir numeros pares em uma lista determinada

Cenario de teste 05 - teste Extra Try + Except + Finally
     [Tags]    NUM_STRING
     Exibir somente os numeros numa nova lista


*** Keywords ***

#                                    Exercicio Dicionario                               #
Exibir pessoa no Console
    Log Many     Nome: ${PESSOA.nome}    idade: ${PESSOA.idade}    endereco: ${PESSOA.endereco}    numero: ${PESSOA.numero}    cep: ${PESSOA.cep}     bairro: ${PESSOA.bairro}    cidade: ${PESSOA.cidade}    estado: ${PESSOA.estado}


#                               Exercicio - If simples                                  #

Verifica Ano de nascimento do usuario
    [Arguments]    ${IDADE}
    
    ${ANO_NASCIMENTO} =    Evaluate     ${ANO_ATUAL} - ${IDADE}             
    
    # Verificar se o ano e < 2000

    IF    ${ANO_NASCIMENTO} < 2000
        Log    Voce nasceu no seculo passado, tendo ${ANO_NASCIMENTO} mas nao sou tao velho assim, um pouco mais exepriente :))!!!
    
    ELSE IF     ${ANO_NASCIMENTO} >= 2000
        Log    Voce nasceu neste seculo e tem ${ANO_NASCIMENTO} a vida eh bela aproveite-a!!   
    
    END


#                              Exercicio - For Simples + Lista                           #
Exibir lista escolha de fruta
    @{ESCOLHA_FRUTA}    Create List    Maca    Pera    Banana    Melao    Uva
    FOR    ${ESCOLHA_FRUTA}    IN    ${ESCOLHA_FRUTA}
        Log    Minha escolha e: ${ESCOLHA_FRUTA[3]}
    END


#                        Exercicio - If Inline + For in Range                           #

Exibir numeros pares em uma lista determinada
    FOR    ${CONTADOR}    IN RANGE    0    11
        IF  ${CONTADOR%2} == 0        
            ${CONTA_PAR}    Evaluate    ${CONTA_PAR} +1
            Log    O total de numeros: ${CONTADOR} e existem ${CONTA_PAR} numeros pares
        END        
    END
    Log    Acabou o loop!

Exibir somente os numeros numa nova lista
    
    TRY
        #Fail
        FOR    ${element}    IN    @{NUM_STRING}
            IF    type(${element}) == int
                Append To List    ${LISTA_NUMERO}    ${element}
            END
        END
        Log To Console    ----LISTA DE NUMEROS ----
    EXCEPT
        FOR    ${element}    IN    @{NUM_STRING}
            IF    type(${element}) == str
                Append To List    ${LISTA_STRING}    ${element}
            END
        END
        Log To Console    ----LISTA LETRAS ----
    FINALLY
        FOR    ${element}    IN    @{LISTA_STRING}
            Log To Console    ${element}
        END
        FOR    ${element}    IN    ${LISTA_NUMERO}
            Log To Console    ${element}
        END        
    END
    


