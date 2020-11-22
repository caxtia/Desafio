*** Settings ***
Library     Selenium2Library
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

Criar issues no repositorio
    [Documentation]     aceder ao repositorio que pretende
    ...                 ciar uma nova issue, colocando titulo e descricao
    [Arguments]         ${nomeRepositorio}=${EMPTY}      ${tituloIssue}=${EMPTY}      ${comentIssue}=${EMPTY}
    ...                 ${assignIssue}=${EMPTY}      ${labelIssue}=${EMPTY}       ${projetIssue}=${EMPTY}      ${milestoneIssue}=${EMPTY}

    Selecionar menu de conta        Your repositories

    ${nomeRepositorio}=         set variable if     ('${nomeRepositorio}' == '${EMPTY}')       Desafio          ${nomeRepositorio}
    click element               xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3
    ${issue}=                   Criar issues num repositorio        ${tituloIssue}         ${comentIssue}       ${assignIssue}       ${labelIssue}       ${projetIssue}      ${milestoneIssue}

    #validar que a issue oi criada
    ${exist}=           Run Keyword And Return Status       Page Should Contain Element         xpath=//span[contains(text(),'${issue}')]
    run keyword if     '${exist}' == 'False'        fail    A issue ${issue} nao foi Criada com sucesso.
    ...         ELSE    log to console              A issue ${issue} foi Criada com sucesso.
    capture page screenshot         NewIssue.png
