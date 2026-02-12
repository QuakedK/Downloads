:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun
:: Code Snippet Credit: p467121/Nova OS.
 
@echo off
title Gpu Tweaks V3.0
color A

:: Check for Admin Privileges. 
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    Powershell -NoProfile -Command "Write-Host 'Gpu Tweaks is required to be run as *Administrator.*' -ForegroundColor White -BackgroundColor Red" 
    Powershell -NoProfile -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    Powershell -NoProfile Start -Verb RunAs '%0'
    exit /b 0
)

:: Configuring ANSI Colors. 
set "Reset=[0m"
set "Black=[30m"
set "DarkRed=[31m"
set "DarkGreen=[32m"
set "DarkYellow=[33m"
set "DarkBlue=[34m"
set "DarkMagenta=[35m"
set "DarkCyan=[36m"
set "Gray=[37m"
set "DarkGray=[90m"
set "Red=[91m"
set "Green=[92m"
set "Yellow=[93m"
set "Blue=[94m"
set "Magenta=[95m"
set "Cyan=[96m"
set "White=[97m"

:: Downloading GPU Tools.
:Download_Tools
set "FileURL=https://github.com/QuakedK/Downloads/raw/refs/heads/main/NvidiaGPUTweaks.zip"
set "FileName=Nvidia GPU Tweaks.zip"
set "ExtractFolder=C:\Nvidia GPU Tweaks"
set "DownloadsFolder=C:\"
curl -s -L "%FileURL%" -o "%DownloadsFolder%\%FileName%"
if exist "%DownloadsFolder%\%FileName%" ( 
   mkdir "%ExtractFolder%" >nul 2>&1
   pushd "%ExtractFolder%" >nul 2>&1
   tar -xf "%DownloadsFolder%\%FileName%" --strip-components=1 >nul 2>&1
   popd >nul 2>&1
   del /q "C:\Nvidia GPU Tweaks.zip" >nul 2>&1 
   goto :Nvidia_GPU_Tweaks
) else (
   echo [%DATE% %TIME%] OpenShell: Download failed. >> "C:\Oneclick Logs\Oneclick Log.txt"
   goto :GPU_Tools_Download_Failed
)
endlocal

:: Gpu Tools failed to download. 
:GPU_Tools_Download_Failed
cls
color C
chcp 65001 >nul 2>&1
echo ╔═════════════════════════════════════════╗
echo ║ ⚠️ GPU Tools Folder failed to download. ║
echo ╚═════════════════════════════════════════╝
echo • Please ensure you're connected to the internet.
echo.
echo %White%[Choose an option]
echo %Green%1. Retry - *Tries to download the tools folder again*
echo %Cyan%2. Download Manually - *Open's Github page*
echo %DarkYellow%3. Continue Anyway - *Allows the user to run Gpu Tweaks regardless*
echo %Red%4. Exit - *Closes Gpu Tweaks*
set /p option="%White%Enter option number: "
chcp 65001 >nul 2>&1
if "%option%"=="1" (
    cls
    color A
    echo ╔═════════════════════════════════╗
    echo ║ ✅ Retrying Gpu Tools download. ║
    echo ╚═════════════════════════════════╝
    echo • Attempting download again in 2 seconds!
    timeout 2 > nul
    cls
    chcp 437 >nul
    goto :Download_Tools
) else if "%option%"=="2" (
    cls
    color A
    echo ╔═════════════════════════╗
    echo ║ ✅ Opening Github Page. ║
    echo ╚═════════════════════════╝
    echo • Launching Github page in 2 seconds!
    timeout 2 > nul
    start "" "https://github.com/QuakedK/Downloads/blob/main/Nvidia%%20GPU%%20Tweaks.md"
    echo.
    <nul set /p="→ Press any key to continue . . . "
    pause >nul
    goto :GPU_Tools_Download_Failed
) else if "%option%"=="3" (
    cls
    color C
    echo ╔════════════════════════════════╗
    echo ║ ⚠️ Continuing with Gpu Tweaks. ║
    echo ╚════════════════════════════════╝
    echo • Now continuing in 2 seconds!
    timeout 2 > nul
    cls
    chcp 437 >nul
    goto :Nvidia_GPU_Tweaks
) else if "%option%"=="4" ( 
    cls
    color A
    echo ╔════════════════════════╗
    echo ║ ✅ Exiting Gpu Tweaks. ║
    echo ╚════════════════════════╝
    echo • Now closing Gpu Tweaks in 5 seconds!
    timeout 5 > nul
    exit
) else (
    cls
    chcp 437 >nul
    Powershell -NoProfile -Command "Write-Host 'Invalid choice, Please choose options 1-4.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :GPU_Tools_Download_Failed
)

