@echo off
color D
echo (CTT) Re-enabling IPv6...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 0 /f
powershell -Command "Enable-NetAdapterBinding -Name '*' -ComponentID ms_tcpip6" >nul 2>&1
echo IPv6 re-enabled successfully.
Pause
