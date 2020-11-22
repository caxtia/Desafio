*** Settings ***
Resource  Steps/Eliminar ou fechar uma issue_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}
${tituloIssue}

${Acao}                         # E - Eliminar  ; F  Fechar


*** Test Cases ***
Eliminar ou fechar uma issue
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 Pesquisar um repositorio
    ...                 Eliminar ou fechar uma issue

    Realizar Login na pagina web GitHub
    Eliminar ou fechar issues no repositorio        ${nomeRepositorio}      ${tituloIssue}      ${Acao}