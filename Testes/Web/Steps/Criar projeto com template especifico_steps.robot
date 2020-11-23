*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String
Library     OperatingSystem


Resource  ../../../Ambientes/${ENV}/config.robot
Resource  ../../../Aplicacoes/GitHub/Funcionalidades.robot
Resource  ../../../Xpaths/GitHub.robot

*** Keywords ***
Realizar Login na pagina web GitHub
    [Documentation]     Abrir Url e colocar credenciais de acesso
    [Arguments]

    Abrir URL no browser
    Realizar login no Github


Criar um projeto novo com template especifico
    [Documentation]     Criar um projeto novo, com o template especifico
    [Arguments]          ${nomeProjeto}=${EMPTY}      ${tipoPivacidade}=${EMPTY}      ${nomeTemplate}=${EMPTY}

     ${cancel}=     set variable          ${nomeProjeto}
     wait until element is visible        ${iconAvatar}
     Selecionar menu de conta               Your projects
     ${timestmp}=        Get current Date        result_format=%Y%m%d%H%M%S
     log to console      Timestamp: ${timestmp}

     ${nomeProjeto}=          set variable if    '${nomeProjeto}' != '${EMPTY}'       ${nomeProjeto}      AUT-${timestmp}
     ${tipoPivacidade}=       set variable if    '${tipoPivacidade}' != '${EMPTY}'       ${tipoPivacidade}      Private
     ${nomeTemplate}=       set variable if    '${nomeTemplate}' != '${EMPTY}'       ${nomeTemplate}      Basic kanban

     Criar um projeto novo          ${nomeProjeto}      ${tipoPivacidade}       ${nomeTemplate}
     run keyword if      '${cancel}' == '${EMPTY}'     Cancelar um projeto



