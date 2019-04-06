rem This original file can be download at https://pastebin.com/BY6Z3dip
rem This file is a backup, do not use it!
rem --------------------------------------
rem Palafix est un logiciel entièrement concu par Wistaro.
rem Toute reutilisation sans citer l'auteur est interdite!
:CHECKSUM

cls
@echo off

set last_version=201
set jre64BundleId=236888_42970487e3af4f5aa5bca3f542482c60
set jre32BundleId=236886_42970487e3af4f5aa5bca3f542482c60
set pourcentVal=1

echo Verification du fichier Palafix
cd %temp%
if exist "CheckSumExcepted.txt" (
	del /s CheckSumExcepted.txt>nul
)
echo Chargement en cours...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pastebin.com/raw/8ignUd5R', 'CheckSumExcepted.txt')"
set /p CheckSumExcepted= < CheckSumExcepted.txt
echo ------ Clef de validation attendue: %CheckSumExcepted%
CertUtil -hashfile "%~dpnx0" MD5 | find /i /v "md5" | find /i /v "certutil" >> checksumPalafix.txt
setlocal EnableDelayedExpansion
set /p $CKS= < checksumPalafix.txt
set $CKS=!$CKS: =!
echo !$CKS! >> checksumPalafix2.txt
set /p CheckSumVal= < checksumPalafix2.txt
echo o|del /s "checksumPalafix.txt">nul
echo o|del /s "checksumPalafix2.txt">nul
echo ------ Clef de validation lue: %CheckSumVal%


if %CheckSumExcepted%==%CheckSumVal% (
	goto MENU	
) else (
	color 4
	echo.
	echo.
	echo Erreur critique
	echo.
	echo Le fichier Palafix est corrompu ou a ete modifie.
	echo Tentez de le re telecharger via http://bit.ly/TutoPalafix
	echo sinon contactez moi sur Discord: Wistaro#9308
	pause>nul
	exit /B 0
)
	
:MENU
cls
title Palafix v2.0 - By Wistaro
color 06
cd %~dp0
echo Verification de l'interface....
if exist "interface.bat" (
	echo Interface trouvee!
	
) else (
	echo Telechargement de l'interface...
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Wistaro/Palafix/master/interface.bat', 'interface.bat')"
	echo Telechargement termine!
	echo Interface telechargee!
	echo.
)
echo Verification du loader....

if exist "loading.bat" (
	echo Loader trouve!
	
) else (
	echo Telechargement du loader
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Wistaro/Palafix/master/loading.bat', 'loading.bat')"
	echo Telechargement termine!
	echo Loader telecharge!
	echo.
)

echo.
echo.
echo Interface utilisateur chargee avec succes!
echo.
echo.
call %~dp0/interface.bat


cd %temp%
for /f "delims=" %%x in (palafixResp.txt) do set resp=%%x
cd %~dp0
if %resp%==1 goto STARTVERIF
if %resp%==2 goto RESETGUI
if %resp%==3 goto ACCESSLOG
if %resp%==4 goto LAUNCH
if %resp%==5 goto RUNFILE

:RUNFILE
cls
if exist "%userprofile%\Desktop\StartPaladium.bat" (echo o|del /s %userprofile%\Desktop\StartPaladium.bat>nul )
echo @echo off >> "%userprofile%\Desktop\StartPaladium.bat"
echo if exist "%%appdata%%\.paladium\launcher\settings\profiles.xml" (del %%appdata%%\.paladium\launcher\settings\profiles.xml /f /q) >> "%userprofile%\Desktop\StartPaladium.bat"
echo if exist "%%appdata%%\.paladium\bootstrap\bootstrap\bootstrap.jar" ( >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	echo Lancement du launcher... >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	java.exe -jar "%%appdata%%\.paladium\bootstrap\bootstrap\bootstrap.jar"  >> "%userprofile%\Desktop\StartPaladium.bat"
echo ) else ( >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	echo Erreur! Launcher classique introuvable! >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	if not exist "%%userprofile%%\Desktop\Paladium.jar" ( >> "%userprofile%\Desktop\StartPaladium.bat"
echo 		echo Telechargement du laucher patch... >> "%userprofile%\Desktop\StartPaladium.bat"
echo 		cd "%%userprofile%%\Desktop" >> "%userprofile%\Desktop\StartPaladium.bat"
echo 		powershell -Command "(New-Object Net.WebClient).DownloadFile('http://download.paladium-pvp.fr/launcher/download/PaladiumLauncher-patch.jar', 'Paladium.jar')" >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	) >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	echo Lancement du launcher patch... >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	cd "%%userprofile%%\Desktop" >> "%userprofile%\Desktop\StartPaladium.bat"
echo 	java.exe -jar "Paladium.jar" >> "%userprofile%\Desktop\StartPaladium.bat"
echo ) >> "%userprofile%\Desktop\StartPaladium.bat"
echo exit /B 0 >> "%userprofile%\Desktop\StartPaladium.bat"
echo Un fichier StartPaladium.bat a ete creer sur le bureau. Double-cliquez dessus a chaque fois que vous voudrez lancer Paladium. Il remplace le fichier Paladium.exe, si vous rencontrez des problemes avec celui-ci.
color A 
echo.
echo Palafix a termine de traiter les donnees.
echo.
echo Appuyez sur une touche pour revenir au menu.
pause>nul
goto MENU

