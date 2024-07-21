@echo off
title Windows Installer Enable
color 9

set "HIVE=SYSTEM\CurrentControlSet"
reg.exe add "HKLM\%HIVE%\Services\msiserver" /v "Start" /t REG_DWORD /d "2" /f
echo Services successfully disabled!
timeout 2 > nul
   
cls
echo Restarting you're pc!
timeout 2 > nul
shutdown /r /t 0


