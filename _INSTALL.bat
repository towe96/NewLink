@echo off
echo Creating directory...
mkdir "C:\Links">nul
echo Read environment variable...
for /f "tokens=2*" %%a in ('reg query "HKCU\Environment" /v PATH 2^>^&1^|find "REG_"') do @set fn=%%b
echo Modify environment variable...
setx PATH "%fn%;C:\Links">nul
echo Copy links...
copy *.lnk C:\Links\>nul
copy newlink.bat C:\Links\>nul
chcp 1252>nul
echo Adjust "Send to"...
set name="%appdata%\Microsoft\Windows\SendTo\New link.lnk"
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = %name% >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Links\newlink.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs>nul
del CreateShortcut.vbs
echo Installation successful
pause