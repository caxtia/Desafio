*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String
Library     DateTime
*** Keywords ***
Abrir URL no browser
    [Documentation]     Abrir browser e adicionar URL GitHub

    log to console      *** Start: Abrir URL no browser ***
    open browser                        ${URLGitHub}     browser=chrome
    maximize browser window
    wait until element is visible       ${hMenSignIn}
    click element                       ${BtnPopUpAcc}
    log to console      *** End: Abrir URL no browser ***


Realizar login no Github
    [Documentation]     Realizar login no Git Hub
    ...                 Clicar no botão Sign in, colocar as credencias de acesso (caso não sejam passados valores por parametros
    ...                 é utilizada a configuração existente no ficheiro de configurações do ambiente)
    ...                 e clicar em Sign in
    ...                 Validação de login realizado

    [Arguments]          ${Username}=${EMPTY}     ${PassWord}=${EMPTY}

    log to console      *** Start: Realizar login no Github ***
    click element                       ${hMenSignIn}
    wait until element is visible       ${btnSignIn}

    run keyword if      '${Username}' != '${EMPTY}'     input text      ${inputUser}            ${Username}
    ...     ELSE        input text      ${inputUser}            ${user}

    run keyword if      '${PassWord}' != '${EMPTY}'     input text      ${inputPass}            ${PassWord}
    ...     ELSE        input text      ${inputPass}            ${pass}

    click element                       ${btnSignIn}

    wait until element is visible       ${IconGitHub}

    log to console      *** End: Realizar login no Github ***

Criar um repositorio
    [Documentation]     Criar um novo repositorio no gitHub
    ...                 Adicionar nome do repositorio, descricao, e se é da categoria publco ou privado
    [Arguments]         ${nomeRepositorio}=${EMPTY}    ${descricao}=${EMPTY}    ${tipoPivacidade}=${EMPTY}      ${inicializarRepos}=${EMPTY}

    log to console      *** Start: Criar um repositorio***
    click element                       ${iconAddRepos}
    wait until element is visible       ${selectNewReposit}
    click element                       ${selectNewReposit}
    wait until element is visible       ${h1CreatRepos}

    ${timestmp}=        Get current Date        result_format=%Y%m%d%H%M%S
    log to console      Timestamp: ${timestmp}

    ${nomerepos}=       set variable if    '${nomeRepositorio}' != '${EMPTY}'       ${nomeRepositorio}      AUT-${timestmp}
    log to console      Nome reposito:${nomerepos}
    input text      ${inputNomRepos}            ${nomerepos}
    wait until element is visible       ${Check}
    run keyword if      '${descricao}' != '${EMPTY}'     input text      ${inputDescriptRepos}            ${descricao}
    ...     ELSE        input text      ${inputDescriptRepos}            Projeto AUT-${timestmp}

    log to console      Aqui2
    run keyword if      ('${tipoPivacidade}' != '${EMPTY}' and '${tipoPivacidade}' == 'Public')       click element      ${radButnPublic}
    ...     ELSE IF     ('${tipoPivacidade}' != '${EMPTY}' and '${tipoPivacidade}' == 'Private')      click element      ${radButnPrivad}
    ...     ELSE        click element      ${radButnPublic}

    log to console      ANTES DOS IFS

    ${inicializarRepos}=        set variable if     ('${inicializarRepos}' == '${EMPTY}')       Readme_          ${inicializarRepos}
    ${initRepo}=        split string        ${inicializarRepos}     _

    run keyword if      ('${inicializarRepos}' != '${EMPTY}' and '${initRepo[0]}' == 'Readme')       click element      ${InicialzReadmeFile}
    ...     ELSE IF     ('${inicializarRepos}' != '${EMPTY}' and '${initRepo[0]}' == 'git')          Selecionar template na criacao de repositorio      ${InicialzGit}     Choose which files not to track     span        ${initRepo[1]}
    ...     ELSE IF     ('${inicializarRepos}' != '${EMPTY}' and '${initRepo[0]}' == 'license')      Selecionar template na criacao de repositorio       ${InicialzLicense}      A license tells     div    ${initRepo[1]}
    ...     ELSE        click element      ${InicialzReadmeFile}
    wait until element is visible       ${btnCreatRepos}
    click element           ${btnCreatRepos}
    log to console      *** End: Criar um repositorio***
    [Return]        ${nomerepos}

