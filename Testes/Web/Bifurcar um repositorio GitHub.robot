*** Settings ***
Resource  Steps/Bifurcar um repositorio GitHub_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}


*** Test Cases ***
Bifurcar um repositorio GitHub
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Pesquisar um repositorio
    ...                 bifurcar um repositorio
    ...                 se o arametro de entrada estiver a vazio, o teste executa, pois é inserido o
    ...                 valor de um repositorio criado para o teste, e nestes casos para servir de  regressão
    ...                 quando a variavel de entrada nao tem valor no fim do fork, eliminamos o repositorio

    Realizar Login na pagina web GitHub
    ${nomeRepos}=       Selecionar o repositorio a ser bifurcado        ${nomeRepositorio}
    Bifurcar o repositorio          ${nomeRepos}        ${nomeRepositorio}