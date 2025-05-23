@echo off
chcp 1252>nul
if "%~1"=="" goto internet
echo Path to target: %~1
set /p "name=Name of the link? "
echo Set oWS = WScript.CreateObject("WScript.Shell") > %~dp0CreateShortcut.vbs
echo sLinkFile = "C:\Links\%name%.lnk" >> %~dp0CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %~dp0CreateShortcut.vbs
echo oLink.TargetPath = "%~1" >> %~dp0CreateShortcut.vbs
echo oLink.Save >> %~dp0CreateShortcut.vbs
goto end
:internet
set /p "url=Link URL? "
set /p "name=Link Name? "
echo Set oWS = WScript.CreateObject("WScript.Shell") > %~dp0CreateShortcut.vbs
echo sLinkFile = "C:\Links\%name%.lnk" >> %~dp0CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %~dp0CreateShortcut.vbs
echo oLink.TargetPath = "C:\Software\Chrome\chrome.exe" >> %~dp0CreateShortcut.vbs
echo oLink.Arguments = "%url%" >> %~dp0CreateShortcut.vbs
echo oLink.Save >> %~dp0CreateShortcut.vbs

:end
cscript %~dp0CreateShortcut.vbs>nul
del "%~dp0CreateShortcut.vbs"