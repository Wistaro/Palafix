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
<TITLE>Palafix v2.0.1</TITLE>

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
<title>Palafix v2.0.1 - By Wistaro</title>
<div class="fixError"><h2><center>Palafix <small>v2.0.1</small></center></h2></div>
<p><b>Palafix est un logiciel cr�� par Wistaro. <br /></b>
Il permet de corriger la plupart des probl�mes du launcher de Paladium
et de Java, de mani�re tr�s simple et rapidement.
</p>

<p><u><b>Remerciements: </b></u> Milan#1499, Jules#0602, Rooky#7303</p>
<hr>

<div id="menu">

   <button onclick="closeHTA(1);" class="button">V�rifier & Corriger</button><span class="msgInf">V�rifie et corrige automatiquement l'installation de Paladium et de Java.</span> <br /><br /> 
   <button onclick="closeHTA(2);" class="button">R�installer</button><span class="msgInf">R�installe totalement Paladium en conservant la configuration <i>(touches, etc..)</i> </span><br /><br /> 
   <button onclick="closeHTA(3);" class="button">Logs</button><span class="msgInf">Lis le dernier fichier log de Paladium </span><br /><br /> 
   <button onclick="closeHTA(4);" class="button">Jouer</button><span class="msgInf">D�marre le jeu Paladium </span><br /><br /> 
   <button onclick="closeHTA(5);" class="button">Cr�er raccourci</button><span class="msgInf">Cr�e un lanceur de Paladium sur le bureau </span><br /><br /> 

</div>   
</BODY>
</HTML>

:END