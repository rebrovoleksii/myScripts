regedit.exe /s ChangeExectutionPolicy.reg
echo 1>C:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
xcopy Microsoft.PowerShell_profile.ps1 "C:\Users\Administrator\Documents\WindowsPowerShell" /Y
pause
powershell.exe