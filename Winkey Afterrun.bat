@echo off
title Winkey Afterrun
color 9

set "HIVE=SYSTEM\CurrentControlSet"
reg.exe add "HKLM\%HIVE%\Services\sppsvc" /v "Start" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\%HIVE%\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f
echo Services successfully disabled!
timeout 2 > nul
   
cls
echo Restarting you're pc!
timeout 2 > nul
shutdown /r /t 0