Selecionar template na criacao de repositorio
    [Documentation]     Adicionar template na opção .gitignore
    ...                 ou adicionar licensa na opção de escolha de licensas
    ...                 Esta KW é dinamica
    [Arguments]         ${xPathCheck}     ${xPath}    ${tipoElemento}      ${opcaoEscolher}
    log to console      *** Start: Selecionar template na criacao de repositorio***

    log to console      DEntro KW
    click element       ${xPathCheck}
    click element       xpath=//span[contains(text(),'${xPath}')]/../span/details/summary
    click element       xpath=//${tipoElemento}[contains(text(),'${opcaoEscolher}')]

    log to console      *** End: Selecionar template na criacao de repositorio***

Pesquisar um repositorio
    [Documentation]     Pesquisar um repositorio especifico, utilizando o valor
    ...                 passado como parametro
    [Arguments]         ${nomeRepositorio}

    log to console      *** Start: Pesquisar um repositorio***
    click element       ${inputSearch}
    input text          ${inputSearch}      ${nomeRepositorio}
    press key           ${inputSearch}    	\\13
    wait until element is visible       xpath=//a[@href='/${nomeRepositorio}']
    click element                       xpath=//a[@href='/${nomeRepositorio}']
    log to console      *** End: Pesquisar um repositorio***

