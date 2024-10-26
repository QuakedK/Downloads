@echo off
echo Reinstalling All Mircosoft Packages!
PowerShell -Command "Get-AppXPackage | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}"
echo Mircosoft Packages installed successfully!
timeout 2 > nul

echo Reverting Service Changes!
reg add "HKLM\System\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "3" /fd
sc config wlidsvc start= demand
sc config DisplayEnhancementService start= demand
sc config DiagTrack start= demand
sc config DusmSvc start= demand
sc config TabletInputService start= demand
sc config RetailDemo start= demand
sc config Fax start= demand
sc config SharedAccess start= demand
sc config lfsvc start= demand
sc config WpcMonSvc start= demand
sc config SessionEnv start= demand
sc config MicrosoftEdgeElevationService start= demand
sc config edgeupdate start= demand
sc config edgeupdatem start= demand
sc config autotimesvc start= demand
sc config CscService start= demand
sc config TermService start= demand
sc config SensorDataService start= demand
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config shpamsvc start= demand
sc config diagnosticshub.standardcollector.service start= demand
sc config PhoneSvc start= demand
sc config TapiSrv start= demand
sc config UevAgentService start= demand
sc config WalletService start= demand
sc config TokenBroker start= demand
sc config WebClient start= demand
sc config MixedRealityOpenXRSvc start= demand
sc config stisvc start= demand
sc config WbioSrvc start= demand
sc config icssvc start= demand
sc config Wecsvc start= demand
sc config XboxGipSvc start= demand
sc config XblAuthManager start= demand
sc config XboxNetApiSvc start= demand
sc config XblGameSave start= demand
sc config SEMgrSvc start= demand
sc config iphlpsvc start= demand
sc config Backupper Service" start= demand
sc config BthAvctpSvc start= demand
sc config BDESVC start= demand
sc config cbdhsvc start= demand
sc config CDPSvc start= demand
sc config CDPUserSvc start= demand
sc config DevQueryBroker start= demand
sc config DevicesFlowUserSvc start= demand
sc config dmwappushservice start= demand
sc config DispBrokerDesktopSvc start= demand
sc config TrkWks start= demand
sc config dLauncherLoopback start= demand
sc config EFS start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config IKEEXT start= demand
sc config NPSMSvc start= demand
sc config WPDBusEnum start= demand
sc config PcaSvc start= demand
sc config RasMan start= demand
sc config RetailDemo start=disabled
sc config SstpSvc start=disabled
sc config ShellHWDetection start= demand
sc config SSDPSRV start= demand
sc config SysMain start= demand
sc config OneSyncSvc start= demand
sc config lmhosts start= demand
sc config UserDataSvc start= demand
sc config UnistoreSvc start= demand
sc config Wcmsvc start= demand
sc config FontCache start= demand
sc config W32Time start= demand
sc config tzautoupdate start= demand
sc config DsSvc start= demand
sc config DevicesFlowUserSvc_5f1ad start= demand
sc config diagsvc start= demand
sc config DialogBlockingService start= demand
sc config PimIndexMaintenanceSvc_5f1ad start= demand
sc config MessagingService_5f1ad start= demand
sc config AppVClient start= demand
sc config MsKeyboardFilter start= demand
sc config NetTcpPortSharing start= demand
sc config ssh-agent start= demand
sc config SstpSvc start= demand
sc config OneSyncSvc_5f1ad start= demand
sc config wercplsupport start= demand
sc config WMPNetworkSvc start= demand
sc config WerSvc start= demand
sc config WpnUserService_5f1ad start= demand
sc config WinHttpAutoProxySvc start= demand
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Enable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Enable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Enable
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Enable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Enable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Enable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Enable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Enable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable
schtasks /Change /TN "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Enable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Enable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Enable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Enable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Enable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Enable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Enable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Enable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Enable
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Enable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Enable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Enable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Enable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Enable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Enable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Enable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Enable
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Enable
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Enable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Enable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Enable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Enable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Enable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Enable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Enable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Enable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Enable
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Enable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Enable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Enable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Enable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Enable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Enable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Enable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Enable
sc config uhssvc start= demand
sc config upfc start= demand
sc config PushToInstall start= demand
sc config BITS start= demand
sc config InstallService start= demand
sc config uhssvc start= demand
sc config UsoSvc start= demand
sc config wuauserv start= demand
sc config LanmanServer start= demand
sc config NlaSvc start= demand
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upfc" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uhssvc" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ossrs" /v Start /t reg_dword /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpdatePeriod" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgrade" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferUpgradePeriod" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdates" /Enable
schtasks /Change /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /Enable
schtasks /Change /TN "Microsoft\Windows\InstallService\SmartRetry" /Enable
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates" /Enable
schtasks /Change /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates" /Enable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Report policies" /Enable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Enable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /Enable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /Enable
schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Enable
schtasks /Change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /Enable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Enable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Enable
sc config RemoteRegistry start= demand
sc config RemoteAccess start= demand
sc config WinRM start= demand
sc config RmSvc start= demand
sc config PrintNotify start= demand
sc config Spooler start= demand
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Enable
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Enable
sc config BTAGService start= demand
sc config bthserv start= demand
sc config LanmanWorkstation start= demand
sc config WdiServiceHost start= demand
sc config NcbService start= demand
sc config ndu start= demand
sc config Netman start= demand
sc config netprofm start= demand
sc config WwanSvc start= demand
sc config Dhcp start= auto
sc config DPS start= auto
sc config lmhosts start= auto
sc config NlaSvc start= auto
sc config nsi start= auto
sc config RmSvc start= auto
sc config Wcmsvc start= auto
sc config Winmgmt start= auto
sc config WlanSvc start= auto
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Enable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "3" /f
net start DPS
net start nsi
net start NlaSvc
net start Dhcp
net start Wcmsvc
net start RmSvc
wmic path win32_networkadapter where index=0 call disable
wmic path win32_networkadapter where index=1 call disable
wmic path win32_networkadapter where index=2 call disable
wmic path win32_networkadapter where index=3 call disable
wmic path win32_networkadapter where index=4 call disable
wmic path win32_networkadapter where index=5 call disable
wmic path win32_networkadapter where index=0 call enable
wmic path win32_networkadapter where index=1 call enable
wmic path win32_networkadapter where index=2 call enable
wmic path win32_networkadapter where index=3 call enable
wmic path win32_networkadapter where index=4 call enable
wmic path win32_networkadapter where index=5 call enable
arp -d *
route -f
nbtstat -R
nbtstat -RR
netcfg -d
netsh winsock reset
netsh int 6to4 reset all
netsh int httpstunnel reset all
netsh int ip reset
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
netsh branchcache reset
ipconfig /release
ipconfig /renew
echo Services Reverted successfully!
timeout 2 > nul

Echo Enabling StorSvc!
sc config StorSvc start=auto
echo StorSvc Enabled successfully!


echo You need to restart your PC. Press any key to continue...
pause >nul
shutdown /r /t 0