:STARTVERIF
echo.
echo.
echo Demarrage du logiciel en cours...
echo.
rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Verification des droits Administrateurs
ATTRIB %windir%\system32 -h | FINDSTR /I "system32" >nul
        IF %ERRORLEVEL% NEQ 1 (
             color 4
			 echo Erreur: vous n'êtes pas administrateur du pc!
			 echo Palafix doit être lancé en mode administrateur pour fonctionner.
			 pause
			 exit /b 0
        )
echo ---- OK

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" & cd %userprofile%/desktop & start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Verification du systeme d'exploitation...


setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" echo ---- Vous utilisez Windows 8.1
if "%version%" == "6.2" echo ---- Vous utilisez Windows 8.
if "%version%" == "6.1" echo ---- Vous utilisez Windows 7.
if "%version%" == "6.0" echo ---- Vous utilisez Windows Vista. Cette version est obsolete, je vous recommande de mettre a jour votre systeme
if "%version%" == "10.0" echo ---- Vous utilisez Windows 10.
if "%version%" == "5.1" echo ---- Vous utilisez Windows XP. Cette version est obsolete, je vous recommande de mettre a jour votre systeme
endlocal

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo Verification de l'architecture du processeur...

Set _os_bitness=64
IF %PROCESSOR_ARCHITECTURE% == x86 (
  IF NOT DEFINED PROCESSOR_ARCHITEW6432 Set _os_bitness=32
  )
Echo ---- Architecture %_os_bitness% bit trouvee
echo.
echo Fermeture des processus Java ouverts si existants...
TaskList | findstr /c:javaw.exe > nul
If %errorlevel%== 0 taskkill /f /T /im javaw.exe 
TaskList | findstr /c:java.exe > nul
If %errorlevel%== 0 taskkill /f /T /im java.exe 
echo ---- Fait ! 

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo Recherche de la derniere version de Java disponible...
echo ---- Java 1.8 (64/32 bits) update %last_version%
echo.
echo Recherche de la version de Java installee....
set nbVersion=0;

:CHECKJAVA

for /l %%v in (101, 10, %last_version%) do (
	set jversion=%%v
  	if exist "C:\Program Files\Java\jre1.8.0_%%v\bin\javaw.exe" (
	set /A nbVersion+=1 
	echo - Version detectee: Java 1.8 %_os_bitness% bits, update %%v		
	)	
)
goto RESULTJAVA

:RESULTJAVA

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
if %nbVersion%==0 (goto NOJAVA)
if %nbVersion% gtr 1 (goto MULTIVERSION)
if %nbVersion%==1 (goto STEP2)

:NOJAVA
color 4
echo /!\ Version de Java %_os_bitness% bits introuvable. Vous allez etre redirige vers une page web pour le telecharger. 
echo Appuyez sur une touche.
pause>null
	if %_os_bitness%==64 (	
		cmd /C start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=%jre64BundleId%
	) else (
		cmd /C start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=%jre32BundleId%
	)
color F
goto FIN

