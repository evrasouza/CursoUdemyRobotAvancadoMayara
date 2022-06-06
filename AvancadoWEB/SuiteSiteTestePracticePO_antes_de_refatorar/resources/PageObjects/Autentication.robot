*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}                         chrome
${AUTH_FIELD_EMAIL}                id=email_create
${AUTH_BTN_SUBMITCREATEEMAIL}      id=SubmitCreate
${AUTH_TITLE_PERSONALINFO}         xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${AUTH_FIELD_GENDER}               id=id_gender2
${AUTH_FIELD_FIRSTNAME}            id=customer_firstname    
${AUTH_FIELD_LASTNAME}             id=customer_lastname
${AUTH_FIELD_PASSWORD}             id=passwd
${AUTH_FIELD_ADDRESS}              id=address1
${AUTH_FIELD_CITY}                 id=city
${AUTH_FIELD_STATE}                id=id_state
${AUTH_FIELD_POSTCODE}             id=postcode                    
${AUTH_FIELD_PHONEMOBILE}          id=phone_mobile
${AUTH_SUBMMIT}                    submitAccount

*** Keywords ***
#### Ações
Informar um e-mail válido
    Wait Until Element Is Visible   ${AUTH_FIELD_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${AUTH_FIELD_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Wait Until Element Is Visible   ${AUTH_BTN_SUBMITCREATEEMAIL}
    Click Button                    ${AUTH_BTN_SUBMITCREATEEMAIL}

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${AUTH_TITLE_PERSONALINFO}        10
    Click Element                   ${AUTH_FIELD_GENDER}
    Input Text                      ${AUTH_FIELD_FIRSTNAME}    Everton
    Input Text                      ${AUTH_FIELD_LASTNAME}     Souza
    Input Text                      ${AUTH_FIELD_PASSWORD}                123456
    Input Text                      ${AUTH_FIELD_ADDRESS}              Rua Framework, Bairro Robot
    Input Text                      ${AUTH_FIELD_CITY}                  Floripa
    Set Focus To Element            ${AUTH_FIELD_STATE}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   ${AUTH_FIELD_STATE}
    Select From List By Index       ${AUTH_FIELD_STATE}              4
    Input Text                      ${AUTH_FIELD_POSTCODE}              12345
    Input Text                      ${AUTH_FIELD_PHONEMOBILE}          99988877

Submeter cadastro
    Click Button                    ${AUTH_SUBMMIT}