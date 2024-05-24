:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/PaDWbvzJnG
:: Credit: Mathako.
 
@echo off
title Network Tweaks V1
color 9

:: (Quaked) Network Tweaks Start Screen.
:Skipwifi
cls
color 9
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.                               ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
echo.                               ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
echo.                               ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
echo.                               ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
echo.                               ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
echo.                               ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
echo.                                                              
echo.                                   ████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗███████╗           
echo.                                   ╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝           
echo.                                      ██║   ██║ █╗ ██║█████╗  ███████║█████╔╝ ███████╗           
echo.                                      ██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗ ╚════██║           
echo.                                      ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║           
echo.                                      ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝           
echo. 
echo.                                  ╔════════════════════════════════════════════════════╗
echo.                                  ║             Version 1.0 - By Quaked                ║       
echo.                                  ╚════════════════════════════════════════════════════╝
echo.
echo.
echo.                                                                          
echo Do you want to tweak your network settings?
chcp 437 >nul
powershell -Command "Write-Host 'Can cause connection issues, so be cautious. (Wouldn''t Recommend)' -ForegroundColor White -BackgroundColor Red"
set /p choice=Enter (Y/N): 
if /i "%choice%"=="Y" (
    echo Running Quaked's Networks Tweaks 
    timeout 2 > nul
    cls
    goto :NetworkTweaks
) else if /i "%choice%"=="N" ( 
    echo Skipping Quaked's Networks Tweaks...
    timeout 2 > nul
    cls
    goto :SkipNetworkTweaks
)

:: (Quaked) Network Tweaks.
:NetworkTweaks
cls
color D
chcp 437 >nul

setlocal

echo Detecting Network Adapter...

for /f "skip=1 delims=" %%a in ('wmic nic where "NetConnectionStatus=2" get NetConnectionID /value 2^>nul') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do (
        set "adapter_name=%%b"
    )
)

if defined adapter_name (
    echo Your current network adapter is: %adapter_name%
    echo.
    echo Quaked Tweaking Network Settings...
    powershell -Command "Write-Host 'This might take awhile, as the changes suppressed and nulled.' -ForegroundColor White -BackgroundColor Red"
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Flow Control' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Gigabit Master Slave Mode' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'IPv4 Checksum Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Large Send Offload V2 (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Large Send Offload V2 (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Log Link State Event' | Set-NetAdapterAdvancedProperty -RegistryValue 16" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Maximum Number of RSS Queues' | Set-NetAdapterAdvancedProperty -RegistryValue 4" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Packet Priority & VLAN' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Receive Buffers' | Set-NetAdapterAdvancedProperty -RegistryValue 512" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'TCP Checksum Offload (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'TCP Checksum Offload (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Transmit Buffers' | Set-NetAdapterAdvancedProperty -RegistryValue 512" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'UDP Checksum Offload (IPv4)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'UDP Checksum Offload (IPv6)' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wait for Link' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Advanced EEE' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'ARP Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 1" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Energy-Efficent Ethernet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Gitabit Lite' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Green Ethernet' | Set-NetAdapterAdvancedProperty -RegistryValue 0">nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'NS Offload' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Power Saving Mode' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Receive Side Scaling' | Set-NetAdapterAdvancedProperty -RegistryValue 1" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Shutdown Wake-On-Lan' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Priority & VLAN' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on Magic Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on magic packet when system is in the S0ix power state' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Wake on pattern match' | Set-NetAdapterAdvancedProperty -RegistryValue 0" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'WOL & Shutdown Link Speed' | Set-NetAdapterAdvancedProperty -RegistryValue 2" >nul 2>&1 
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Packet' | Set-NetAdapterAdvancedProperty -RegistryValue 1514" >nul 2>&1
    powershell -Command "Get-NetAdapterAdvancedProperty -Name \"%adapter_name%\" -DisplayName 'Jumbo Frame' | Set-NetAdapterAdvancedProperty -RegistryValue 1514" >nul 2>&1
    echo Network Settings appiled successfully.
) else (
    echo Unable to detect your current network adapter.
    timeout 2 > nul
)

