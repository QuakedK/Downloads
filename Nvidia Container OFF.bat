:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun

:: Disable Nvidia Container 1. (Nvidia Control Panel, etc)
sc config NVDisplay.ContainerLocalSystem start=disabled >nul 2>&1
sc stop NVDisplay.ContainerLocalSystem >nul 2>&1

:: Disable Nvidia Container 2. (Nvidia App, Clipping and Overlays)
sc config NvContainerLocalSystem start=disabled >nul 2>&1
sc stop NvContainerLocalSystem >nul 2>&1

exit
