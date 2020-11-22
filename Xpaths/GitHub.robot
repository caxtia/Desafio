*** Settings ***
Library     Selenium2Library
Library     BuiltIn
Library     String


*** Variables ***

# Exemplo Negacao: //a[contains(@data-ga-click,'Sign up') and not(contains(@class,'HeaderMenu'))]
${IconGitHub}        xpath=//a[@class='Header-link ']
${hMenSignUp}        xpath=//a[contains(@data-ga-click,'Sign up') and (contains(@class,'HeaderMenu'))]
${hMenSignIn}        xpath=//a[contains(@data-ga-click,'Sign in') and (contains(@class,'HeaderMenu'))]
${BtnPopUpAcc}       xpath=//button[text()='Accept' and not(contains(@class,'BtnGroup-item'))]

${iconAvatar}        xpath=//summary[contains(@data-ga-click,'icon:avatar')]

${inputUser}         xpath=//input[@name='login']
${inputPass}         xpath=//input[@name='password']
${btnSignIn}         xpath=//input[@value='Sign in']

${erroLogin}         xpath=//div[contains(@class,'flash-error') and not(contains(@class,'ajax'))]
#//div[contains(@class,'flash-error') and not(contains(@class,'ajax'))]

# Xpaths de criacao de repositorio
${iconAddRepos}              xpath=//summary[contains(@data-ga-click,'Header, create new')]
${selectNewReposit}          xpath=//a[contains(text(),'  New repository')]
${h1CreatRepos}              xpath=//h1[contains(text(),'Create a new repository')]
${inputNomRepos}             xpath=//input[@id='repository_name']
${Check}                     xpath=//input[contains(@class,'is-autocheck-successful')]
${inputDescriptRepos}        xpath=//input[@id='repository_description']

${radButnPublic}             xpath=//input[@id='repository_visibility_public']
${radButnPrivad}             xpath=//input[@id='repository_visibility_private']
${InicialzReadmeFile}        xpath=//input[@id='repository_auto_init']
${InicialzGit}               xpath=//label[contains(text(),'Add .gitignore')]/../input
${InicialzLicense}           xpath=//label[contains(text(),'Choose a license')]/../input
${btnCreatRepos}             xpath=//button[contains(text(),'Create repository')]

#Xpath Pesquisa de repositorio
${inputSearch}              xpath=//input[@aria-label='Search or jump to…']

${btnFork}                  xpath=//button[contains(@data-ga-click,'fork')]

##xpath eliminar repositorios
${settingsInsideRepo}       xpath=//a[contains(@href,'settings') and not(contains(@role,'menuitem')) and not(contains(@class,'Header'))]
${deleteRepo}               xpath=//summary[contains(text(),'Delete this repository')]
${inputConfirmDeleteRepo}   xpath=//form[contains(@action,'delete')]/p/input
${confirmDeleteRepo}        xpath=//span[text()='I understand the consequences, delete this repository']

##xpath Criacao de issues
${selectMenuIssues}         xpath=//span[@data-content='Issues']
${btnNewIssue}              xpath=//span[text()='New issue']
${bodyNewIssue}             xpath=//textarea[@placeholder='Leave a comment']
${titleNewIssue}            xpath=//input[@id='issue_title']
${submitNewIssue}           xpath=//button[contains(text(),'Submit new issue') and not(contains(@class,'btn-block '))]
${AssignNewIssue}           xpath=//details[@id='assignees-select-menu']
${ProjectNewIssue}          xpath=//details[@id='projects-select-menu']
${DeleteIssue}              xpath=//strong[text()='Delete issue']
${AlertDeleteIssue}         xpath=//h4[text()='Are you sure you want to delete this issue?']
${ConfirmDeleteIssue}       xpath=//button[contains(text(),'Delete this issue')]
${closeIssue}               xpath=//span[text()='Close issue']


