
<!-- :

@setlocal enableextensions enabledelayedexpansion
@echo off
taskkill /f /T /im mshta.exe
cd %temp%
for /f "delims=" %%x in (loader.txt) do set value=%%x



    for /f "tokens=* delims=" %%p in (' echo %%value%%^|mshta.exe "%~f0"') do (
         echo test
    )
endlocal
exit 0


<html>
<HEAD><title>Chargement en cours...</title>
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
   <style type="text/css">
   
<STYLE>
body {
	font-family: Arial,sans-serif;
	background-color: #E1D5D2; 

}

#myProgress {
  width: 100%;
  background-color: grey;
}

#myBar {
  width: 1%;
  height: 30px;
  background-color: green;
}

</STYLE>
</HEAD>
<SCRIPT Language="VBScript">
    Sub Window_Onload
        window.moveTo 0, 0
    End Sub
</SCRIPT>
<body>
    
    <script language='javascript' >
	var Hscreen=screen.height;
	var Wscreen = screen.width;
	window.resizeTo(400,100);
	
	
    var input= new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(0);
    var value=input.ReadLine();
	window.parent.document.title = 'Palafix - ' + value + '%';
	
    document.body.innerHTML = document.body.innerHTML.replace('{value ID}', value);
	
    function pipePass() {
        var pass=document.getElementById('pass').value;
        var fso= new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
        close(fso.Write(pass));
    }
	
	if(value >= 100) window.close();
	
	
</script>
<div id="myProgress">
  <div id="myBar"></div>
</div>
<script language="Javascript">
var width=12;
var elem = document.getElementById("myBar"); 
elem.style.width = value + '%'; 
</script>
</body>

</html>