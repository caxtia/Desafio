*** Settings ***
Resource  Steps/Criacao de Issues_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}
${tituloIssue}
${comentIssue}
${assignIssue}
${labelIssue}
${projetIssue}
${milestoneIssue}


*** Test Cases ***
Criacao de Issues
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Pesquisar um repositorio
    ...                 Criar issues
    ...                 se nao for passado valor no parametro do nome do repositorio por defeito usa o repositorio Desafio

    Realizar Login na pagina web GitHub
    Criar issues no repositorio             ${nomeRepositorio}      ${tituloIssue}      ${comentIssue}
    ...            ${assignIssue}       ${labelIssue}       ${projetIssue}      ${milestoneIssue}
