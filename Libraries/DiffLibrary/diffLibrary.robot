*** Settings ***
Library     DiffLibrary

*** Variables ***
${datadir}  ${CURDIR}

*** Test Cases ***
Comparar dois conteúdos
     Compare "meu_arquivo.txt" e "meu_outro_arquivo.txt"

*** Keywords ***
Compare "${ARQUIVO_UM}" e "${ARQUIVO_DOIS}"
     Diff Files  ${datadir}${/}${ARQUIVO_UM}  ${datadir}${/}${ARQUIVO_DOIS}