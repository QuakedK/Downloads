@echo off
title Reenable Schedule
color 9

set "HIVE=SYSTEM\CurrentControlSet"

echo Quaked Re-enabling Schedule Service
set "HIVE=SYSTEM\CurrentControlSet"
reg.exe add "HKLM\%HIVE%\Services\Schedule" /v "Start" /t REG_DWORD /d "2" /f
echo Services successfully disabled!
timeout 2 > nul
   
cls
echo Restarting you're pc!
timeout 2 > nul
shutdown /r /t 0

