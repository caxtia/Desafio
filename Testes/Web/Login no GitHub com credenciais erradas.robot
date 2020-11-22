*** Settings ***
Resource  Steps/Login no GitHub com credenciais erradas_steps.robot
Test Teardown       Close All Browsers

*** Variables ***


*** Test Cases ***
Login no GitHub com credenciais erradas
    [Documentation]     Realização de login na página web, com username e/ou password erradas
    ...                 de modo a validar que existiu uma mensagem de erro e o login não foi realizado

    Realizar Login na pagina web GitHub
    Validar erro de login
