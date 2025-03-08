:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/B8EmFVkdFU

@echo off
title Explorer Restart
color 9

:: (Quaked) Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'Explorer Restart is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)

:: (Quaked) Explorer Restart.
echo Closing Explorer.exe!
taskkill.exe /F /IM "explorer.exe"
echo Restart Explorer.exe!
start explorer.exe
pause
