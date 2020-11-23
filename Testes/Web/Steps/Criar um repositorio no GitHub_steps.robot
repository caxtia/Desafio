*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String

Resource  ../../../Ambientes/${ENV}/config.robot
Resource  ../../../Aplicacoes/GitHub/Funcionalidades.robot
Resource  ../../../Xpaths/GitHub.robot

*** Keywords ***
Realizar Login na pagina web GitHub
    [Documentation]     Abrir Url e colocar credenciais de acesso
    [Arguments]

    Abrir URL no browser
    Realizar login no Github

Criar um novo repositorio
    [Documentation]
    [Arguments]         ${nomeRepositorio}=${EMPTY}    ${descricao}=${EMPTY}    ${tipoPivacidade}=${EMPTY}       ${inicializarRepos}=${EMPTY}

    ${nomerepos}=       Criar um repositorio            ${nomeRepositorio}      ${descricao}        ${tipoPivacidade}        ${inicializarRepos}
    #validar que o repositorio foi criado
    wait until element is visible          xpath=//a[contains(text(),'${nomerepos}')]
    capture page screenshot     NewReposit.png