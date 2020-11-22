*** Settings ***
Resource  Steps/Criar um repositorio no GitHub_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}
${descricao}
${tipoPivacidade}                #Public      #Private
#colocar valor da opção, e valor do repositorio ou licença a selecionar
${inicializarRepos}                    #Readme_ ; git_Actionscript ; license_Apache License 2.0


*** Test Cases ***
Criar um repositorio no GitHub
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Criacao de um novo repositorio
    ...                 Teste dinamico, se nao preencher nenhum dos parametros de entrada, sao gerados com dados dinamicos

    Realizar Login na pagina web GitHub
    Criar um novo repositorio       ${nomeRepositorio}      ${descricao}        ${tipoPivacidade}        ${inicializarRepos}