endlocal
timeout 2 > nul

:: (Quaked) Dns Selection.
:SkipNetworkTweaks
cls
chcp 65001 >nul 2>&1
color 9
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                 ██████╗ ███╗   ██╗███████╗
echo.                                                 ██╔══██╗████╗  ██║██╔════╝
echo.                                                 ██║  ██║██╔██╗ ██║███████╗
echo.                                                 ██║  ██║██║╚██╗██║╚════██║
echo.                                                 ██████╔╝██║ ╚████║███████║
echo.                                                 ╚═════╝ ╚═╝  ╚═══╝╚══════╝
echo. 
echo.                                 ╔══════════════════════════════════════════════════════╗
echo.                                 ║ Switching dns may or may not lead to better results  ║
echo.                                 ║             Skipping this is advised!                 ║
echo.                                 ╚══════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo Choose an option
chcp 437 >nul
powershell -Command "Write-Host '1. DNS Jumper, Recommended!' -ForegroundColor White -BackgroundColor Red"
echo 2. Google Dns
echo 3. Cloudflare Dns
echo 4. Skip!

set /p option="Enter option number: "

REM Get the active network interface using PowerShell
for /f "usebackq tokens=*" %%i in (`powershell "(Get-NetAdapter | Where-Object {$_.Status -eq 'Up'}).Name"`) do (
    set "interface=%%i"
)

if "%option%"=="1" (
    set "fileURL=https://github.com/QuakedK/Downloads/raw/main/DnsJumper.exe"
    set "fileName=DnsJumper.exe" 
    set "fileURL2=https://github.com/QuakedK/Downloads/raw/main/DnsJumper.ini"
    set "fileName2=DnsJumper.ini" 
) else if "%option%"=="2" (
    echo Setting DNS to Google...
    netsh interface ipv4 add dnsservers name="%interface%" address=8.8.8.8 index=1 >nul 2>&1
    netsh interface ipv4 add dnsservers name="%interface%" address=8.8.4.4 index=2 >nul 2>&1
    echo DNS set to Google successfully.
    timeout 2 > nul
    goto :SkipDns
) else if "%option%"=="3" (
    echo Setting DNS to Cloudflare...
    netsh interface ipv4 add dnsservers name="%interface%" address=1.1.1.1 index=1 >nul 2>&1
    netsh interface ipv4 add dnsservers name="%interface%" address=1.0.0.1 index=2 >nul 2>&1
    echo DNS set to Cloudflare successfully.
    timeout 2 > nul
    goto :SkipDns
) else if "%option%"=="4" (
    echo Skipping DNS configuration.
    timeout 2 > nul
    goto :SkipDns
) 

set "downloadsFolder=%USERPROFILE%\Downloads"
chcp 65001 >nul 2>&1
echo.
echo ╔═════════════════════════════╗
echo ║                             ║
echo ║    Downloading resources    ║
echo ║                             ║
echo ╚═════════════════════════════╝
chcp 437 >nul
curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%"
curl -s -L "%fileURL2%" -o "%downloadsFolder%\%fileName2%"
if exist "%downloadsFolder%\%fileName%" (
    echo Download successful!
    if "%option%"=="1" (
        cls
        echo Starting DnsJumper...
        echo.
        start "" "%USERPROFILE%\Downloads\DnsJumper.exe"
        echo Click "fastest Dns" and then "Start Dns Test"
        echo Then click apply dns and you're done!
        pause
    ) else (
        echo Skipping!
        timeout 1 > nul
        goto :SkipDns
    )
)

:: System Restart/Reboot.
:SkipDns
cls
color 9
choice /c:R /n /m "Press R to reboot/restart your PC and apply all tweaks successfully: "
if errorlevel 1 (
    echo You pressed R. Rebooting...
    shutdown /r /t 0
) else (
    echo You didn't press R. 
    echo Please manually restart your pc!
    pause
)













































