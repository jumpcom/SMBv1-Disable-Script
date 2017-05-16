@echo off

    ECHO "Inject Wanacry Vaccine .. Chetaphong Preecha"

	PowerShell -windowstyle hidden -NoExit -Command "$V1 = $False;$mutex = New-Object -TypeName System.Threading.Mutex($true, \"MsWinZonesCacheCounterMutexA\", [ref]$V1);$V2 = $False;$mutex = New-Object -TypeName System.Threading.Mutex($true, \"Global\MsWinZonesCacheCounterMutexA0\", [ref]$V2);"

	PAUSE