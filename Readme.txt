
1 - instalar python-2.7.15.amd64 (https://www.python.org/downloads/release/python-2715/)
e instalar na pasta C:\Python27


2- instalar PyCharm e adicionar pluggins
	- https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=windows&code=PCC
	- File -> Settings -> Pluggins
		- Instalar:  IntelliBot e IntelliBot @SeleniumLibrary Patched

3- Executar linha de comandos como admin e instalar as seguintes librarias (pip list para validar a instalação):
	- pip install robotframework==3.0.4
	- pip install selenium==3.8.1
	- pip install decorator==4.4.0
	- pip install --upgrade robotframework-seleniumlibrary
	 


4 - Dentro do Pycharm
	- File -> Settings -> Tools -> External Tools
		- clicar no " + ", Name: Robot-SingleTest   ; Program: C:\Python27\Scripts\robot.exe   ; Arguments: -d Results -v ENV:QA --test "$SelectedText$" "$FileDir$"
			Working directory: $FileDir$

	- File -> Settings -> Tools -> Web Browser
		- Selecionar o Chrome, Default Browser: Custom Path    C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

5 - Download do ChromeDriver
	- https://chromedriver.chromium.org/downloads  (Ver a versão do chrome para validar qual driver a utilizar) 
	- coloca-lo em C:\Program Files (x86)\Google\Chrome\Application e C:\Python27\Scripts



Para executar cada teste:

1- Dentro da pasta Testes e Web, existem os casos de teste desenvolvidos.
	Abrir um deles selecionar o nome, clicar com o botão direito do rato, External-Tools ->Robot-SingleTest 
