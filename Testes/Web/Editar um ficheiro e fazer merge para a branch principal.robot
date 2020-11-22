*** Settings ***
Resource  Steps/Editar um ficheiro e fazer merge para a branch principal_steps.robot
#Test Teardown       Close All Browsers

*** Variables ***
${nomeRepositorio}
${descricao}


*** Test Cases ***
Editar um ficheiro e fazer merge para a branch principal
    [Documentation]     Realização de login na página web, com username e/ou password
    ...                 escolher um repositorio, editar o ficheiro html criado para teste
    ...                 fazer commit numa nova branch, fazer pull request, validar que nao ha conflito
    ...                 fazer merge no ramo main, e validar que as alteraões estão presentes

    Realizar Login na pagina web GitHub
    Eliminar ou fechar issues no repositorio        ${nomeRepositorio}      ${tituloIssue}      ${Acao}