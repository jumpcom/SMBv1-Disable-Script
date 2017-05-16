$PSScriptRoot = ($MyInvocation.MyCommand.Path | Split-Path | Resolve-Path).ProviderPath
Copy-Item "$PSScriptRoot\WannaCryptVaccine.bat" -Destination "C:\";

$STTrigger = New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30;
$STName = "WannaCryptVaccine";
$STAction = New-ScheduledTaskAction -Execute "C:\WannaCryptVaccine.bat";
$STSettings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd;
$STPrincipal = New-ScheduledTaskPrincipal -UserId "$(Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -expand UserName)" -RunLevel Highest

Unregister-ScheduledTask -TaskName $STName -Confirm:$false
Register-ScheduledTask $STName -Action $STAction -Trigger $STTrigger -Principal $STPrincipal -Settings $STSettings;