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

Selecionar o repositorio a ser eliminado
    [Documentation]     Selecionar o nome do repositorio a ser eliminado
    ...                 Se o valor estiver vazio usar um repositorio que contenha AUT
    [Arguments]         ${nomeRepositorio}=${EMPTY}

    ${nomeRepos}=       set variable if    '${nomeRepositorio}' != '${EMPTY}'       ${nomeRepositorio}      AUT
    log to console      nomerepoSteps:${nomerepos}
    Selecionar menu de conta        Your repositories

    [Return]        ${nomeRepos}


Eliminar um repositorio
    [Documentation]      Eliminar o repositorio previamente selecionado
    [Arguments]         ${nomeRepositorio}

    ${nomeRepositorio}=       set variable if    '${nomeRepositorio}' != '${EMPTY}'       ${nomeRepositorio}      AUT
    log to console      NOm:${nomeRepositorio}
    ${nameReposDelete}=        Remover um repositorio     ${nomeRepositorio}

    #validar que o repositorio foi eliminado
    Selecionar menu de conta        Your repositories
    ${exist}=       Run Keyword And Return Status       Page Should Contain Element         xpath=//a[contains(text(),'${nameReposDelete}')]/../../h3
    run keyword if     '${exist}' == 'True'        fail    O repositorio ${nameReposDelete} nao foi eliminado com sucesso.
