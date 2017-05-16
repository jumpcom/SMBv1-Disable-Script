@echo off
echo Check status of 2 vaccine. true is working
PowerShell -Command "$V1 = $False;$mutex = New-Object -TypeName System.Threading.Mutex($true, \"MsWinZonesCacheCounterMutexA\", [ref]$V1);$V2 = $False;$mutex = New-Object -TypeName System.Threading.Mutex($true, \"Global\MsWinZonesCacheCounterMutexA0\", [ref]$V2);$V1 = -not $V1;$V2 = -not $V2;echo Vaccine1:$V1,Vaccine2:$V2"
PAUSE