:: Nvidia GPU Tweaks. (Full Credit to p467121/Nova OS)
:Nvidia_GPU_Tweaks
cls
color A
chcp 65001 >nul 2>&1
echo ╔═══════════════════════════════╗
echo ║ ✅ Running Nvidia GPU Tweaks. ║
echo ╚═══════════════════════════════╝
setlocal
timeout 1 > nul

:: Find GPU Device Path Loop.
for /L %%i in (0,1,9) do (
    for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\000%%i" /v "ProviderName" 2^>nul') do (
	if /i "%%b"=="NVIDIA" (
		set G=000%%i
		)
	)
)

:: Log and echo Nvidia GPU Reg Path.
echo [%DATE% %TIME%] Nvidia GPU Reg Path: HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G% >> "C:\Nvidia GPU Tweaks\Nvidia Log.txt"
echo 💻 Nvidia GPU Reg Path: HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G% 
echo.

:: BinaryMask for disabling logging.
Set "BinaryMask=00ffff0f01ffff0f02ffff0f03ffff0f04ffff0f05ffff0f06ffff0f07ffff0f08ffff0f09ffff0f0affff0f0bffff0f0cffff0f0dffff0f0effff0f0fffff0f10ffff0f11ffff0f12ffff0f13ffff0f14ffff0f15ffff0f16ffff0f00ffff1f01ffff1f02ffff1f03ffff1f04ffff1f05ffff1f06ffff1f07ffff1f08ffff1f09ffff1f0affff1f0bffff1f0cffff1f0dffff1f0effff1f0fffff1f00ffff2f01ffff2f02ffff2f03ffff2f04ffff2f05ffff2f06ffff2f07ffff2f08ffff2f09ffff2f0affff2f0bffff2f0cffff2f0dffff2f0effff2f0fffff2f00ffff3f01ffff3f02ffff3f03ffff3f04ffff3f05ffff3f06ffff3f07ffff3f" 

:: Creating Nvidia Reg Backup.
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" "C:\Nvidia GPU Tweaks\Backup\Nvidia.reg" /y >nul 2>&1
if errorlevel 1 (
    echo [%DATE% %TIME%] Nvidia GPU Reg Backup: Failed to create. >> "C:\Nvidia GPU Tweaks\Nvidia Log.txt"
) else ( 
    echo [%DATE% %TIME%] Nvidia GPU Reg Backup: Created successfully. >> "C:\Nvidia GPU Tweaks\Nvidia Log.txt"
)

echo • Running Nvidia Profile Inspector.
"C:\Nvidia GPU Tweaks\Nvidia Profile Inspector\nvidiaProfileInspector.exe" -importProfile "C:\Nvidia GPU Tweaks\Nvidia Profile Inspector\NovaOS.nip" >nul 2>&1
if errorlevel 1 (
    echo [%DATE% %TIME%] Nvidia Profile Inspector: Failed to run and import. >> "C:\Nvidia GPU Tweaks\Nvidia Log.txt"
) else (
    echo [%DATE% %TIME%] Nvidia Profile Inspector: Ran successfully. >> "C:\Nvidia GPU Tweaks\Nvidia Log.txt"
)

echo • Adding Nvidia Container Toggle to Context Menu.
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Icon /t REG_SZ /d "C:\Nvidia GPU Tweaks\Nvidia Profile Inspector\nvidiaProfileInspector.exe,0" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v MUIVerb /t REG_SZ /d "Nvidia Container" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v Position /t REG_SZ /d "Bottom" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer" /v SubCommands /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer" /v MUIVerb /t REG_SZ /d "Enable Container" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\EnableNvContainer\command" /ve /t REG_SZ /d "C:\Nvidia GPU Tweaks\Nvidia Container\Nvidia Container ON.bat" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v HasLUAShield /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer" /v MUIVerb /t REG_SZ /d "Disable Container" /f >nul 2>&1
reg add "HKCR\DesktopBackground\Shell\NvidiaContainer\Shell\DisableNvContainer\command" /ve /t REG_SZ /d "C:\Nvidia GPU Tweaks\Nvidia Container\Nvidia Container OFF.bat" /f >nul 2>&1

