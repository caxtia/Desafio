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

Validar configuracoes de protecao de branch
    [Documentation]     Validar que a branch tem check nas configuraões necessárias para este teste
    ...                 Require pull request reviews before merging
    ...                 Include administrators
    [Arguments]         ${nomeRepositorio}=${EMPTY}          ${branch}=${EMPTY}
    ...                 ${ficheiroEditar}=${EMPTY}           ${linha}=${EMPTY}

    Selecionar menu de conta        Your repositories

    ${nomeRepositorio}=         set variable if     ('${nomeRepositorio}' == '${EMPTY}')       Desafio          ${nomeRepositorio}
    click element               xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3

    click element                   ${SettingsInsideRepo}
    wait until element is visible   ${settingBranch}

    click element                   ${settingBranch}
    wait until element is visible   ${titleSettingsBranch}

    ${branch}=       set variable if    '${branch}' != '${EMPTY}'       ${branch}      TestePrivat
    click element                   xpath=//span[text()='${branch}']/../div/div/a
    wait until element is visible    ${includAdminSettingsBranch}
    wait until element is visible    ${reqPullSettingsBranch}

    capture page screenshot         configBranch.png

    #voltar ao repositorio
    Selecionar menu de conta        Your repositories
    click element               xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3

    # chama kw para selecionar branch e editar ficheiro
    ${ficheiroEditar}=       set variable if    '${ficheiroEditar}' != '${EMPTY}'       ${ficheiroEditar}      index.html
    ${linha}=       set variable if    '${linha}' != '${EMPTY}'       ${linha}      8
    Editar ficheiro numa branch especifica           ${ficheiroEditar}       ${branch}     TESTE AUTO
    ...               ${linha}

    wait until element is visible       ${createPullRequest}
    click element                       ${createPullRequest}

Validar que nao e possivel realizar merging do pull request
    [Documentation]     Validar que nao e possivel fazer merge do pull request
    ...                 devido as configuracoes realizadas
    [Arguments]

    wait until element is visible           ${alertMergBlock}
    wait until element is visible           ${needReviewBlock}      timeout=15

    #fazer scoll para tirar print as configurações
    Execute JavaScript    window.scrollTo(0,700)
    capture page screenshot             AvisosBloqueio.png

    #fechar pull request
    wait until element is visible            ${closePullRequest}
    click element                            ${closePullRequest}
