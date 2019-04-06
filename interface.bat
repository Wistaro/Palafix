<!-- :: Interface de Palafix by Wistaro. Aucune copie autorisee sans accord!
@echo off
setlocal
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
cd %temp%

cd %temp% & if exist "palafixResp.txt" (echo o|del /s palafixResp.txt>nul )
echo %HTAreply% > "palafixResp.txt" & cd %userprofile%/desktop
goto END



<HTML>
<HEAD>
<TITLE>Palafix v2.0</TITLE>

<STYLE>
body {
	font-family: Arial,sans-serif;
	background-color: #E1D5D2; 

}
p{
     text-align: center;
}
 
h2 {
	border: 2px solid black;
	position: relative;
	top: -50px;
	background-color: black;
	color: white;
	
}
.button {
	margin-left: 5px;
	padding:6px 0 6px 0;
	border-radius:2px;
	background:#fff;
	font:bold 13px Arial;
	
	border: 1px solid black;
}

.msgInf {
	margin-left: 5px;
	margin-top: 5px;
	vertical-align: top ;
	display: inline-block ;

}
</STYLE>
<SCRIPT language="JavaScript">
var Hscreen=screen.height;
var Wscreen = screen.width;
window.resizeTo(Wscreen/1.5,Hscreen/1.5);


function closeHTA(reply){
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   fso.GetStandardStream(1).WriteLine(reply);  
   window.close();
}

</SCRIPT>


<HTA:APPLICATION
APPLICATIONNAME = "Palafix 1.10"
border="thin"	
borderstyle="sunken"
caption="yes"
contextmenu="no"
id="oHTA" alert(oHTA.applicationName);
innerborder="yes" 
maximizebutton="no" 
minimizebutton="no"
navigable="no"
scroll="no"
scrollflat="no"
selection="no"
showintaskbar="yes"
singleinstance="no"
sysmenu="yes"
SHOWINTASKBAR="no"
windowstate="normal"
/>
</HEAD>
<BODY>
<title>Palafix v2.0 - By Wistaro</title>
<div class="fixError"><h2><center>Palafix <small>v2.0</small></center></h2></div>
<p><b>Palafix est un logiciel créé par Wistaro. <br /></b>
Il permet de corriger la plupart des problèmes du launcher de Paladium
et de Java, de manière très simple et rapidement.
</p>

<p><u><b>Remerciements: </b></u> Milan#1499, Jules#0602, Rooky#7303</p>
<hr>

<div id="menu">

   <button onclick="closeHTA(1);" class="button">Vérifier</button><span class="msgInf">Vérifie l'installation de Paladium et de Java.</span> <br /><br /> 
   <button onclick="closeHTA(2);" class="button">Réinstaller</button><span class="msgInf">Réinstalle totalement Paladium en conservant la configuration <i>(touches, etc..)</i> </span><br /><br /> 
   <button onclick="closeHTA(3);" class="button">Logs</button><span class="msgInf">Lis le dernier fichier log de Paladium </span><br /><br /> 
   <button onclick="closeHTA(4);" class="button">Jouer</button><span class="msgInf">Démarre le jeu Paladium </span><br /><br /> 
   <button onclick="closeHTA(5);" class="button">Créer raccourci</button><span class="msgInf">Crée un lanceur de Paladium sur le bureau </span><br /><br /> 

</div>   
</BODY>
</HTML>

:END