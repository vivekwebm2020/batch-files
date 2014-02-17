REM CMD script written by: Jose L. Quiñones
REM email: josequinones@codefidelio.org
REM twitter: @josequinones
REM Create a user with admin privilages on a Windows System
REm Windows XP, 7, 8, 2003, 2008/R2


@echo off

setlocal
if {%1}=={} goto syntax
if {%2}=={} goto syntax

net user %1 %2 /add
net localgroup administrators %1 /add
goto finish

:syntax
@echo Syntax: addadmin username password

:finish
endlocal