REM CMD script written by: Jose L. Quiñones
REM email: josequinones@codefidelio.org
REM twitter: @josequinones
REM Thsi script resets Real VNC passowrd to Pa$$w0rd if local auth is in use.

@echo off
echo "Setting Real VNC password to: Pa$$w0rd"
reg add HKLM\SOFTWARE\RealVNC\WinVNC4 /v Password /t REG_BINARY /d D89CA029F30B5F08 /f