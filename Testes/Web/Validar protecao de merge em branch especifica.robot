*** Settings ***
Resource  Steps/Validar protecao de merge em branch especifica_steps.robot
Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}
${branch}
${ficheiroEditar}
${linha}

*** Test Cases ***
Validar protecao de merge em branch especifica
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Validar configurações de uma branch especifica
    ...                 Editar um ficheiro, fazer commit nova branch, e pull request
    ...                 Validar que o review e o merge está bloqueado

    Realizar Login na pagina web GitHub
    Validar configuracoes de protecao de branch         ${nomeRepositorio}      ${branch}       ${ficheiroEditar}       ${linha}
    Validar que nao e possivel realizar merging do pull request