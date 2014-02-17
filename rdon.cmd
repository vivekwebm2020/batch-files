@echo off
setlocal
if {%1}=={} goto syntax

:loop
if {%1}=={} goto finish
set remote="\\%1\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server"
shift
reg.exe ADD %remote% /v fDenyTSConnections /t REG_DWORD /d 0 /f>nul 2>&1
if NOT %ERRORLEVEL% EQU 0 @echo %remote% NOT found.
goto loop

:syntax
@echo Syntax: Remoterdon Computer1 [Computer2 .... Computern]
goto loop

:finish
endlocal