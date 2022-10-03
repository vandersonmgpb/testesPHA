*** Settings ***
Documentation        Neste documento constara os exercicios propostos na aula da 2 semana da PHA

*** Variables ***
# Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionario
&{PESSOA}    nome=Jose da Silva    idade=67    endereco=rua Santa Luzia    numero=118    cep=36404-000    bairro=Belo Horizonte    cidade=Congonhas    estado=Minas Gerais

# Criar uma keyword que receba idade e retorne o ano de nascimento. Se o ano for menor que 2000, exibir mensagem dizendo que nasceu no seculo passado
${ANO_NASCIMENTO}  
${ANO_ATUAL}    2022
${CONTA_PAR}

# Exiba cada uma das frutas de uma lista usando um For Simples


*** Test Cases ***
Cenario de teste 01 - Dicionário
    [Tags]    PESSOA
    Log to console    ${PESSOA}

Cenario de teste 02 - Argumentos e Retornos + If Simples
    [Tags]    SECULO PASSADO
    Exibir ano de nascimento    67    

Cenario de teste 03 - For Simples + Lista
    [Tags]    ESCOLHA_FRUTA
    Exibir lista escolha de fruta

Cenario de teste 04 - If Inline + For in Range
     [Tags]    CONTA_PAR
     Exibir numeros pares em uma lista determinada



*** Keywords ***
_________________________________________________________________________________________
#                                    Exercicio Dicionario                               #
Exibir pessoa no Console
    Log To Console     nome=Jose da Silva    idade=67    endereco=rua Santa Luzia    numero=118    cep=36404-000    bairro=Belo Horizonte    cidade=Congonhas    estado=Minas Gerais

_________________________________________________________________________________________
#                               Exercicio - If simples                                  #
Exibir Ano de nascimento
    [Arguments]    ${IDADE}
    
    ${ANO_NASCIMENTO} =    Evaluate     ${ANO_ATUAL} - ${IDADE}             
    
    IF    ${ANO_NASCIMENTO} < 2000
        Log to console    Voce nasceu no seculo passado
    
    ELSE IF     ${ANO_NASCIMENTO} >= 2000
        Log to console    Voce nasceu neste seculo    
    
    END

__________________________________________________________________________________________
#                              Exercicio - For Simples + Lista                           #
Exibir lista escolha de fruta
    @{ESCOLHA_FRUTA}    Create List    Maça    Pera    Banana    melao    Uva
    FOR    ${ESCOLHA_FRUTA}    IN    ${ESCOLHA_FRUTA}
        Log to console    ${ESCOLHA_FRUTA}
    END

_________________________________________________________________________________________
#                        Exercicio - If Inline + For in Range                           #

Exibir numeros pares em uma lista determinada
    FOR    ${i}    IN RANGE    0    11
        IF  ${i%2} == 0
        ${CONTA_PAR}    Evaluate    ${CONTA_PAR} + 1
            Log to console    \n\nOs numeros pares sao: ${i} e existem ${CONTA_PAR} numeros pares de 0 a 10
        END
        Log To Console    Acabou o loop!
    END