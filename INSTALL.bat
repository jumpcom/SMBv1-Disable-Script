@echo off
goto check_Permissions

:check_Permissions

    net session >nul 2>&1
    if %errorLevel% == 0 (
    ECHO "Force Disable SMBv1 Server,Client and Inject Vaccine .. Chetaphong Preecha"
	ECHO "!!!!!!!!! ignore any error !!!!!!!!!!!!!"

	ECHO "Inject WannaCrypt Vaccine On Startup using ScheduledTask"
	PowerShell -File %~dp0\module\ScheduledTaskVaccine.ps1

	call %~dp0\module\SMBv1Disable.bat

	PAUSE
    ) else (
	echo RUN AS ADMIN !!!!
	PAUSE
    )

:END