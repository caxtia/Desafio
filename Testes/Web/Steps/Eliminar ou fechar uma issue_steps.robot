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

Eliminar ou fechar issues no repositorio
    [Documentation]     aceder ao repositorio que pretende
    ...                 ciar uma nova issue, colocando titulo e descricao
    [Arguments]         ${nomeRepositorio}=${EMPTY}      ${tituloIssue}=${EMPTY}      ${Acao}=${EMPTY}

    Selecionar menu de conta        Your repositories

    ${nomeRepositorio}=         set variable if     ('${nomeRepositorio}' == '${EMPTY}')       Desafio          ${nomeRepositorio}

    click element               xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3
    click element               ${selectMenuIssues}
    sleep   5

    #tratar do titulo do issue e acao
    ${tituloIssue}=         set variable if     ('${tituloIssue}' == '${EMPTY}')       AUT          ${tituloIssue}
    ${Acao}=                set variable if     ('${Acao}' == '${EMPTY}')              E            ${Acao}


    run keyword if      '${Acao}' == 'E'        Eliminar um issue       ${tituloIssue}
    ...     ELSE IF     '${Acao}' == 'C'        Fechar um issue         ${tituloIssue}
