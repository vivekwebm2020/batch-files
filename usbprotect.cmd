REM CMD script written by: Jose L. Quiñones
REM email: josequinones@codefidelio.org
REM twitter: @josequinones
REM Enable/Disable USB write on storage devices
REM This script will modify registry entries to modify USB behaviour, changes
REM to registry must be made before connecting USB storage.

@echo off
if {%1}=={} goto SYNTAX
setlocal
set key="HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies"
if {%1}=={on} goto ON
if {%1}=={off} goto OFF
goto END
:ON
reg.exe ADD %key% /v WriteProtect /t REG_DWORD /d 1 /f>nul 2>&1
goto end
:OFF
reg.exe ADD %key% /v WriteProtect /t REG_DWORD /d 0 /f>nul 2>&1
goto end
:SYNTAX
echo "syntax: usbprotect [on|off]"
:END
endlocal