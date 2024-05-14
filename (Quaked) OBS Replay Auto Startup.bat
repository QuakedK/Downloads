@echo off
title OBS Replay Auto Startup
color 9

echo (Quaked) Adding OBS to startup...
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "obs64.exe" /t REG_SZ /d "C:\Program Files\obs-studio\bin\64bit --startreplaybuffer --minimize-to-tray --disable-update --disable-shutdown-check" /f
echo OBS applied successfully, with replaybuffer starting automatically!
pause