echo • Disabling NVIDIA Driver Notification.
reg add "HKCU\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /v "NotifyNewDisplayUpdates" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Enabling NVIDIA Control Panel Developer Settings.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "NvDevToolsVisible" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Hiding NVIDIA Tray Icon.
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvTray" /v "StartOnLogin" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "HideXGpuTrayIcon" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\CoProcManager" /v "ShowTrayIcon" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Display Power Savings.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\NVIDIA Corporation\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Runtime Power Management.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Enabling GPU Performance Counters for All Users.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmProfilingAdminOnly" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling DLSS Indicator.
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NGXCore" /v "ShowDlssIndicator" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling HD Audio D3Cold.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableHDAudioD3Cold" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Hardware Fault Buffer.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHwFaultBuffer" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Per Intr DPC Queueing.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePerIntrDPCQueueing" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Engine Gatings.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElcg" /t REG_DWORD /d "1431655765" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMBlcg" /t REG_DWORD /d "286331153" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpg" /t REG_DWORD /d "4095" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMSlcg" /t REG_DWORD /d "262131" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMFspg" /t REG_DWORD /d "15" /f >nul 2>&1

echo • Disabling GC6.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Feature" /t REG_DWORD /d "699050" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGC6Parameters" /t REG_DWORD /d "85" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDidleFeatureGC5" /t REG_DWORD /d "44731050" /f >nul 2>&1

echo • Disabling Hot Plug Support.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHotPlugSupportDisable" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling the Paged DMA mode for FBSR.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Post L2 Compression.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Logging.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmRcWatchdog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLogonRC" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMIntrDetailedLogs" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMCtxswLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNvLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMSuppressGPIOIntrErrLog" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "LogDisableMasks" /t REG_BINARY /d "%BinaryMask%" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogWarningEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogPagingEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogEventEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\nvlddmkm\Parameters" /v "LogErrorEntries" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling USB-C PMU event logging in RM.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMUsbcDebugMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Feature Disablement.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableFeatureDisablement" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling breakpoint on DEBUG resource manager on RC errors.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmBreakonRC" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling SMC on a specific GPU.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDebugSetSMCMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling LRC coalescing.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableLRCCoalescing" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling I2C Nanny.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmEnableI2CNanny" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Latency Tolerance.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrOverride" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMPcieLtrL12ThresholdOverride" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Pre OS Apps.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisablePreosapps" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Enabling RmPerfLimitsOverride.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPerfLimitsOverride" /t REG_DWORD /d "21" /f >nul 2>&1

echo • Disabling RMGCOffFeature.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMGCOffFeature" /t REG_DWORD /d "2" /f >nul 2>&1

echo • Disabling ASPM.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideSupportChipsetAspm" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMDT" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableGpuASPMFlags" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableASPMAtLoad" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Event Tracer.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMEnableEventTracer" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Error Checks.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SkipSwStateErrChecks" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Advanced Error Reporting.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMAERRForceDisable" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling OPSB Feature.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM580312" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling WAR.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmWar1760398" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Configuring Low Power Features.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMLpwrArch" /t REG_DWORD /d "349525" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrGrPgSwFilterFunction" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCtrlMsDifrSwAsrParameters" /t REG_DWORD /d "5461" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmLpwrCacheStatsOnD3" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Configuring Paging Features.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmPgCtrlParameters" /t REG_DWORD /d "1431655765" /f >nul 2>&1

echo • Disabling MSCG from RM side.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDwbMscg" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling BBX Inform.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableInforomBBX" /t REG_DWORD /d "15" /f >nul 2>&1

echo • Enabling Prefer System Memory Contiguous.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Configuring SEC2 to not use profile with APM task enabled.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmSec2EnableApm" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Slowdowns.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmOverrideIdleSlowdownSettings" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMClkSlowDown" /t REG_DWORD /d "71303168" /f >nul 2>&1

