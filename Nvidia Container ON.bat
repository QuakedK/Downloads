:: Made by Quaked
:: TikTok: _Quaked_
:: Discord: https://discord.gg/8NqDSMzYun

:: Enable Nvidia Container 1. (Nvidia Control Panel, etc)
sc config NVDisplay.ContainerLocalSystem start=auto >nul 2>&1
sc start NVDisplay.ContainerLocalSystem >nul 2>&1

:: Enable Nvidia Container 2. (Nvidia App, Clipping and Overlays)
sc config NvContainerLocalSystem start=auto >nul 2>&1
sc start NvContainerLocalSystem >nul 2>&1

exit