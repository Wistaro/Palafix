@echo off
cd %appdata%/.paladium/

set $fichier=config.xml
set $fichier3=launcher_patch.xml
set $fichier2=launcher/settings/profiles.xml
set $chaine=displayName
set $chaine2=display_name
set $remplace=AAA
set psdUser=Steve
echo.
echo *************************************************
if exist output.txt ( 
echo Suppression des fichiers temporaires...
del output.txt
) else (
echo Pret.
)
echo.
echo Verification des fichiers du launcher...

if not exist %$fichier% (
	echo.
	echo Configuration du launcher patch introuvable [fichier launcher1.xml]
	echo Recherche d'autres fichiers de config...
	
	if not exist %$fichier2% ( 
	
			if not exist %$fichier3% (
				echo.
				echo Erreur, aucun compte trouve.
				pause
				exit /b 0
			)else (
					echo.
					echo Configuration launcher patch v2 trouvee!
					set $fichier=launcher_patch.xml
					goto getPsdPatch
			)
		
		) else ( 
			echo.
			echo Configuration launcher classique trouvee!
			goto getPsdNormal
		)
) else ( goto getPsdPatch )

:getPsdPatch
echo.
echo Recuperation du pseudo du joueur {launcher release V6}
setlocal EnableDelayedExpansion
for /f "delims=" %%a in ('type %$fichier%') do (
    set $ligne=%%a
    set $ligne=!$ligne:%$chaine%=%$remplace%!
    echo !$ligne!>>output.txt)	

for %%f in (output.txt) do (
 
    for /f %%a in (%%f) do (
  
        for /f "delims=<AAA></AAA> tokens=2" %%a in ('echo "%%a" ^| Findstr /r "<AAA>"') do set psdUser=%%a
  
    )
     
)
goto dlHead

:getPsdNormal
echo.
echo Recuperation du pseudo du joueur {launcher classique}
cd launcher/settings/
set file=profiles.xml

setlocal EnableDelayedExpansion
for /f "delims=" %%a in ('type %file%') do (
    set $ligne=%%a
    set $ligne=!$ligne:%$chaine2%=%$remplace%!
    echo !$ligne!>>output.txt)	

for %%f in (output.txt) do (
 
    for /f %%a in (%%f) do (
  
        for /f "delims=<AAA></AAA> tokens=2" %%a in ('echo "%%a" ^| Findstr /r "<AAA>"') do set psdUser=%%a
  
    )
     
)
goto dlHead



:dlHead
echo.
echo Utilisateur trouve: %psdUser%
cd %~dp0
echo %psdUser% > psdUser.txt
md img_palafix
cd %~dp0/img_palafix
echo.
set headDownloadLink=https://minotar.net/avatar/%psdUser%
echo.
if not exist %psdUser%.png (

echo Fichier distant: %headDownloadLink%
echo Telechargement du skin...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%headDownloadLink%', '%psdUser%.png')"
echo.
echo Telechargement termine!
)

echo.
echo.
echo Tout est ok, %psdUser%.
echo *************************************************
echo.
exit /b 0