echo • Disabling bunch of Power features as WAR for Bug.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RM2644249" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling 10 types of ACPI calls from the Resource Manager to the SBIOS.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableACPI" /t REG_DWORD /d "1023" /f >nul 2>&1

echo • Disabling Native PCIE L1.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNativePcieL1WarFlags" /t REG_DWORD /d "16" /f >nul 2>&1

echo • Forcing Disable Clear perfmon and reset level when entering D4 state.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMResetPerfMonD4" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling the WDDM power saving mode for FBSR.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrWDDMMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling the File based power saving mode for Linux.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmFbsrFileMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling EDC replay.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f >nul 2>&1

echo • Disabling LPWR FSMs On Init.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMElpgStateOnInit" /t REG_DWORD /d "3" /f >nul 2>&1

echo • Forcing never power off the MIOs.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmMIONoPowerOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Optimal Power For Padlink Pll.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableOptimalPowerForPadlinkPll" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling the power-off-dram-pll-when-unused feature.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmClkPowerOffDramPllWhenUnused" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling 6 Power Savings.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMOPSB" /t REG_DWORD /d "10914" /f >nul 2>&1

echo • Forcing P0 State.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Async P-States
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "DisableAsyncPstates" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling Slides MCLK.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SlideMCLK" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling UPHY Init sequence.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMNvlinkUPHYInitControl" /t REG_DWORD /d "16" /f >nul 2>&1

echo • Disabling Genoa System Power Controller.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmGpsGenoa" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Control Panel Telemetry.
reg add "HKLM\Software\Nvidia Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Telemetry Data.
reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Registry Caching.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableRegistryCaching" /t REG_DWORD /d "15" /f >nul 2>&1

echo • Enable D3 PC Latency.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "D3PCLatency" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Disabling MS Hybrid.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "EnableMsHybrid" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Illegal Compstat Access.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableIntrIllegalCompstatAccess" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Setting Panel Refresh Rate.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "SetPanelRefreshRate" /t REG_DWORD /d "0" /f >nul 2>&1

echo • Disabling Non-Contiguous Allocation.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMDisableNoncontigAlloc" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Unrestricting Application Clock Permissions.
nvidia-smi.exe -acp 0 >nul 2>&1

echo • Disabling HDCP.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%G%" /v "RmDisableHdcp22" /t REG_DWORD /d "1" /f >nul 2>&1

echo • Removing Driver Audio Bloat.
if exist "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll" (
    for %%C in (Display.3DVision Display.Audio Ansel) do (
        Rundll32.exe "C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.dll",UninstallPackage %%C >nul 2>&1
    )
)

echo • Removing NvBackend From Startup.
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f >nul 2>&1

echo • Removing Telemetry and Camera Files.
for /d %%F in ("%SystemDrive%\Windows\System32\DriverStore\FileRepository\nv_dispig.inf_amd64_*") do (
    takeown /f "%%F" /r /d Y >nul 2>&1
    icacls "%%F" /grant "%USERNAME%":F /t >nul 2>&1
    del /s /q "%%F\NvTelemetry64.dll" >nul 2>&1
    rd /s /q "%%F\NvCamera" >nul 2>&1
    del /s /q "%%F\Display.NvContainer\plugins\LocalSystem\_DisplayDriverRAS.dll" >nul 2>&1
)

echo • Deleting NVIDIA Corporation Folders.
Takeown /F "C:\Windows\System32\drivers\NVIDIA Corporation" /R /D Y >nul 2>&1
Icacls "C:\Windows\System32\drivers\NVIDIA Corporation" /grant "%USERNAME%":F /T >nul 2>&1
rd /s /q "C:\Windows\System32\drivers\NVIDIA Corporation" >nul 2>&1

echo • Deleting other NVIDIA Folders.
rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\Display.NvContainer\plugins\LocalSystem\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\Program Files\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1
rd /s /q "%SystemDrive%\ProgramData\NVIDIA Corporation\DisplayDriverRAS" >nul 2>&1
endlocal

echo ✔  Nvidia GPU tweaked successfully.
echo.
<nul set /p="→ Press any key to continue . . . "
pause >nul
exit