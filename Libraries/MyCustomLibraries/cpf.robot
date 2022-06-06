*** Settings ***
Library         ./Libraries/cpf/validiaEGeraCPF.py

*** Test Cases ***
Teste de validar cpf
    Validar se este número "84726810090" é um cpf
    Validar se este número "84755810090" é um cpf
    Validar se este número "000000" é um cpf

*** Keywords ***
Validar se este número "${CPF}" é um cpf
    ${VALOR_CPF}        CPF VALIDATE        ${CPF}
    Log   ${VALOR_CPF}
