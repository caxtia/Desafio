*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String


*** Variables ***

${IconGitHub}        xpath=//a[@class='Header-link ']
${hMenSignUp}        xpath=//a[contains(@data-ga-click,'Sign up') and (contains(@class,'HeaderMenu'))]
${hMenSignIn}        xpath=//a[contains(@data-ga-click,'Sign in') and (contains(@class,'HeaderMenu'))]
${BtnPopUpAcc}       xpath=//button[text()='Accept' and not(contains(@class,'BtnGroup-item'))]

${iconAvatar}        xpath=//summary[contains(@data-ga-click,'icon:avatar')]

${inputUser}         xpath=//input[@name='login']
${inputPass}         xpath=//input[@name='password']
${btnSignIn}         xpath=//input[@value='Sign in']

${erroLogin}         xpath=//div[contains(@class,'flash-error') and not(contains(@class,'ajax'))]

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

# xpath editar ficheiros
${editFile}                      xpath=//button[@aria-label='Edit this file']
${btnCancelEditFile}             xpath=//a[text()='Cancel' and not(contains(@class,'inline-block'))]
${checkNewBranchEditFile}        xpath=//strong[text()='new branch']/../input
${titleEditFile}                 xpath=//input[@id='commit-summary-input']
${descriptEditFile}              xpath=//textarea[@id='commit-description-textarea']
${sendChangesEditFile}           xpath=//button[contains(text(),'Propose changes') or contains(text(),'Commit changes')]


${createPullRequest}             xpath=//button[text()='Create pull request']
${mergePullRequest}              xpath=//button[contains(text(),'Merge pull request')]
${notConflictPullRequest}        xpath=//div[contains(@class,'erging-body') and not(contains(@class,'merge-warning'))]/h3[text()='This branch has no conflicts with the base branch']
${confirmMerge}                  xpath=//button[contains(text(),'Confirm merge')]
${deleteBranch}                  xpath=//button[contains(text(),'Delete branch')]
${pullMergeSucess}               xpath=//h4[contains(text(),'Pull request successfully merged and closed')]

# spath settings branch
${settingBranch}                 xpath=//a[contains(@data-selected-links,'repo_branch_settings') and not(contains(@class,'js-responsive-underlinenav-item'))]
${titleSettingsBranch}           xpath=//h2[contains(text(),'Default branch')]
${includAdminSettingsBranch}     xpath=//span[contains(text(),'restrictions above for administrators.')]/../label/input[@checked='checked']
${reqPullSettingsBranch}         xpath=//span[contains(text(),'When enabled, all commits')]/../label/input[@checked='checked']

#selecionar branch
${clickOptionSelectBranch}       xpath=//summary[@title='Switch branches or tags']

${alertMergBlock}                xpath=//div[text()='Merging is blocked']
${needReviewBlock}               xpath=//h3[contains(text(),'Review required')]
${closePullRequest}              xpath=//span[text()='Close pull request']

# xpath novo projeto
${btnNewProject}                 xpath=//a[text()='New project' and (contains(@class,'d-block'))]
${nameNewProject}                xpath=//input[@id='project_name']
${radButnProjectPublic}          xpath=//input[@id='project_public_true']
${radButnProjectPrivad}          xpath=//input[@id='project_public_false']
${btnCreateProject}              xpath=//button[text()='Create project']
${SelectTemplate}                xpath=//summary[(@aria-haspopup='menu') and not(contains(@class,'Header'))]
${addToDo}                       xpath=//span[(@class='js-project-column-name') and (text()='To do')]/../../../button

${closeAddCards}                 xpath=//button[@aria-label='Hide project triage' and (contains(@class,'project-pane-close'))]
${menuProject}                   xpath=//span[text()='Menu']
${btnCloseProject}               xpath=//button[@data-dialog-id='close-project']
${btnConfirmCloseProject}        xpath=//button[contains(text(),'Close project') and not(contains(@class,'project-dialog-button'))]
${confirmProjectClose}           xpath=//span[(contains(@title,'Closed on'))]