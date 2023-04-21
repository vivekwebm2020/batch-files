@echo off && setlocal
@pushd %~dp0 & fltmc | find "." && (powershell start '%~f0' ' %*' -verb runas 2>nul && exit /b)
msiexec /unreg
net stop MSIServer
icacls %systemroot%\temp /setowner "Administrators" /T /C
takeown /F %systemroot%\temp /R
icacls %systemroot%\temp\*.* /T /Grant Everyone:F
rd /s /q %systemroot%\temp
md %systemroot%\temp
rd /s /q %temp%
md %temp%
rd /s /q %windir%\Installer
md %windir%\Installer
net start MSIServer
msiexec /regserver

takeown /f "%systemroot%\Installer" /R /A /D Y
icacls "%systemroot%\Temp" /inheritance:r /grant:r Users:(OI)(CI)F /T
icacls "%systemroot%\Temp" /inheritance:r /grant:r Everyone:(OI)(CI)F /T
icacls "%systemroot%\Temp" /grant Administrators:F /T
icacls "%systemroot%\Temp" /grant Users:F /T
icacls "%systemroot%\Temp" /grant SYSTEM:F /T
icacls "%systemroot%\Temp" /grant Everyone:F /T

takeown /f "%systemroot%\Temp" /R /A /D Y
icacls "%systemroot%\Temp" /inheritance:r /grant:r Users:(OI)(CI)F /T
icacls "%systemroot%\Temp" /inheritance:r /grant:r Everyone:(OI)(CI)F /T
icacls "%systemroot%\Temp" /grant Administrators:F /T
icacls "%systemroot%\Temp" /grant Users:F /T
icacls "%systemroot%\Temp" /grant SYSTEM:F /T
icacls "%systemroot%\Temp" /grant Everyone:F /T

takeown /f "%temp%" /R /A /D Y
icacls "%temp%" /inheritance:r /grant:r Users:(OI)(CI)F /T
icacls "%temp%" /inheritance:r /grant:r Everyone:(OI)(CI)F /T
icacls "%temp%" /grant Administrators:F /T
icacls "%temp%" /grant Users:F /T
icacls "%temp%" /grant SYSTEM:F /T
icacls "%temp%" /grant Everyone:F /T

taskkill /f /im explorer* && start explorer
pause