Remover um repositorio
    [Documentation]     Remover um reposiorio especifico
    [Arguments]         ${nomeRepositorio}

    log to console      *** Start: Remover um repositorio***
    Selecionar menu de conta        Your repositories
    ${nameReposDelete}=        get text        xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3

    click element                   xpath=//a[contains(text(),'${nomeRepositorio}')]/../../h3
    capture page screenshot         NamesReposDelete.png
    click element                   ${SettingsInsideRepo}
    wait until element is visible   ${deleteRepo}

    click element                   ${deleteRepo}
    ${reposDelete}=         get text    xpath=(//details-dialog[@aria-label='Delete repository']/div[@class='Box-body overflow-auto']/p/strong[contains(text(),'${nameReposDelete}')])[1]

    click element               ${inputConfirmDeleteRepo}
    input text                  ${inputConfirmDeleteRepo}       ${reposDelete}
    click element               ${confirmDeleteRepo}
    capture page screenshot     ReposDelete.png
    log to console      *** End: Remover um repositorio***

    [Return]       ${nameReposDelete}

Selecionar menu de conta
    [Documentation]     selecionar uma opçao do menu associado ao login da conta
    [Arguments]         ${menu}

    log to console      *** Start: Selecionar menu de conta***
    click element       ${iconAvatar}
    wait until element is visible       xpath=//a[text()='${menu}']
    click element                       xpath=//a[text()='${menu}']
    log to console      *** End: Selecionar menu de conta***

Selecionar opcoes avancadas na criacao de issues
    [Documentation]    Keyword generica para preencher as definicoes avançadas da criacao d issues
    ...                 assignees, labels, milestone
    [Arguments]        ${idXpath}       ${valor}

    log to console      *** Start: Selecionar opcoes avancadas na criacao de issues***
    click element                       xpath=//details[@id='${idXpath}']
    wait until element is visible       xpath=//span[text()='${valor}']
    click element                       xpath=//span[text()='${valor}']
    click element                       xpath=//details[@id='${idXpath}']
    log to console      *** End: Selecionar opcoes avancadas na criacao de issues***

Criar issues num repositorio
    [Documentation]    Criar issues num repositorio previamente selecionado
    [Arguments]        ${tituloIssue}=${EMPTY}      ${comentIssue}=${EMPTY}
    ...                ${assignIssue}=${EMPTY}      ${labelIssue}=${EMPTY}       ${projetIssue}=${EMPTY}      ${milestoneIssue}=${EMPTY}

    log to console      *** Start: Criar issues num repositorio***
    click element                       ${selectMenuIssues}
    wait until element is visible       ${btnNewIssue}
    click element                       ${btnNewIssue}
    wait until element is visible       ${bodyNewIssue}

    ${timestmp}=        Get current Date        result_format=%Y%m%d%H%M%S
    log to console      Timestamp: ${timestmp}

    #Preenche titulo e comentario
    ${tituloIssue}=       set variable if    '${tituloIssue}' != '${EMPTY}'       ${tituloIssue}      AUT-Issue-${timestmp}
    input text      ${titleNewIssue}           ${tituloIssue}

    run keyword if      '${comentIssue}' != '${EMPTY}'     input text      ${bodyNewIssue}             ${comentIssue}
    ...     ELSE        input text      ${bodyNewIssue}            nova issue criada AUT-${timestmp}

    #Assignar a alguem
    run keyword if      '${assignIssue}' != '${EMPTY}'     Selecionar opcoes avancadas na criacao de issues      assignees-select-menu    ${assignIssue}
    ...     ELSE        Selecionar opcoes avancadas na criacao de issues      assignees-select-menu    AutoTest91

    # Associar Label
    run keyword if      '${labelIssue}' != '${EMPTY}'     Selecionar opcoes avancadas na criacao de issues      labels-select-menu     ${labelIssue}
    ...     ELSE        Selecionar opcoes avancadas na criacao de issues      labels-select-menu   bug

    #Associar a um projeto
    ${projetIssue}=        set variable if     ('${projetIssue}' == '${EMPTY}')       Desafio001          ${projetIssue}
    log to console      Projet:${projetIssue}
    click element                       ${ProjectNewIssue}
    wait until element is visible       xpath=(//strong[text()='${projetIssue}'])[1]
    click element                       xpath=(//strong[text()='${projetIssue}'])[1]
    click element                       ${ProjectNewIssue}

    #Associar Milestone
    run keyword if      '${milestoneIssue}' != '${EMPTY}'     Selecionar opcoes avancadas na criacao de issues     milestone-select-menu   ${milestoneIssue}
    capture page screenshot         DadosIssue.png
    click element       ${submitNewIssue}
    log to console      *** End: Criar issues num repositorio***
    [Return]        ${tituloIssue}

Eliminar um issue
    [Documentation]    Eliminar um issue
    [Arguments]        ${issue}

    log to console      *** Start: Eliminar um issue***
    wait until element is visible           xpath=//a[contains(text(),'${issue}')]

    ${nomeComplet}=     get text        xpath=//a[contains(text(),'${issue}')]
    log to console      Nome completo:${nomeComplet}

    click element                           xpath=//a[contains(text(),'${issue}')]
    wait until element is visible           ${DeleteIssue}
    click element                           ${DeleteIssue}
    wait until element is visible           ${AlertDeleteIssue}
    capture page screenshot                 DeleteIssue.png
    click element                           ${AlertDeleteIssue}
    click element                           ${ConfirmDeleteIssue}
    sleep   2
    ${exist}=       Run Keyword And Return Status       Page Should Contain Element          xpath=//a[contains(text(),'${nomeComplet}')]
    run keyword if     '${exist}' == 'True'        fail    A issue ${issue} nao foi eliminada com sucesso.
    ...     ELSE        log to console      Issue eliminada com sucesso:${nomeComplet}
    log to console      *** End: Eliminar um issue***

Fechar um issue
    [Documentation]    fechar um issue
    [Arguments]        ${issue}

    log to console      *** Start: Fechar um issue***
    wait until element is visible           xpath=//a[contains(text(),'${issue}')]
    click element                           xpath=//a[contains(text(),'${issue}')]
    wait until element is visible           ${closeIssue}
    click element                           ${closeIssue}
    capture page screenshot                 CloseIssue.png
    sleep   2
    ${exist}=       Run Keyword And Return Status       Page Should Contain Element          ${closeIssue}
    run keyword if     '${exist}' == 'True'        fail    A issue ${issue} nao foi fechada com sucesso.
    ...     ELSE        log to console      Issue fechada com sucesso:${issue}
    log to console      *** End: Fechar um issue***

Editar ficheiro
    [Documentation]    editar um ficheiro no gitHub
    [Arguments]       ${nomeFicheiro}=${EMPTY}      ${descricao}=${EMPTY}       ${linha}=${EMPTY}
    ...               ${tipoBranch}=${EMPTY}


    log to console      *** Start: Editar ficheiro ***

    click element                       xpath=//a[text()='${nomeFicheiro}']
    wait until element is visible       ${editFile}
    click element                       ${editFile}
    wait until element is visible       ${btnCancelEditFile}

    capture page screenshot         FicheiroInicial.png

    click element       xpath=//div[text()='${linha}']/../..

    ${timestmp}=        Get current Date        result_format=%Y%m%d%H%M%S

    ${descricao}=       set variable if    '${descricao}' != '${EMPTY}'       ${descricao}      AUT-${timestmp}
    input text          xpath=//div[text()='${linha}']/../..       ${descricao}

    ${tipoBranch}=       set variable if    '${tipoBranch}' != '${EMPTY}'       ${tipoBranch}      new
    run keyword if      '${tipoBranch}' == 'new'        click element       ${checkNewBranchEditFile}

    wait until element is visible        ${titleEditFile}
    input text                           ${titleEditFile}           ${nomeFicheiro}

    input text                           ${descriptEditFile}        Add ${descricao} to line ${linha}.
    capture page screenshot                 FicheiroAlteracoes.png
    click element                        ${sendChangesEditFile}

    log to console      *** End: Editar ficheiro ***
    [Return]       ${descricao}


Criar pull request e merge num ficheiro editado
    [Documentation]   criacao de um pull request e um merge para o ramo principal (main) num ficheiro editado
    [Arguments]       ${descricao}

    log to console      *** Start: Criar pull request e merge num ficheiro editado ***

    wait until element is visible           ${createPullRequest}

    #criar um pull request
    click element                           ${createPullRequest}

    #validar que nao existem conflitos
    wait until element is visible           ${mergePullRequest}
    wait until element is visible           ${notConflictPullRequest}

    click element                           ${mergePullRequest}

    wait until element is visible           ${confirmMerge}
    click element                           ${confirmMerge}

    wait until element is visible           ${deleteBranch}
    wait until element is visible           ${pullMergeSucess}      timeout=20
    click element                           ${deleteBranch}


    log to console             Merge realizado com sucesso: ${pullMergeSucess}

    log to console      *** End: Criar pull request e merge num ficheiro editado ***

Editar ficheiro numa branch especifica
    [Documentation]   Editar um determinado ficheiro numa branch especifica
    [Arguments]       ${nomeFicheiro}=${EMPTY}      ${branch}=${EMPTY}    ${descricao}=${EMPTY}
    ...               ${linha}=${EMPTY}

    log to console      *** Start: Editar ficheiro numa branch especifica ***

    click element                       ${clickOptionSelectBranch}
    wait until element is visible       xpath=//span[text()='${branch}']
    click element                       xpath=//span[text()='${branch}']

    capture page screenshot             BranchSelect.png

    Editar ficheiro                     ${nomeFicheiro}      ${descricao}     ${linha}      new

    log to console      *** End: Editar ficheiro numa branch especifica ***

Criar um projeto novo
    [Documentation]   Criar um novo projeto, selecionando o template passado como parametro
    [Arguments]       ${nomeProjeto}      ${tipoPivacidade}         ${template}

    log to console      *** Start: Criar um projeto novo projeto ***

    wait until element is visible           ${btnNewProject}
    click element                           ${btnNewProject}

    wait until element is visible           ${nameNewProject}
    input text                              ${nameNewProject}           ${nomeProjeto}

    wait until element is visible           ${SelectTemplate}
    click element                           ${SelectTemplate}
    wait until element is visible           xpath=//span[text()='${template}']
    click element                           xpath=//span[text()='${template}']

    capture page screenshot         TemplateEscolhido.png

    run keyword if      ('${tipoPivacidade}' != '${EMPTY}' and '${tipoPivacidade}' == 'Public')       click element      ${radButnProjectPublic}
    ...     ELSE IF     ('${tipoPivacidade}' != '${EMPTY}' and '${tipoPivacidade}' == 'Private')      click element      ${radButnProjectPrivad}
    ...     ELSE        click element      ${radButnProjectPrivad}

    wait until element is visible           ${btnCreateProject}
    click element                           ${btnCreateProject}

    log to console      *** End: Criar um projeto novo projeto ***

Cancelar um projeto
    [Documentation]   cancelar um projeto
    [Arguments]

    log to console      *** Start: Cancelar um projeto ***
    wait until element is visible      ${closeAddCards}
    capture page screenshot            ProjetoCriado.png

    click element                   ${closeAddCards}

    click element                       ${menuProject}
    wait until element is visible       ${btnCloseProject}
    click element                       ${btnCloseProject}


    wait until element is visible       ${btnConfirmCloseProject}
    click element                       ${btnConfirmCloseProject}
    wait until element is visible       ${confirmProjectClose}

    capture page screenshot            ProjetoCancelado.png

    log to console      *** End: Cancelar um projeto ***