:STEP2
echo Version de Java trouvee: Java 1.8 %_os_bitness% bits, update %jversion%
if %jversion% LSS %last_version% (
	color 4
	echo /!\ Java n'est pas a jour. Minecraft peut tourner avec une version pas a jour, mais pour eviter les problemes, je recommande de mettre a jour. Vous allez etre redirige vers une page web pour le telecharger. Sinon, fermez cette fenetre pour quitter. 
	echo Appuyez sur une touche.
	pause>null
	if %_os_bitness%==64 (	
		cmd /C start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=%jre64BundleId%
	) else (
		cmd /C start https://javadl.oracle.com/webapps/download/AutoDL?BundleId=%jre32BundleId%
	)
	
	color F
) else (echo ---- Java est a jour! )
echo.
:FIXOPENING

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Correction de l'ouverture des fichiers jar...
cd %temp%
if exist "Palafix.reg" (echo o|del /s Palafix.reg>nul )
echo Windows Registry Editor Version 5.00 >> "Palafix.reg" 
echo. >> "Palafix.reg"
echo [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jar\UserChoice] >> "Palafix.reg"
regedit /s "Palafix.reg">nul
assoc .jar=jarfile>nul
ftype jarfile="C:\Program Files\Java\jre1.8.0_%jversion%\bin\javaw.exe" "%%1">nul

echo --- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo.
echo Ecriture des nouvelles valeurs dans le registre...
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jar\OpenWithList /v a /f>nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jar\OpenWithList /v a /t REG_SZ /d javaw.exe /f>nul
echo ---- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo Nettoyage des fichiers residuels...
del "Palafix.reg" /q >nul
echo ---- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo.
:FIXJAVAPAL
echo Modification de la configuration du launcher pour utiliser la derniere version de Java...
cd %appdata%/.paladium/launcher/settings

rem Un bug du launcher fait que Paladium se se lance pas avec la version de Java selectionnee lors de l'installation. 
rem Le code qui suit va reecrire le fichier de config en forcant le lancement de Paladium avec la derniere version de Java. 

if exist "settings.xml" (echo o|del /s settings.xml>nul )
if exist "settings_buff.xml" (echo o|del /s settings_buff.xml>nul )
if exist "settings_buff2.xml" (echo o|del /s settings_buff2.xml>nul )

echo "<?xml version=#1.0# encoding=#UTF-8# standalone=#no#?>" >> "settings_buff.xml"
echo "<Contents>" >> "settings_buff.xml"
echo "<settings>" >> "settings_buff.xml"
echo "<working_directory>%appdata%\.paladium</working_directory>" >> "settings_buff.xml"
echo "<java_directory>C:\Program Files\Java\jre1.8.0_%jversion%\bin\javaw.exe</java_directory>" >> "settings_buff.xml"
echo "<game_directory>%appdata%\.paladium\minecraft</game_directory>" >> "settings_buff.xml"
echo "<videoloader_volume>100</videoloader_volume>" >> "settings_buff.xml"
echo "</settings>" >> "settings_buff.xml"
echo "</Contents>" >> "settings_buff.xml"

rem En batch le caractere < n'est pas echappable, d'où le code suivant qui permet de fix ça:  
setlocal enabledelayedexpansion

set FileToCheck=settings_buff.xml
set OutputFile=settings_buff2.xml

if exist "%OutputFile%" del "%OutputFile%"
for /f "usebackq delims=*" %%T in ("%FileToCheck%") do (
  echo %%T
  Set TempVar=%%T
  set TempVar=!TempVar:"= !
  echo !TempVar!>>"%OutputFile%"
  
 )
set FileToCheck=settings_buff2.xml
set OutputFile=settings.xml

 if exist "%OutputFile%" del "%OutputFile%"
for /f "usebackq delims=*" %%T in ("%FileToCheck%") do (
  echo %%T
  Set TempVar=%%T
  set TempVar=!TempVar:#="!
  echo !TempVar!>>"%OutputFile%"
  
 )
 
del /s settings_buff.xml>nul
del /s settings_buff2.xml>nul
  
echo ---- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+5 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo.
echo Correction du bug "Impossible de mettre à jour" (merci Rooky#7303 !)...
if exist "%appdata%\.paladium\launcher\settings\profiles.xml" (del %appdata%\.paladium\launcher\settings\profiles.xml /f /q>nul)
echo ---- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+4 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)


:END
color A 
echo.
echo Palafix a termine de traiter les donnees.
echo.
echo Appuyez sur une touche pour revenir au menu.
pause>nul
goto MENU
:RESETGUI
echo Palafix vous offre la possibilite de reinstaller Paladium pour corriger la plupart des autres bugs.
echo Appuyez sur Y pour reinstaller Paladium, ou appuyez sur N pour poursuivre le logiciel.

choice.exe /c:YN /n
if "%errorlevel%"=="1" goto RESET
if "%errorlevel%"=="2" goto LAUNCH

