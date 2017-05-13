@echo off
setlocal
set key="HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Licensing Core"
reg add %key% /v EnableConcurrentSessions /T REG_DWORD /D 1 /f
endlocal