@echo off
title Gamemode Disabler
color 9

echo (Quaked) Disabling Gamemode...
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
echo Gamemode disabled successfully.
timeout 2 > nul

cls
color D
echo Restarting your PC!
timeout 2 > nul
shutdown /r /t 0 
