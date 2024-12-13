:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/B8EmFVkdFU
 
@echo off
title Power Plan Import
color 9

:: (Quaked) Downloading Power Plan at Start.
set "fileURL=https://github.com/QuakedK/Downloads/raw/main/PowerPlans.zip"
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

:SetUp
cls
echo (Quaked) Installing and Setting up Power Plan!
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
set /p option="Enter option number: "
if "%option%"=="1" (
  echo.
  powercfg -import "C:\Power Plan\Quaked Ultimate Performance.pow"
  timeout 2 > nul
  goto :Activatecpl
) else if "%option%"=="2" (
  echo. 
  powercfg -import "C:\Power Plan\Quaked Ultimate Performance Idle Off.pow"
  timeout 2 > nul
  goto :Activatecpl
) else (
  cls
  chcp 437 >nul
  powershell -Command "Write-Host 'Invalid choice, Please choose Y or N.' -ForegroundColor White -BackgroundColor Red"
  timeout 2 > nul
  goto :SetUp
) 

:Activatecpl
setlocal enabledelayedexpansion

:: Checking if Quaked Ultimate Performance power plan exists
for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance"') do (
    set plan_guid=%%i
)

:: Checking if Quaked Ultimate Performance Idle Off power plan exists
for /f "tokens=2 delims=:(" %%i in ('powercfg /list ^| findstr /C:"Quaked Ultimate Performance Idle Off"') do (
    set idle_off_guid=%%i
)

REM Activate the existing plan
if defined plan_guid (
    powercfg /setactive %plan_guid% >nul 2>&1
    powercfg /setactive %idle_off_guid% >nul 2>&1
    echo. 
    echo Activated Quaked Power Plan.
    echo. 
    echo Opening Power Plan Selection to Confirm.
    powercfg.cpl 
    pause    
)

