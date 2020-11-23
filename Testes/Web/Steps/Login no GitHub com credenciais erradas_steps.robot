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
    click element                       ${hMenSignIn}
    wait until element is visible       ${btnSignIn}
    input text      ${inputUser}            TesteAUT
    input text      ${inputPass}            123
    click element                       ${btnSignIn}


Validar erro de login
    [Documentation]     Validar a existência de erro ao tentar realizar o login
    ...                 Erro: Incorrect username or password.
    [Arguments]

    ${Erro}=    Get text    ${erroLogin}
    capture page screenshot     Erro.png
    should be equal        ${Erro}       Incorrect username or password.