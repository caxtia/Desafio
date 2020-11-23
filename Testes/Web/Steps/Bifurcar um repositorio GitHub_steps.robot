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

Selecionar o repositorio a ser bifurcado
    [Documentation]     Selecionar o nome do repositorio a ser bifurcado
    ...                 Se o valor estiver vazio usar um repositorio criado para o teste (caxtia/AUT-20201120110809)
    [Arguments]         ${nomeRepositorio}=${EMPTY}

    ${nomeRepos}=       set variable if    '${nomeRepositorio}' != '${EMPTY}'       ${nomeRepositorio}      caxtia/AUT-20201120110809
    log to console      nomerepoSteps:${nomerepos}
    Pesquisar um repositorio         ${nomeRepos}

    [Return]        ${nomeRepos}


Bifurcar o repositorio
    [Documentation]      Bifurcar o repositorio previamente selecionado
    ...                  Caso o parametro de entrada do teste seja vazio
    ...                  vai ser eliminado o repositorio
    ...                  assim o teste é adaptável para regressão
    [Arguments]          ${nomeReposFork}       ${nomeRepositorio}

     wait until element is visible          ${btnFork}
     click element                          ${btnFork}
     wait until element is visible          xpath=//span[contains(text(),'forked from')]
     ${msgFork}=    Get text    xpath=//span[contains(text(),'forked from')]
     run keyword if       '${msgFork}' != 'forked from ${nomeReposFork}'     fail   o Fork indicado na página(${msgFork}), nao foi realizado no repositorio correto:forked from ${nomeReposFork}
     capture page screenshot     Fork.png
     run keyword if      ('${nomeRepositorio}' == '${EMPTY}')       Remover um repositorio     ${nomeReposFork}