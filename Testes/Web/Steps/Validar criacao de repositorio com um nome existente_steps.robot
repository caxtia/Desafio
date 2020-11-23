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

Criar um novo repositorio com nome existente
    [Documentation]     Selecionar o botao de criacao de repositorio
    ...                 preencher o nome do novo repositorio, com o valor de um já existente
    ...                 Validar que o erro gerado na pagina é igual ao erro passado como parametro (${descrErro})
    [Arguments]         ${nomeRepositorio}           ${descrErro}

    click element                       ${iconAddRepos}
    wait until element is visible       ${selectNewReposit}
    click element                       ${selectNewReposit}
    wait until element is visible       ${h1CreatRepos}

    input text      ${inputNomRepos}            ${nomeRepositorio}
    sleep        2
    ${Erro}=    Get text    xpath=//dd[@class='error']
    run keyword if       '${Erro}' != '${descrErro}'     fail    O erro gerado na pagina (${Erro}), não corresponde ao erro que deveria dar: ${descrErro}
    capture page screenshot     ErrorReposit.png