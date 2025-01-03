:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/B8EmFVkdFU
:: Code Inspiration: Khorvie, Calypto.
 
@echo off
title Power Plan Import
color 9

:: (Quaked) Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'Oneclick is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)

:: (Quaked) Downloading Power Plan at Start.
set "fileURL=https://github.com/QuakedK/Oneclick/raw/refs/heads/main/Downloads/PowerPlans.zip"
set "fileName=Power Plan.zip"
set "extractFolder=C:\Power Plan"
set "downloadsFolder=C:\"
if not exist "%downloadsFolder%\%fileName%" (
    curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
    timeout 1 > nul
    mkdir "%extractFolder%" > nul
    pushd "%extractFolder%"
    tar -xf "%downloadsFolder%\%fileName%" --strip-components=1
    popd
    del /q "C:\Power Plan.zip" >nul 2>&1
) else (
    echo "%fileName%" already exists in "%downloadsFolder%". >nul 2>&1
)
 
:Import
cls
color D
echo (Quaked) Importing Power Plan!
echo.
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════╗    
echo ║ Quaked Ultimate Performance ║
echo ║        Recommended!         ║
echo ╚═════════════════════════════╝
chcp 437 >nul
echo. 
echo Choose an option:
echo 1. Quaked Ultimate Performance 
echo 2. Quaked Ultimate Performance Idle Off  
echo 3. Skip!
set /p option="Enter option number: "
if "%option%"=="1" (
  echo.
  powercfg -import "C:\Power Plan\Quaked Ultimate Performance.pow"
  timeout 1 > nul
  goto :Activatecpl
) else if "%option%"=="2" (
  echo. 
  powercfg -import "C:\Power Plan\Quaked Ultimate Performance Idle Off.pow"
  timeout 1 > nul
  goto :Activatecpl
) else if "%option%"=="3" (
  echo.
  echo Skipping Power Plan Selection!
  timeout 1 > nul 
  goto :Done
) else (
  cls
  chcp 437 >nul
  powershell -Command "Write-Host 'Invalid choice, Please choose Y or N.' -ForegroundColor White -BackgroundColor Red"
  timeout 1 > nul
  goto :Import
) 

:Activatecpl
setlocal enabledelayedexpansion

:: Checking if Quaked Ultimate Performance power plan exists.
for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance"') do (
    set plan_guid=%%i
)

:: Checking if Quaked Ultimate Performance Idle Off power plan exists.
for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance Idle Off"') do (
    set idle_off_guid=%%i
)

:: Activating the existing power plan.
if defined plan_guid (
    powercfg /setactive %plan_guid% >nul 2>&1
    powercfg /setactive %idle_off_guid% >nul 2>&1
    echo. 
    echo Activated Quaked Power Plan.
    timeout 1 > nul
    goto:CheckPower     
)
endlocal

:CheckPower
cls
chcp 437 >nul
powershell -Command "Write-Host 'Opening power plan options to confirm if it imported correctly.' -ForegroundColor White -BackgroundColor Red"
powercfg.cpl
echo.
echo Did the Power Plan import correctly? (Y/N)
set /p option="Enter option number: "
if /i "%option%"=="Y" (
    taskkill /F /FI "WINDOWTITLE eq Power Options" >nul 2>&1
    goto :Done
) else if /i "%option%"=="N" (
    echo.
    echo Please select High Performance!
    echo.
    chcp 437 >nul
    powershell -Command "Write-Host 'Adding power plan fix, could solve the issue.' -ForegroundColor White -BackgroundColor Green"
    powershell -Command "Write-Host 'Once Power Plan Import is done, open power plan options and check if it''s there.' -ForegroundColor White -BackgroundColor Green"
    echo.
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /t REG_DWORD /d 0 /f
    pause
    taskkill /F /FI "WINDOWTITLE eq Power Options" >nul 2>&1
    goto :Done
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'Invalid choice, Please choose Y or N.' -ForegroundColor White -BackgroundColor Red"
    timeout 1 > nul
    goto :CheckPower
)

:Done
rd /s /q "C:\Power Plan" >nul 2>&1
exit


