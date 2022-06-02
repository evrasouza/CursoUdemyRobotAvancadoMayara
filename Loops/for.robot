*** Settings ***
Library    Telnet


*** Test Cases ***
Teste novo formato do FOR de listas
    Velho formato do FOR de listas
    Novo formato do FOR de listas

Teste de FOR aninhado
    Cria cadastros de produtos (FOR aninhado)

Teste FOR usando variáveis
    Cria dicionário de traduções

Teste FOR com numeração de lista
    For com numeração
Teste mais opções IN RANGE
    Tradicional
    Apenas quantidades de laços informada (limite superior)
    Aritmético
    Intervalos específicos

*** Keywords ***
Velho formato do FOR de listas
    Log    velho formato robot 3, nao funciona mais
    # :FOR    ${animal}        IN        gato    cachorro    cavalo
    # \    Log    O animal desse laço é: ${animal}!
    # \    Log    Vamos para o próximo da lista...

Novo formato do FOR de listas
    FOR    ${animal}        IN        gato    cachorro    cavalo
        Log    O animal desse laço é: ${animal}!
        Log    Vamos para o próximo da lista...
    END

Cria cadastros de produtos (FOR aninhado)
    FOR    ${produto}    IN    baby look    camiseta    blusa
        Imprime tamanhos para o produto    ${produto}
    END

Imprime tamanhos para o produto
    [Arguments]    ${produto}
    FOR    ${tamanho}    IN    P    M    G
        Log    Produto: ${produto} - tam: ${tamanho}
    END

Cria dicionário de traduções
    FOR    ${index}    ${english}    ${finnish}    ${portugues}    IN    
    ...    1            cat          kissa          gato
    ...    2            dog          koira          cachorro
    ...    3            horse        hevonem        cavalo
           Log    Animal ${index}:\nEm inglês: ${english}\nEm finlandês: ${finnish} \nEm português: ${portugues} 
    END

For com numeração
    FOR    ${index}    ${element}    IN ENUMERATE    P    M    G    GG    XG    XXG
        Log    Item da Lista: ${element} - Posição do item na lista: ${index}        
    END

Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${counter}    IN RANGE    1    11    
        Log    ${counter}        
    END
Apenas quantidades de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${counter}    IN RANGE    10  
        Log    ${counter}        
    END

Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}    Set Variable    ${5}
    FOR    ${counter}    IN RANGE    ${var} + 1  
        Log    ${counter}        
    END

Intervalos específicos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${counter}    IN RANGE    0    31    5  
        Log    ${counter}        
    END