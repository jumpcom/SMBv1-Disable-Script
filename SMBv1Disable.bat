@echo off
goto check_Permissions

:check_Permissions

    net session >nul 2>&1
    if %errorLevel% == 0 (
    ECHO "Force Disable SMBv1 Server,Client .. Chetaphong Preecha"

	ECHO "Disable server side"
	PowerShell -Command "Remove-WindowsFeature FS-SMB1"
	PowerShell -Command "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force"
	PowerShell -Command "Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 -Force"

	ECHO "Disable client side"
	PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol"
	sc.exe config lanmanworkstation depend= bowser/mrxsmb20/nsi  
	sc.exe config mrxsmb10 start= disabled
	PAUSE
    ) else (
        echo Failure: Current permissions inadequate.
	echo RUN AS ADMIN !!!!
	PAUSE
    )

:END