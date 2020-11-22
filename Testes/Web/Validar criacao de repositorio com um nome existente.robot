*** Settings ***
Resource  Steps/Validar criacao de repositorio com um nome existente_steps.robot
Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}          Desafio
${descrErro}                The repository Desafio already exists on this account.

*** Test Cases ***
Validar criacao de repositorio com um nome existente
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Criacao de um novo repositorio com o nome existente
    ...                 Validar que a página retornou a mensagem de erro pretendida.

    Realizar Login na pagina web GitHub
    Criar um novo repositorio com nome existente      ${nomeRepositorio}        ${descrErro}
