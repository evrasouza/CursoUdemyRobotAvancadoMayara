*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PageObjects/Home.robot
Resource            ../resources/PageObjects/Carrinho.robot
Resource            ../resources/PageObjects/Autentication.robot

Test Setup          Abrir navegador
#Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Home.Acessar a página home do site
    Home.Clicar em "Sign in"
    Autentication.Informar um e-mail válido
    Autentication.Clicar em "Create an account"
    Autentication.Preencher os dados obrigatórios
    Autentication.Submeter cadastro
#     Conferir se o cadastro foi efetuado com sucesso
