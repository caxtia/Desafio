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

Selecionar um repositorio e editar ficheiro
    [Documentation]     Pesquisar e selecionar o ficheiro a editar
    [Arguments]         ${nomeRepositorio}=${EMPTY}      ${nomeFicheiro}=${EMPTY}      ${descricao}=${EMPTY}
    ...                 ${linha}=${EMPTY}

    Selecionar menu de conta        Your repositories

    ${nomeRepositorio}=         set variable if     ('${nomeRepositorio}' == '${EMPTY}')       Desafio          ${nomeRepositorio}
    click element               xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3

    ${descricao}=       Editar ficheiro             ${nomeFicheiro}            ${descricao}     ${linha}    new

    Criar pull request e merge num ficheiro editado              ${descricao}
    click element                                                ${deleteBranch}

    # validar que o ficheiro tem a nova descricao
    wait until element is visible          xpath=//a[text()='${nomeRepositorio}']
    click element                          xpath=//a[text()='${nomeRepositorio}']

    wait until element is visible          xpath=//a[text()='${nomeFicheiro}']
    click element                          xpath=//a[text()='${nomeFicheiro}']

    wait until element is visible          xpath=//td[contains(text(),'${descricao}')]
    capture page screenshot                FicheiroEditadoMain.png

    log to console                         ficheiro na branch principal foi alterado com sucesso, com a descricao ${descricao}.

