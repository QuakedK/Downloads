@echo off
color B
set "HIVE=SYSTEM\CurrentControlSet"

taskkill /f /im ctfmon.exe
REN "C:\Windows\System32\ctfmon.exe" "ctfmon.exee"
taskkill /f /im backgroundTaskHost.exe
REN "C:\Windows\System32\backgroundTaskHost.exe" "backgroundTaskHost.exee"
taskkill /f /im TextInputHost.exe
REN "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exee"
reg.exe add "HKLM\%HIVE%\Control\Class\{2d36e967-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f
reg.exe add "HKLM\%HIVE%\Control\Class\{2d36e96c-e325-11ce-bfc1-08002be10318}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
reg.exe add "HKLM\%HIVE%\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
reg.exe add "HKLM\%HIVE%\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f
reg.exe add "HKLM\%HIVE%\Control\Class\{ca3e7ab9-b2c3-2ae6-8251-579ef933890f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
reg.exe add "HKLM\%HIVE%\Services\NVDisplay.ContainerLocalSystem" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\mpssvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\webthreatdefsvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\WpnUserService" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\Dnscache" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\SystemEventsBroker" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\EventSystem" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\TimeBrokerSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\QWAVE" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\seclogon" /v "Start" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\%HIVE%\Services\SENS" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\Schedule" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\hidserv" /v "Start" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\%HIVE%\Services\NgcSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\sppsvc" /v "Start" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\%HIVE%\Services\AppXSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\edgeupdate" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\edgeupdatem" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\MicrosoftEdgeElevationService" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\SamSs" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\VaultSvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\LicenseManager" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\gpsvc" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\EventLog" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\PlugPlay" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\%HIVE%\Services\msiserver" /v "Start" /t REG_DWORD /d "2" /f
echo Closing in 3 seconds...
timeout 3 > nul
exit
