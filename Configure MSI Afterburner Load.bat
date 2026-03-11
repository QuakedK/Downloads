@echo off
SETLOCAL EnableDelayedExpansion
title Load MSI Afterburner Profiles
color B
cls
mode 90, 9
set "startupPath=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
for %%i in (1 2 3 4 5) do (
    if exist "%startupPath%\LoadMsiAfterburnerProfile%%i.lnk" del "%startupPath%\LoadMsiAfterburnerProfile%%i.lnk"
)

echo.
echo   Press a number key (1 to 5) to create a shortcut for MSI Afterburner Profile X
echo.
echo   Make sure to disable MSI Afterburner's own auto-start and use this shortcut instead.
echo.

choice /c 12345 /n /m "Choose Profile (1-5): "
set "c=%errorlevel%"

set "targetPath=C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
set "arguments=/Profile%c% /Q"
set "shortcutPath=%startupPath%\LoadMsiAfterburnerProfile%c%.lnk"

cls

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut("%shortcutPath%") >> "%temp%\CreateShortcut.vbs"
echo oLink.TargetPath = "%targetPath%" >> "%temp%\CreateShortcut.vbs"
echo oLink.Arguments = "%arguments%" >> "%temp%\CreateShortcut.vbs"
echo oLink.Description = "MSI Afterburner Profile %c%" >> "%temp%\CreateShortcut.vbs"
echo oLink.IconLocation = "%targetPath%,0" >> "%temp%\CreateShortcut.vbs"
echo oLink.Save >> "%temp%\CreateShortcut.vbs"

cscript //nologo "%temp%\CreateShortcut.vbs"

del "%temp%\CreateShortcut.vbs"

cls
exit