:RESET
set pourcentVal=0
echo.
echo Votre dossier paladium va etre sauvegarde sous "%appdata%/paladium_backup"
echo Ensuite, Paladium sera reinstalle et redemarrera tout seul. 
echo Remarque: cette operation peux prendre un certain temps!
echo.
echo Appuyez sur une touche pour demarrer. 
pause>nul
color 3
echo "T" >> "%temp%/options".txt 

cls
rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+20 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Reinstallation de Paladium en cours.
echo.
if exist "%appdata%/paladium_backup" (
	echo Suppression d'une sauvegarde anterieure..
	rmdir "%appdata%/paladium_backup" /s /q	
	echo.
	)	

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+20 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Sauvegarde des fichiers en cours...
xcopy "%appdata%/.paladium" "%appdata%/paladium_backup" /e /i< %temp%\options.txt >null
echo ---- Fichiers sauvegardes!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+20 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo Suppression du dossier Paladium...
rd "%appdata%/.paladium" /q /s
echo ---- Dossier Paladium supprime!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+20 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.

echo Creation d'un nouveau dossier Paladium... 
md "%appdata%/.paladium"
echo ---- Nouveau dossier cree!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+10 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.

echo Copie des fichiers de lancement...
xcopy "%appdata%/paladium_backup/bootstrap" "%appdata%/.paladium/bootstrap" /e /i < %appdata%\options.txt >null

If not exist "%appdata%/.paladium/bootstrap/bootstrap/bootstrap.jar" (

	cd %appdata% 
	md .paladium\bootstrap\bootstrap\ 
	cd "%userprofile%\Desktop"
	powershell -Command "(New-Object Net.WebClient).DownloadFile('http://download.paladium-pvp.fr/launcher/download/PaladiumLauncher-patch.jar', 'Paladium.jar')"
	
)

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+5 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.
echo Restauration des paramÃ¨tres de configuration... 
copy %appdata%\paladium_backup\minecraft\options.txt %appdata%\.paladium\minecraft\options.txt /Y>nul
copy %appdata%\paladium_backup\minecraft\optionsof.txt %appdata%\.paladium\minecraft\optionsof.txt /Y>nul
echo ---- Paladium a ete reinstalle avec succes.

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+5 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

:LAUNCH
set pourcentVal=0
color A
echo.

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+50 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo Mise a jour du fichier de configuration...
if exist "%appdata%\.paladium\launcher\settings\profiles.xml" (del %appdata%\.paladium\launcher\settings\profiles.xml /f /q>nul)
echo ---- Fait!

rem Starting Loader (Wistaro)
set /a pourcentVal=pourcentVal+50 & cd %temp% & if exist "loader.txt" (echo o|del /s loader.txt>nul )
echo %pourcentVal% > "loader.txt" &  start /min /b %~dp0/loading.bat
TIMEOUT /T 1 /NOBREAK >nul
rem End of loader config (Wistaro)

echo.

if exist "%appdata%\.paladium\bootstrap\bootstrap\bootstrap.jar" (
	echo Lancement du launcher...
	java.exe -jar "%appdata%\.paladium\bootstrap\bootstrap\bootstrap.jar" 
) else (
	echo Erreur! Launcher classique introuvable!
	if not exist "%userprofile%\Desktop\Paladium.jar" (
		echo Telechargement du laucher patch...
		cd "%userprofile%\Desktop"
		powershell -Command "(New-Object Net.WebClient).DownloadFile('http://download.paladium-pvp.fr/launcher/download/PaladiumLauncher-patch.jar', 'Paladium.jar')"
	)
	echo Lancement du launcher patch...
	cd "%userprofile%\Desktop"
	java.exe -jar "Paladium.jar"
)


echo. 
echo Attente de l'ouverture de Paladium...

:WAITRESPONSE
TaskList | findstr /c:javaw.exe > nul
If %errorlevel%== 0 exit /B 0


goto WAITRESPONSE

goto FIN
 
:MULTIVERSION
color 4
echo.
echo %nbVersion% version de Java ont ete trouvee. Je vous recommande de desinstaller les version obsoletes et de relancer ce logiciel.
color F
goto FIN

:UPDATEJAVA
echo Java est pas a jour. 

:ACCESSLOG
set $chemin="%appdata%\.paladium\minecraft\logs"
for /f "delims=" %%a in ('dir %$chemin% /aa/b/o-d') do (set $f="%%a"
                                               goto:next)
:next
cd %appdata%\.paladium\minecraft\logs
start notepad.exe %$f%
start notepad.exe latest.log
goto MENU
:FIN
color F
echo Fin du logiciel
pause>null
