:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/B8EmFVkdFU

@echo off
title UAC Enabler
color 9

:: (Quaked) Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'UAC Enabler is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)

:: (Quaked) Re-enabling UAC.
echo Enabling UAC
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
pause