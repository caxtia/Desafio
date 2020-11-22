*** Settings ***
Resource  Steps/Eliminar repositorio GitHub_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}


*** Test Cases ***
Eliminar repositorio GitHub
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Pesquisar um repositorio
    ...                 eliminar um repositorio
    ...                 se o parametro de entrada estiver a vazio, o teste executa, pois é selecionado um repos de automação
    ...                 que inicie em AUT

    Realizar Login na pagina web GitHub
    Eliminar um repositorio                 ${nomeRepositorio}