@echo off

color 9
echo Enabling UAC...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableLUA /t REG_DWORD /d 1
echo UAC Enabled successfully.
echo.
powershell -Command "Write-Host 'Please restart your pc to take affect!' -ForegroundColor White -BackgroundColor Red"
pause