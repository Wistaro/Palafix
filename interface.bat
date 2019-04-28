<!-- :: Interface de Palafix by Wistaro. Aucune copie autorisee sans accord!
@echo off
setlocal

set /p psdUserFound= < %~dp0psdUser.txt


for /f "tokens=* delims=" %%p in (' echo %%psdUserFound%%^|mshta.exe "%~f0"') do (
         set "HTAreply=%%p"
    )
	
cd %temp%

cd %temp% & if exist "palafixResp.txt" (echo o|del /s palafixResp.txt>nul )
echo %HTAreply% > "palafixResp.txt" & cd %userprofile%/desktop
goto END



<HTML>
<HEAD>
<TITLE>Palafix v2.1.0</TITLE>

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
window.resizeTo(Wscreen/1.5,Hscreen/1.38);

function closeHTA(reply){
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   fso.GetStandardStream(1).WriteLine(reply);  
   window.close();
}

</SCRIPT>


<HTA:APPLICATION
APPLICATIONNAME = "Palafix 2.1.0"
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
<title>Palafix v2.1.0 - By Wistaro</title>
<div class="fixError"><h2><center>Palafix <small>v2.1.0</small></center></h2></div>
<p><b>Palafix est un logiciel créé par Wistaro. <br /></b>
Il permet de corriger la plupart des problèmes du launcher de Paladium
et de Java, de manière très simple et rapidement.
</p>

<p><u><b>Remerciements: </b></u> Milan#1499, Jules#0602, Rooky#7303</p>
<hr>
<div id="playerinfos">
<img src="" alt="player" height=30px id="logo"/> <span class="msgInf"><b>Joueur connecté: </b> <span id="psdUser"></span> </span>

</div>
<hr>
<div id="menu">

   <button onclick="closeHTA(1);" class="button">Vérifier & Corriger</button><span class="msgInf">Vérifie et corrige automatiquement l'installation de Paladium et de Java.</span> <br /><br /> 
   <button onclick="closeHTA(2);" class="button">Réinstaller</button><span class="msgInf">Réinstalle totalement Paladium en conservant la configuration <i>(touches, etc..)</i> </span><br /><br /> 
   <button onclick="closeHTA(3);" class="button">Logs</button><span class="msgInf">Lis le dernier fichier log de Paladium </span><br /><br /> 
   <button onclick="closeHTA(4);" class="button">Jouer</button><span class="msgInf">Démarre le launcher de Paladium </span><br /><br /> 
   <button onclick="closeHTA(5);" class="button">Créer raccourci</button><span class="msgInf">Crée un lanceur de Paladium sur le bureau </span><br /><br /> 

</div>   
</BODY>
<SCRIPT language="JavaScript">
if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}
var input= new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(0);
var psdUser=input.ReadLine().trim();

var span = document.getElementById('psdUser');

while( span.firstChild ) {
    span.removeChild( span.firstChild );
}
span.appendChild( document.createTextNode(psdUser) );

document.getElementById("logo").setAttribute("src", "img_palafix/"+psdUser+".png");
document.getElementById("logo").setAttribute("alt", psdUser+"'s head");
</script>
</HTML>

:END