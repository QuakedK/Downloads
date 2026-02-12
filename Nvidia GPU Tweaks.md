# Nvidia GPU Tweaks
<img width="978" height="512" alt="image" src="https://github.com/user-attachments/assets/757cb2f9-728e-46bb-ae97-5a2be4c8cb80" />

# Download Failed?
1. Download and extract [NvidiaGPUTweaks.zip](https://github.com/QuakedK/Downloads/blob/main/NvidiaGPUTweaks.zip).
2. Drag the file to your C Drive. Example ```"C:\NvidiaGPUTweaks"```
3. Now rename it to ```"C:\Nvidia GPU Tweaks"```.
4. Make sure you remove the extra NvidiaGPUTweaks folder. The folder Struture should be the following.

```"C:\Nvidia GPU Tweaks"```.

```"C:\Nvidia GPU Tweaks\Backup"```.

```"C:\Nvidia GPU Tweaks\Nvidia Container"```.

```"C:\Nvidia GPU Tweaks\Nvidia Profile Inspector"```.

# Revert
1. Go to ```"C:\Nvidia GPU Tweaks\Backup"``` and make sure ```Nvidia.reg``` exist.
2. If it does, open ```"C:\Nvidia GPU Tweaks\Nvidia Log.txt"``` and copy the Nvidia GPU Reg Path.
3. Now open CMD as admin, then paste the following.
 ```
:: Delete Tweaked Reg Command
reg delete "Your Nvidia GPU Reg Path" /f

:: Exmple
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /f
```
4. Now paste the following.
 ```
reg delete "HKCR\DesktopBackground\Shell\NvidiaContainer" /f
```
5. Now right-click ```"C:\Nvidia GPU Tweaks\Backup\Nvidia.reg"``` and click Open/Merge.
6. Now Restart!

**Note: If Nvidia.reg backup failed to copy/backup, you cannot do this!**
