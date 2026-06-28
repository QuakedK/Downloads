<img width="978" height="512" alt="512262293-682f12a4-9015-40b5-816a-69d0189b6da1" src="https://github.com/user-attachments/assets/d037f540-dc2f-498a-aa04-a4d239b8f18a" />

# Power Plan not importing?
1. Simple open CMD as admin and paste the following ↓
```
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /t REG_DWORD /d "0" /f
```
2. Restart your pc!
3. Re-run the [Power Importer](https://github.com/QuakedK/Downloads/blob/main/(Quaked)%20Power%20Plan%20Import.bat).
