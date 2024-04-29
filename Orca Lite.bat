@echo off
title Orca V2
color 9

:: (Quaked) Orca Start Screen.
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                           ▒█████   ██▀███   ▄████▄   ▄▄▄      
echo.                                          ▒██▒  ██▒▓██ ▒ ██▒▒██▀ ▀█  ▒████▄    
echo.                                          ▒██░  ██▒▓██ ░▄█ ▒▒▓█    ▄ ▒██  ▀█▄  
echo.                                          ▒██   ██░▒██▀▀█▄  ▒▓▓▄ ▄██▒░██▄▄▄▄██ 
echo.                                          ░ ████▓▒░░██▓ ▒██▒▒ ▓███▀ ░ ▓█   ▓██▒
echo.                                          ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒▒   ▓▒█░
echo.                                          ░ ▒ ▒░   ░▒ ░ ▒░  ░  ▒     ▒   ▒▒ ░
echo.                                          ░ ░ ░ ▒    ░░   ░ ░          ░   ▒   
echo.                                              ░ ░     ░     ░ ░            ░  ░
echo.                                                              ░                  
echo. 
echo.                                  ╔════════════════════════════════════════════════════╗
echo.                                  ║             Version 2.0 - By Quaked                ║
echo.                                  ╚════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo.
echo. 
echo. ╔═════════╗                                                                        
echo. ║ Loading ║                                              
echo. ╚═════════╝
timeout 2 > nul              

:: (Quaked) Section 1: Disabling UpdateOrchestrator Tasks.
cls
color D
echo Disabling UpdateOrchestrator Tasks 1/3...
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineUA" /Disable
schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineCore" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" /Disable
echo UpdateOrchestrator Tasks disabled successfully.
timeout 2 > nul 

:: (Quaked) Section 2: Deleting UpdateOrchestrator Tasks.
cls
color 9
echo Now Deleting UpdateOrchestrator Tasks 2/3...
schtasks /Delete /TN "MicrosoftEdgeUpdateTaskMachineUA" /F
schtasks /Delete /TN "MicrosoftEdgeUpdateTaskMachineCore" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /F
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" /F
echo UpdateOrchestrator Tasks Deleted successfully.
timeout 2 > nul 

:: (Quaked) Section 3: Deleting UpdateOrchestrator Tasks.
cls
color D
@echo off
echo Removing UsoCoreWorker and It's Paths 3/3...
CD /D %HOMEDRIVE%%HOMEPATH%\Desktop
echo %CD%

REM ************ Main process *****************

set "usoClientFileToDelete=C:\Windows\System32\UsoClient.exe"
set "usoCoreWorkerFileToDelete=C:\Windows\UUS\amd64\MoUsoCoreWorker.exe"

REM Deleting UsoClient if exists
if exist "%usoClientFileToDelete%" (
    echo *** Taking ownership of the file ***
    takeown /F "%usoClientFileToDelete%"
    
    echo *** Adjusting permissions ***
    icacls "%usoClientFileToDelete%" /grant administrators:F

    echo *** Removing UsoClient ***
    del "%usoClientFileToDelete%" /f /q
    echo File deleted successfully.
) else (
    echo File not found: %usoClientFileToDelete%
)

REM Deleting MoUsoCoreWorker if exists
if exist "%usoCoreWorkerFileToDelete%" (
    echo *** Taking ownership of the file ***
    takeown /F "%usoCoreWorkerFileToDelete%"
    
    echo *** Adjusting permissions ***
    icacls "%usoCoreWorkerFileToDelete%" /grant administrators:F

    echo *** Removing MoUsoCoreWorker ***
    del "%usoCoreWorkerFileToDelete%" /f /q
    echo File deleted successfully.
) else (
    echo File not found: %usoCoreWorkerFileToDelete%
)
timeout 2 > nul

cls
echo Orca Lite Ran successfully, Now Continue with Oneclick!
timeout 3 > nul

exit

exit