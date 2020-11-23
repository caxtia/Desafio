*** Settings ***
Resource  Steps/Criar projeto com template especifico_steps.robot
Test Teardown       Close All Browsers

*** Variables ***
${nomeProjeto}
${nomeTemplate}
${tipoPivacidade}                #Public      #Private


*** Test Cases ***
Criar projeto com template especifico
    [Documentation]     Realização de login na página web,
    ...                 Criar um novo projeto, com um template especifico
    ...                 no fim se for um teste auto (sem params de entrada no campo "nomeProjeto") o projeto e fechado

    Realizar Login na pagina web GitHub
    Criar um projeto novo com template especifico                    ${nomeProjeto}      ${tipoPivacidade}      ${nomeTemplate}
